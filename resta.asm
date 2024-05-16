;Resta de tres enteros,con registros de 16 bits
section .data
	numero1 dw 45
	numero2 dw 5
	numero3 dw 10
	msg db "45 - 5 - 10 = ", 14
section .bss
	resultado resw 3
section .text
	global _start
	
_start:

;para el resultado = numero1 - numero2 - numero3
mov ax, [numero1]
sub ax, [numero2]
sub ax, [numero3]

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
mov edx, 14
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
