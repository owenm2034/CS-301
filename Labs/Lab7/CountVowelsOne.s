
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

string1
	DCB	"ARM assembly language is important to learn!",0	

 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

    ; Put the string in the memory by using DCB.
    ; Use R0 to hold the address of a character in the string.
    ; Use R1 to be the counter for vowels.
    ; Use R2 to be the counter for non-vowels.
    ; Count how many vowels and how many non-vowels are in the following string
    ; "ARM assembly language is important to learn!",0

	MOV	R1, #0  	; Initialize vowel count to 0
    MOV R2, #0      ; Initialize non-vowel count to 0
    LDR  	R3, = string1  ; Load the address of string1 into the register R3

vowel_or_consonant

	LDRB	R0, [R3]	; Load the character from string1
	
	CMP 	R0, #0     ; check if value is 0
 	beq     count_done ; null terminated, exit

    ; uppercase
    cmp R0, #'A'          ; Compare with 'A'
    beq is_vowel          ; If equal to 'A', it's a vowel
    cmp R0, #'E'          ; Compare with 'E'
    beq is_vowel          ; If equal to 'E', it's a vowel
    cmp R0, #'I'          ; Compare with 'I'
    beq is_vowel          ; If equal to 'I', it's a vowel
    cmp R0, #'O'          ; Compare with 'O'
    beq is_vowel          ; If equal to 'O', it's a vowel
    cmp R0, #'U'          ; Compare with 'U'
    
    ; lowercase
    cmp R0, #'a'          ; Compare with 'a'
    beq is_vowel          ; If equal to 'a', it's a vowel
    cmp R0, #'e'          ; Compare with 'e'
    beq is_vowel          ; If equal to 'e', it's a vowel
    cmp R0, #'i'          ; Compare with 'i'
    beq is_vowel          ; If equal to 'i', it's a vowel
    cmp R0, #'o'          ; Compare with 'o'
    beq is_vowel          ; If equal to 'o', it's a vowel
    cmp R0, #'u'          ; Compare with 'u'
    beq is_vowel          ; If equal to 'u', it's a vowel

	B not_vowel

increment_char
    ADD	R3, #1              ; increment index to the next character
	B vowel_or_consonant

not_vowel
    ADD R2, #1
	B increment_char

is_vowel
    ADD R1, #1
	B increment_char

count_done

          END	;End of the program