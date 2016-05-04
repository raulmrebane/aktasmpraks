%include "macro.inc"
section .data
	fizz db "Fizz",10,0
	buzz db "Buzz",10,0
	fb   db "Fizzbuzz",10,0
	charstr db "%d",10,0

section .text

global meie_fun
extern printf

meie_fun:
	prologue

	PUSH	0
	PUSH	charstr

	.loop:

	PUSH	3
	PUSH	DWORD[EBP-4]
	CALL	REM
	
	PUSH	0
	CALL	EQUAL


	PUSH	5
	PUSH	DWORD[EBP-4]
	CALL	REM

	PUSH	0
	CALL	EQUAL	

	CALL	AND

	PUSH	1
	jmpcnd	JNE,	.not3and5

	PUSH	fb
	CALL	printf
	ADD	ESP,	4	
		
	JMP	.iter_end

	.not3and5:
	
	PUSH	3
	PUSH	DWORD[EBP-4]
	CALL	REM

	PUSH	0
	jmpcnd JNE,	.not3

	PUSH	fizz
	CALL	printf
	ADD	ESP,	4
	JMP	.iter_end
	
	.not3:
	
	PUSH	5
	PUSH	DWORD[EBP-4]
	CALL	REM
	
	PUSH	0
	jmpcnd	JNE,	.not5	

	PUSH	buzz
	CALL	printf
	ADD	ESP,	4
	JMP	.iter_end

	.not5:
	CALL	printf
	.iter_end:
	ADD	DWORD[EBP-4],	1	; i++

	PUSH	DWORD[EBP+12]
	PUSH	DWORD[EBP-4]
	jmpcnd	JLE,	.loop

	ADD	ESP,	8
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
	POP	EAX
	POP	EBX
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
