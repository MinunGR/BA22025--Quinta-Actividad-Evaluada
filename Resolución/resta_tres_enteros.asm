section .data
    ; Mensajes de inicio
    msg_1 db 'Resta de 3 números enteros de 16 bits!', 0xA  ; Mensaje inicial seguido de nueva linea
    len1 equ $ - msg_1 ; Calcula la longitud del mensaje
    msg_2 db 'Se restaran los valores de 9 y 3 y 2', 0xA
    len2 equ $ - msg_2
    
    ; Mensaje de cierre
    msg_3 db 'El resultado es: ', 0xA ; Mensaje seguido de nueva linea
    len3 equ $ - msg_3
    
    ; Declaración de variables numéricas
    num1 dw 9 ; Primer número (16 bits)
    num2 dw 3 ; Segundo número (16 bits)
    num3 dw 2 ; Tercer número (16 bits)
    res dw 0 ; Variable para guardar el resultado

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
    
    ; Restamos el número 2 al 1
    mov ax, [num1] ; Cargamos num1 en ax
    sub ax, [num2] ; Restamos num2 de ax
    mov [res], ax ; Almacenamos el resultado #1
    
    ; Restamos número 3 al resultado anterior
    mov ax, [res] ; Cargamos el resultado en ax
    sub ax, [num3] ; Restamos num3 de ax
    mov [res], ax ; Guardamos el nuevo resultado
    ; Pasamos a ASCII
    mov ax, [res] ; Cargamos el resultado nuevo en ax
    add ax, 48 ; Sumamos 48 para pasar a ASCII
    mov [res], ax 
    
    ; Imprimimos el resultado de la resta
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

    ; Llamada al sistema para salir
    mov eax, 1        ; Código de llamada al sistema para salir (sys_exit)
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Llamada al sistema
