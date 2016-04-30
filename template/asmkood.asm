%include "macro.inc"

section .data

	fizz db "Fizz",10,0
	buzz db "Buzz",10,0
	fizzbuzz   db "Fizzbuzz",10,0
	numberstr db "%d",10,0

section .text

global meie_fun
extern printf

meie_fun:
	prologue






	;write stuff here









	epilogue






























EQUAL:
	POP	ECX
	
	POP	EBX
	POP	EAX
	CMP	EAX,	EBX
	JNE	.notequal
	PUSH	1
	JMP	.fin
	.notequal:
	PUSH 	0
	.fin:
	PUSH	ECX
	RET

REM:
	POP	ECX

	XOR	EDX,	EDX
	POP	EBX
	POP	EAX
	DIV	EBX
	PUSH	EDX

	PUSH	ECX
	RET

AND:
	POP	ECX

	POP	EBX
	POP	EAX
	AND 	EAX,	EBX
	PUSH	EAX
	
	PUSH	ECX
	RET
