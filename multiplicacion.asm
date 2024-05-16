;Multiplica dos números enteros, con registros de 8 bits
section .data
	numero1 db 3
	numero2 db 5
	msg db "3 x 5 = ", 9
section .bss
	resultado resb 2
section .text
	global _start
	
_start:

;para el resultado = numero1 x numero2
mov al, [numero1]
mov bl, [numero2]
mul bl

;Convertir el resultado a ASCII
mov ah, 0
mov bl, 10
div bl

add al, '0'
mov [resultado], al
mov al, ah
add al, '0'
mov [resultado + 1], al

; Mostrar resultado
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 8
int 80h

;Valor del resultado
mov eax, 4
mov ebx, 1
mov ecx,resultado
mov edx, 2
int 80h

;Finaliza el programa
mov eax, 1
mov ebx, 0
int 80h
