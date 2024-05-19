section .data
    ; Mensajes de inicio
    msg_1 db 'División de 2 números enteros de  32 bits!', 0xA  ; Mensaje inicial seguido de nueva linea
    len1 equ $ - msg_1 ; Calcula la longitud del mensaje
    msg_2 db 'Se dividiran los valores de 9 / 3', 0xA
    len2 equ $ - msg_2
    
    ; Mensaje de cierre
    msg_3 db 'El resultado es: ', 0xA ; Mensaje seguido de nueva linea
    len3 equ $ - msg_3
    
    ; Declaración de variables numéricas
    num1 dd 9  ; Primer número (32 bits)
    num2 dd 3  ; Segundo número (32 bits)
    
section .bss
    res resd 1   ; Espacio para almacenar el resultado de 32 bits


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
    mov eax, [num1]  ; Cargar num1 en eax
    mov ebx, [num2]  ; Cargar num2 en ebx
    ; Inicializar edx a 0 antes de la división
    xor edx, edx     ; Poner edx a 0
    ; Dividir eax por ebx (9/3)
    div ebx          ; Dividir eax por ebx, se guarda  en EAX
    add eax, 48 ; Sumamos 48 para pasar a ASCII
    mov [res], eax ; Guardamos el nuevo resultado
    
    ; Imprimimos el resultado de la división
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
