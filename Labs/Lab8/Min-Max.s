;The semicolon is uded to lead an inline documentation
;When you write your program, you could have your info at the top document lock
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
          DCD  Reset_Handler  ; reset vector
  
          ALIGN
		  
;Your Data section
	;AREA DATA
;Max 	DCD 0
MaxP 	DCD Max
;Min	DCD 0
MinP	DCD Min

N 	DCD 12
NUM1 	DCD 3, -7, 2, -2, 10, 20, 30, 15, 32, 8, 64, 66
POINTER DCD NUM1

 AREA    MYRAM, DATA, READWRITE
Max 	DCD 0
Min 	DCD 0
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

;;;;;;;;;;User Code Start from the next line;;;;;;;;;;;;;;;;;

;	Add code below to find the maximum value and 
;	the minimum value in the number array NUM1.
;	You can use the example in the notes as a reference.
;   Min in R5 and the Max in R6. 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LDR R1, N 		;Load count into R1
    LDR R2, POINTER		; load base pointer of array
	LDR R4, N


LOOP 
	LDR R3, [R2], #4	; load value from array, increment array pointer to next word
    
	CMP R1, R4
    BEQ HANDLE_FIRST_ITEM
    
    CMP R3, R5
    BGT INCREMENT_MAX
    
    CMP R3, R6
    BLT INCREMENT_MIN

    B ITERATE


INCREMENT_MIN
    MOV R5, R3
    B ITERATE


INCREMENT_MAX
    MOV R6, R3
    B ITERATE


HANDLE_FIRST_ITEM
    MOV R5, R3
    MOV R6, R3
    B ITERATE


ITERATE
    SUBS R1, R1, #1		; decrement counter
    BGT LOOP		    ; keep looping until counter is zero
    B STOP


STOP
	END 