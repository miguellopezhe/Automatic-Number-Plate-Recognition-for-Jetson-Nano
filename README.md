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

```bash
npm install

## Ejecución

```bash
python3 modelo.py -i /dev/video0
python3 modelo.py -i /ruta/video.mp4
