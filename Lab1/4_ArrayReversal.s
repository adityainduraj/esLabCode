	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0,=SRC
	MOV R1,#10
	MOV R3,#1
LOOP
	STR R3,[R0],#4
	ADD R3,#1
	SUBS R1,#1
	BNE LOOP

	LDR R0,=SRC
	ADD R0,R0,#(SIZE-1)*4
	SUB R1,R0,#(OL-1)*4
	ADD R1,R1,#(SIZE-1)*4
	MOV R3,#10
UP
	LDR R4,[R0],#-4
	STR R4,[R1],#-4
	SUBS R3,#1
	BNE UP
STOP
	B STOP

SIZE EQU 10
OL EQU 2
	AREA myData,DATA,READWRITE
SRC DCD 0
	END