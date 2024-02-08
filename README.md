# Automatic Number Plate Recognition for Jetson Nano

Jetson Nano SDK4.5

El objetivo del proyecto es crear un sistema automatizado de lectura de matrículas para la entrada de un parking en un Jetson Nano.
Utilizaremos un modelo de IA llamado Nvidia SSD-Mobilenet-v2 para reconocer cada vez que entre un coche al parking, permitiendo el seguimiento de cada vehículo. Cuando se detecte un vehículo, se tomará una fotografía del mismo. 
Luego, utilizaremos otro modelo de IA llamado OpenALPR a través de una API para procesar la fotografía y extraer el texto de la matrícula del vehículo.

## Tabla de Contenidos

- [Instalación](#instalación)
- [Ejecución](#Ejecución)

## Instalación
Pasos para instalar el proyecto y todas las dependencias necesarias.

**1. Primer paso: Instalación del Modelo Nvidia SSD-Mobilenet-v2**
   
Antes de clonar el repositorio, asegúrese de que el sistema esté actualizado y que las siguientes dependencias estén instaladas: git, cmake, libpython3-dev y python3-numpy.
```bash
sudo apt-get update
sudo apt-get install git cmake libpython3-dev python3-numpy
```

Una vez instaladas las dependencias, clonamos el repositorio de GitHub de manera recursiva para incluir los submódulos y nos movemos al directorio:

```bash
git clone --recursive https://github.com/dusty-nv/jetson-inference
cd jetson-inference
```

A continuación, creamos un directorio de compilación dentro del proyecto y ejecutamos cmake para configurar la compilación:

```bash
mkdir build
cd build
cmake ../
```

Durante la ejecución de cmake, podría aparecer un cuadro de diálogo para instalar PyTorch. Sin embargo, en este caso, omitiremos dicha instalación ya que no es necesaria para nuestros propósitos.

Una vez completada la configuración, asegúrese de estar dentro del directorio jetson-inference/build. Luego, ejecute los siguientes comandos para compilar las bibliotecas y realizar la instalación.

```bash
make
sudo make install
sudo ldconfig
```

Con esto, ya tendríamos las bibliotecas necesarias y el modelo instalado, listos para continuar con el proyecto.

**2. Segundo paso: Instalación de OpenCV 4.5.0**
   
Utilizaremos OpenCV para el procesamiento de imágenes de la cámara, ya que, proporciona una amplia gama de funciones y herramientas que facilitan el procesamiento de imágenes en tiempo real desde una cámara. 
Para ello, clonamos el repositorio de OpenCV 4.5.0:

```bash
git clone https://github.com/AastaNV/JEP/
```

Luego, nos movemos al directorio correspondiente y ejecutamos el script de instalación:

```bash
cd JEP/script
./install_open4.5.0_Jetson.sh
```

Una vez completada la instalación, OpenCV 4.5.0 estará disponible en el sistema y listo para su uso en el proyecto.

**2. Tercer paso: Instalación y Conexion de  mysql-connector-python**

La instalación de mysql-connector-python es necesario para poder establecer la conexión y realizar operaciones con una base de datos MySQL desde el programa Python.

```bash
pip install mysql-connector-python
```
*Nota:* En la funcion de Conexion, cambiar los parametros para vuestra base de datos

## Ejecución
Para ejecutar el modelo, puedes especificar la cámara con la opción -i o proporcionar la ruta de un archivo de video.

```bash
python3 modelo.py -i /dev/video0
python3 modelo.py -i /ruta/video.mp4
```
