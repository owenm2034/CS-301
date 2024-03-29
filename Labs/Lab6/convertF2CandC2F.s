
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

	MOV	R0, #70      ; Load constant 70 into R0
	MOV	R2, #9      	; Load constant 9 into R2
	
	; F to C first - C = 5 * (F - 32) / 9
	SUB	R1, R0, #32 ; subtract 32 from the current F value, store in R1
	MOV R4, #9
	SDIV	R1, R1, R4   ; divide difference by 9, store in R1
	MOV R4, #5
	MUL	R1, R1, R4	 ; multiply quotient by 5
	
	; C to F second - F = (9 * C / 5) + 32
	MOV R4, #9
	MUL	R3, R2, R4	 ; multiply by 9, store in R3
	MOV R4, #5
	SDIV	R3, R3, R4   ; divide product by 5, store in R3
	ADD	R3, R3, #32 ; add 32 to quotient, store in R3
	

          END	;End of the program