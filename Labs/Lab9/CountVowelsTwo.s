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

string1
	DCB	"ARM assembly language is important to learn!",0

 
;; The program Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler

;;;;;Procedure definitions;;;;

VOWEL_OR_CONSONANT PROC

    LDRB    R1, [R0], #1    ; Load the character from string1

    CMP R1, #0
    BEQ count_done  ; Check if value is zero (null terminated), exit

    ; Check if the character is a vowel
    CMP     R1, #'A'        ; Compare with 'A'
    BEQ     is_vowel        ; If equal to 'A', it's a vowel
    CMP     R1, #'E'        ; Compare with 'E'
    BEQ     is_vowel        ; If equal to 'E', it's a vowel
    CMP     R1, #'I'        ; Compare with 'I'
    BEQ     is_vowel        ; If equal to 'I', it's a vowel
    CMP     R1, #'O'        ; Compare with 'O'
    BEQ     is_vowel        ; If equal to 'O', it's a vowel
    CMP     R1, #'U'        ; Compare with 'U'
    BEQ     is_vowel        ; If equal to 'U', it's a vowel

    ; Check lowercase vowels
    CMP     R1, #'a'        ; Compare with 'a'
    BEQ     is_vowel        ; If equal to 'a', it's a vowel
    CMP     R1, #'e'        ; Compare with 'e'
    BEQ     is_vowel        ; If equal to 'e', it's a vowel
    CMP     R1, #'i'        ; Compare with 'i'
    BEQ     is_vowel        ; If equal to 'i', it's a vowel
    CMP     R1, #'o'        ; Compare with 'o'
    BEQ     is_vowel        ; If equal to 'o', it's a vowel
    CMP     R1, #'u'        ; Compare with 'u'
    BEQ     is_vowel        ; If equal to 'u', it's a vowel

    ; If it's not a vowel, it's a consonant
    B       not_vowel

is_vowel
    ADD     R2, #1          ; Increment vowel counter
    B       increment_char  ; Move to the next character

not_vowel
    ADD     R3, #1          ; Increment consonant counter

increment_char
    B       VOWEL_OR_CONSONANT ; Continue processing next character

count_done
    ENDP


;;;users main program;;;;;
Reset_Handler
    
    LDR R0, =string1
    MOV R1, #0
    MOV R2, #0
    BL VOWEL_OR_CONSONANT

STOP	
        B STOP

	END 
 