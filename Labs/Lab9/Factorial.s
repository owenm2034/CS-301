;The semicolon is used to lead an inline documentation
;When you write your program, you could have your info at the top document lock
;For Example:  
;;;;Your Name:  
;;;;Student Number:
;;;;Lab#:
;;;;

;;; Directives
          PRESERVE8
          THUMB       
;;; Equates
	;; Empty
;;; Includes
	;; Empty

;;; Vector Definitions 
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

	AREA    MYRAM, DATA, READWRITE

 
;; The program Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler

;;;;;Procedure definitions;;;;

FACTORIAL PROC
    PUSH {LR}             ; Save return address
    CMP R1, #0            ; Check if the input is 0
    MOVEQ R4, #1          ; If so, return 1
    BEQ _factorial_end
    
    SUB SP, SP, #4        ; Allocate space on the stack for local variables
    STR R1, [SP]          ; Store the input number on the stack
    
    SUB R5, R1, #1        ; Decrement R1 (n-1)
    MOV R1, R5            ; Preserve original value of R1
    BL FACTORIAL          ; Recursive call with n-1
    LDR R1, [SP]          ; Load the original value of n
    
    ADD R3, SP, #0        ; Load the address of R4 into R3
    MUL R4, R1, R4        ; Multiply the result by n
    
    ADD SP, SP, #4        ; Deallocate space on the stack
    ;MOV R1, R2            ; Restore original value of R1
_factorial_end
    POP {PC}              ; Return from the procedure
    ENDP

;;;users main program;;;;;

Reset_Handler

    MOV R1, #5            ; Put the input number in R1 (change to the desired input)
    BL FACTORIAL          ; Call the factorial function
    MOV R0, R4            ; Move the result to R0
    B STOP               ; Exit the program



STOP	
    B STOP
	END 
