%macro prologue 0
	PUSH	EBP
	PUSH	EBX
	MOV	EBP,	ESP
%endmacro

%macro epilogue 0
	MOV	ESP,	EBP
	POP	EBX
	POP	EBP	
	RET
%endmacro

%macro jumpz 1
	POP	EBX
	MOV	EAX,	0
	CMP	EAX,	EBX
	JE	%1
%endmacro

%macro jmpcnd 2
	POP	EAX
	POP	EBX
	CMP	EAX,	EBX
	%1	%2
%endmacro

