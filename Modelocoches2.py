import jetson_inference
import jetson_utils
from centroidtracker import CentroidTracker
import datetime
import uuid
import argparse
import time
import cv2
import numpy as np
import requests
from datetime import datetime
import csv

def escribirCsv(plate_number, ahora_formato):

    # Datos que deseas agregar al archivo CSV
    nueva_linea = [plate_number, ahora_formato]

    # Nombre del archivo CSV
    nombre_archivo = '/home/nvidia/csv/matriculas.csv'

    # Abrir el archivo en modo 'a+' para agregar líneas al final y crearlo si no existe
    with open(nombre_archivo, mode='a+', newline='') as archivo_csv:
        # Crear un objeto escritor CSV
        escritor_csv = csv.writer(archivo_csv)

        # Si el archivo está vacío, agregar encabezados
        if archivo_csv.tell() == 0:
            escritor_csv.writerow(['MATRICULA', 'HORA_ACTUAL'])

        # Escribir la nueva línea en el archivo
        escritor_csv.writerow(nueva_linea)

def llamadaApi(ruta_imagen):
    regions = ['in']
    # Proporciona la ruta de la imagen
    with open(ruta_imagen, 'rb') as fp:
        response = requests.post(
                    'https://api.platerecognizer.com/v1/plate-reader/',
                    data=dict(regions=regions),
                    files=dict(upload=fp),
                    headers={'Authorization': 'Token 56734631c4cfc85b8be7ecd9a98a9ac404fd2450'})
    
    return response.json()['results'][0]['plate']

# Parsea los argumentos de línea de comandos
analizador_argumentos = argparse.ArgumentParser()
analizador_argumentos.add_argument('-i', '--input', type=str, required=True, help='Ruta al archivo de video')
argumentos = analizador_argumentos.parse_args()

# Directorio para guardar las imágenes capturadas
directorio_imagenes = ('/home/nvidia/1snap/')

# Configura la red de detección de objetos con el modelo "ssd-mobilenet-v2"
red_deteccion = jetson_inference.detectNet("ssd-mobilenet-v2", threshold=0.94)

# Abre el archivo de video para capturar frames
captura_video = cv2.VideoCapture(argumentos.input)

# Inicializa la salida de video para el seguimiento de objetos
salida_video = jetson_utils.videoOutput("file://2out/track.mp4", ["--output-codec=h265", "--bitrate=1500000"])

# Inicializa el rastreador de centroides
rastreador_centroides = CentroidTracker(maxDistance=250)

# Lista para almacenar los IDs de los objetos detectados
ids_objetos = []

# Conjunto para almacenar los IDs de objetos detectados
ids_detectados = set()

# Variables para el control de la captura de imágenes
capturar_foto = False
tiempo_inicial = None
tiempo_detec_vehiculo = {}

# Bucle principal para procesar cada frame del video
while captura_video.isOpened():
    # Lee el siguiente frame del video
    ret, frame_actual = captura_video.read()

    # Verifica si se ha alcanzado el final del video
    if not ret:
        break

    # Obtiene la fecha y hora actual para nombrar las imágenes
    ahora_formato = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    frame2 = frame_actual

    # Convierte el frame a formato RGB
    frame_actual = cv2.cvtColor(frame_actual, cv2.COLOR_BGR2RGB)
    
    # Convierte el frame a un array de NumPy
    frame_actual_np = np.array(frame_actual)

    # Convierte el array de NumPy a una imagen CUDA
    img_cuda = jetson_utils.cudaFromNumpy(frame_actual_np)

    # Lista para almacenar las coordenadas de los objetos detectados
    coordenadas_objetos = []

    # Realiza la detección de objetos en la imagen CUDA
    detecciones = red_deteccion.Detect(img_cuda)

    # Filtra las detecciones para obtener solo objetos de la clase con ID 3 (posiblemente vehículos)
    for deteccion_actual in detecciones:
        if deteccion_actual.ClassID == 3:
            coordenadas_objetos.append((int(deteccion_actual.Left), int(deteccion_actual.Bottom), int(deteccion_actual.Right), int(deteccion_actual.Top)))

    # Actualiza el rastreador de centroides con las coordenadas de los objetos detectados
    objetos_actualizados = rastreador_centroides.update(coordenadas_objetos)
    ids_objetos_actuales = []

    # Itera sobre los objetos detectados y sus coordenadas
    for id_objeto, coordenadas in objetos_actualizados.items():
        ids_objetos_actuales.append(id_objeto)

        # Verifica si se debe capturar una foto del vehículo detectado
        if not capturar_foto and id_objeto not in ids_detectados:
            tiempo_actual = time.time()

            if id_objeto not in tiempo_detec_vehiculo:
                tiempo_detec_vehiculo[id_objeto] = tiempo_actual + 1

            # Captura una foto si ha pasado un tiempo específico desde la última detección
            if (tiempo_actual - tiempo_detec_vehiculo[id_objeto]) >= 2:
                capturar_foto = True
                tiempo_inicial = tiempo_actual

        # Captura la foto del vehículo y guarda la imagen
        if capturar_foto:
            ids_detectados.add(id_objeto)

            ruta_imagen = str(directorio_imagenes + ahora_formato + "_ID" + str(id_objeto) + ".jpg")

            # Guarda la imagen en el directorio especificado
            #jetson_utils.saveImage(str(directorio_imagenes + ahora_formato + "_ID" + str(id_objeto) + ".jpg"), img_cuda)
            cv2.imwrite(ruta_imagen, frame2)

            try:
                plate_number = llamadaApi(ruta_imagen)
                print("Número de matrícula: " + plate_number.upper())
                escribirCsv(plate_number, ahora_formato)
            except:
                print("")

            # Almacena el ID del objeto capturado
            ids_objetos.append(id_objeto)

            # Reinicia la bandera de captura de foto
            capturar_foto = False
   
    # Renderiza el frame con las detecciones y texto
    salida_video.Render(img_cuda)

# Libera los recursos cuando se ha procesado completamente el video
captura_video.release()
salida_video.Close()

