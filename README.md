# BA22025 / DEC135 - QUINTA ACTIVIDAD EVALUADA - GT02 ![GitHub Org's stars](https://img.shields.io/github/stars/MinunGR?style=social)
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Escudo_de_la_Universidad_de_El_Salvador.svg/1200px-Escudo_de_la_Universidad_de_El_Salvador.svg.png" alt="LogoUes" width="30%" height="50%">
</p>

# Resolución de Quinta Actividad Evaluada DEC135

Se adjunto resolución a los ejercicios planteados en el segundo material base de la semana 10

## :heavy_check_mark:Tecnología utilizada:
- Lenguaje Ensamblador NASM

## :computer:Entorno de Desarrollo utilizado:
- <a href="https://www.tutorialspoint.com/compile_assembly_online.php">Tutorialspoint</a>

## :heavy_check_mark:Requisitos:
- Terminal

## :speech_balloon:Listado de ejercicios resueltos:

### 1. Resta de 3 enteros de 16 bits

**Archivo:** `resta_tres_enteros.asm`

**Descripción:** Este programa realiza la resta de tres números enteros usando solo registros de 16 bits. Los números son especificados en la sección de datos y el resultado de la resta se almacena y se muestra al usuario.

**Propósito:** Demostrar cómo usar registros de 16 bits para realizar una operación de resta múltiple y cómo manejar resultados en ensamblador.

### 2. Multiplicación de 2 enteros de 8 bits

**Archivo:** `multiplicacion.asm`

**Descripción:** Este programa multiplica dos números enteros utilizando registros de 8 bits. Los números a multiplicar son especificados en la sección de datos, y el resultado de la multiplicación se convierte a formato ASCII antes de mostrarse al usuario.

**Propósito:** Enseñar cómo utilizar registros de 8 bits para operaciones de multiplicación y cómo manejar y mostrar resultados en formato ASCII.

### 3. División de 2 enteros de 32 bits

**Archivo:** `division.asm`

**Descripción:** Este programa divide dos números enteros usando registros de 32 bits. Los números a dividir se especifican en la sección de datos. El programa muestra el cociente de la división, convertido a formato ASCII.

**Propósito:** Mostrar el uso de registros de 32 bits para operaciones de división y la conversión de resultados numéricos a cadenas de caracteres para su visualización.

## Uso

Para ensamblar y ejecutar los programas, necesitarás un ensamblador y un enlazador, como `nasm` y `ld`. Aquí hay un ejemplo de cómo ensamblar y ejecutar un programa:

```sh
nasm -f elf32 programa.asm -o programa.o
ld -m elf_i386 programa.o -o programa
./programa
```

## :busts_in_silhouette:Autor:
- Fernando José Barraza Álvarez  
  **BA22025**

  
| [<img src="https://avatars.githubusercontent.com/u/61745150?v=4" width=115><br><sub>Fernando José Barraza Álvarez</sub>](https://github.com/MinunGR) | 
| :---: | 
