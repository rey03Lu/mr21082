;Division de dos números enteros, usando registros de 32 bits
section .data
	numero1 dd 10
	numero2 dd 5
	msg db "10 / 5 = ", 9
section .bss
	resultado resb 1
section .text
	global _start
	
_start:

;para el resultado = numero1 / numero2
mov eax, [numero1]
mov ebx, [numero2]
xor edx, 0 
div ebx 

;convierte el resultado en caracter
add eax, 48
mov [resultado], eax

; Mostrar operacion
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 9
int 80h

;Valor del resultado
mov eax, 4
mov ebx, 1
mov ecx,resultado
mov edx, 1
int 80h

;Finaliza el programa
mov eax, 1
mov ebx, 0
int 80h
