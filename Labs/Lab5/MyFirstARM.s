
;The semicolon is used to lead an inline documentation.
;This is the first ARM Assembly language program you see in the lab.
;This program skeleton was from Dave Duguid and Trevor Douglas in summer 2013.
;When you write your program, you could have your info at the top document block.
;For Example:  Your Name, Student Number, what the program is for, and what it does etc.

;;; Directives
          PRESERVE8
          THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; stack pointer value when stack is empty
			;The processor uses a full descending stack. 
			;This means the stack pointer holds the address of the last 
			;stacked item in memory. When the processor pushes a new item 
			;onto the stack, it decrements the stack pointer and then 
			;writes the item to the new memory location.

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

	MOV	R2,	#0x01		; R2 = 0x00000001
	MOV	R3,	#0x02		; R3 = 0x00000002
		
	;Other examples to move immediate values
	MOV	R5,	#0x3210		; R5 = 0x00003210

	MOVT	R5, 	#0x7654		; R5 = 0x76543210

	MOV32	R6, 	#0x87654321	; R6 = 0x87654321

	LDR	R7,	= 0x87654321    ; R7 = 0x87654321


	ADD	R1,R2,R3		; R1 = 0x00000003
	MOV32   R3, 	#0xFFFFFFFF	; R3 = 0xFFFFFFFF
	ADDS	R1,R2,R3		; R1 = ?   
					; specify Condition Code updates

	SUBS	R1,R2,R3		; R1 = 0x00000000
					; Z = 1, C = 1

	MOV	R4, 	#0xFFFFFFFF	; R4 = 0xFFFFFFFF
	ADD	R1,R2,R4		; R1 = 0x00000000
				; Z= 0, C = 0

	ADDS	R1,R2,R4	; R1 = 0x00000000
				; Please specify Condition Code updates
				; Z = 1, C = 1


	MOV	R2,	#0x00000002	; R2 = 0x00000002
	ADDS	R1,R2,R4		; R1 = 0x00000000
					; Z = 0

   	MOV	R2,	#0x00000001	; R2 = 0x00000001
	MOV	R3,	#0x00000002	; R3 = 0x00000002
	ADDS	R1,R2,R3		; R1 = 0x00000003
					; Add some small numbers again
					; C = 0

	; Add numbers that will create an overflow
	MOV     R2, 	#0x7FFFFFFF	; R2 = 0x7FFFFFFF
	MOV	R3, 	#0x7FFFFFFF 	; R3 = 0x7FFFFFFF

	ADDS    R1,R2,R3		; R1 = 0xFFFFFFFE
					; V = 1, N = 1
					
          END	;End of the program