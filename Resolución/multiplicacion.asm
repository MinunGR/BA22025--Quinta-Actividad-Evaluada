section .data
    ; Mensajes de inicio
    msg_1 db 'Multiplicación de 2 números de  8 bits!', 0xA  ; Mensaje inicial seguido de nueva linea
    len1 equ $ - msg_1 ; Calcula la longitud del mensaje
    msg_2 db 'Se multiplicaran los valores de 3 y 2', 0xA
    len2 equ $ - msg_2
    
    ; Mensaje de cierre
    msg_3 db 'El resultado es: ', 0xA ; Mensaje seguido de nueva linea
    len3 equ $ - msg_3
    
    ; Declaración de variables numéricas
    num1 db 3  ; Primer número (8 bits)
    num2 db 2  ; Segundo número (8 bits)
    
section .bss
    res resw 1   ; Espacio para almacenar el resultado de 16 bits


section .text
    global _start

_start:
    ; Llamada al sistema para escribir
    mov eax, 4        ; Código de llamada al sistema para escribir (sys_write)
    mov ebx, 1        ; Descriptor de archivo (stdout)
    mov ecx, msg_1    ; Dirección del mensaje
    mov edx, len1       ; Longitud del mensaje 
    int 0x80          ; Llamada al sistema

    ; Llamada al sistema para escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_2
    mov edx, len2
    int 0x80

    ; Cargamos los números en registros
    mov al, [num1]  ; Cargar num1 en AL
    mov bl, [num2]  ; Cargar num2 en BL
    ; Multiplicar AL por BL (3x2)
    mul bl          ; Multiplicar AL por BL, se guarda  en AX
    add al, 48 ; Sumamos 48 para pasar a ASCII
    mov [res], al ; Guardamos el nuevo resultado
    
    ; Imprimimos el resultado de la multiplicación
    mov eax, 4 ; Llamada al sys_write
    mov ebx, 1 ; Flujo de salida estándar
    mov ecx, msg_3 ; Dirección al mensaje
    mov edx, len3 ; Longitud del mensaje
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, res ; Dirección al resultado
    mov edx, 6 ; Longitud + signo + salto de linea [aseguramos el espacio suficiente]
    int 0x80

    ; Salir del programa
    mov eax, 1      ; Código de llamada al sistema para salir (sys_exit)
    xor ebx, ebx    ; Código de salida 0
    int 0x80        ; Llamada al sistema


