COMMENT /
klasjdf
asdflkjasdf
alskjdf;aslkjdf
/



; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
.data
; #############################
; #############################
; start code from 11/6/2024
; #############################
; #############################

arrayOfNumbers WORD 50, 25, 75	; WORD = 16 bits, 2 bytes

arrayofDWordValues DWORD 1,2,3
resultfromdwordaddition DWORD ?

someString BYTE "hello world", 0

prices WORD 1,2,5,99,55,102,101010b, 1FAh, 0FAh, 77o

someVar BYTE ?, ?, ?, ?

someOtherVar DWORD ?, 101b, 32, 1FAh, ?, ?, 1, 0, ?, ?

wastefulArray TBYTE 'ab', 'a', 'asdf'

; allowed to do multiple lines

var10 BYTE 1,		; this does work
	2,				; it's not a syntax error
	3,				; we tried in class
	4,				; not sure what the rule
	?				; actually is for


var11	BYTE 1
		BYTE 2, 5
		BYTE 3


; #############################
; #############################
; end code from 11/6/2024
; #############################
; #############################


; cout << 'Hello "there"';

variable BYTE "hello"	; this is an array of byte
var2 BYTE 'h', 'e', 'l', 'l', 'o'
var3 BYTE "h", "e", "l", "l", "o"
var BYTE 'hello'

; when defining variables/labels

tissue BYTE 8		; tissue = 8
tissue2 BYTE ?		; byte tissue
					; ? means uninitialized
					; #### REFERENCE SHEET ####
					; register names that start with E
					; e means extended, 32 bits
					; register names ending with H or L
					; mean high or low part of a 16 bit register
					; they will always be 8 bits

					; 5 = x, immediate cannot be destination

					; taking a "smaller" value and 
					; putting it into a "bigger value"
					; maybe i think i'm gonna overflow

					; negative values?
					; 2s complement
					; int x = 5;
					; cout << x + 2.5;
					; double y = x;


num dword 12		; num is a label
					; similar to a var identifier
					; is just a way
					; to find a memory location

variable2 dword 100  ; 32 bits

; variABLE dword 200; assembly is NOT case sensitive

					; 3 different types of data
					; to start
					; BYTE = 8 bits
					; WORD = 16 bits
					; DWORD (double word) = 32 bits
					; QWORD (quad word) = 64 bits
					; TBYTE (10 bytes) = 80 bits

ExitProcess proto,dwExitCode:dword

.code
main proc
	; new code for 11/6/2024

	; arrayofDWordValues DWORD 1,2,3
	mov ebx, arrayofDWordValues	; mov the FIRST element into EBX
	add ebx, arrayofDWordValues + 4 ; DWORD is 4 bytes
									; so in order to get the
									; 2nd value
									; i must go over 32 bits
									; or 4 bytes
	add ebx, arrayofDWordValues + 8	; 4 bytes * 2
									; move over 8 bytes
									; from the beginning
									; address of label arrayofDWordValues

	mov resultfromdwordaddition, ebx	; save the result
										; back to memory



	; arrayOfNumbers WORD 50, 25, 75	; WORD = 16 bits, 2 bytes
	; arrayOfNumbers[1] + arrayOfNumbers[2]
	; 25 + 75
	; cannot directly add the two
	; memory to memory NOT allowed
	
	; i must do this in multiple steps/indirectly
	; ax = arrayOfNumbers[1]
	; ax = ax + arrayOfNumbers[2]

	; [1] means 2nd item in array
	; 2nd item in array is how many bits away
	; from the first address?
	; that depends on the size of each element
	; this array is an array of WORD
	; so the offset is 2 bytes (or 16 bits)

	mov ax, arrayOfNumbers + 2
	add ax, arrayOfNumbers + 4
	; for add or sub instruction
	; first operand is also the destination
	; where the result is saved





	mov al, someString		; someString was defined
							; as "hello world"
							; h = 104 decimal
							; h = 68 hex
							; e = 101 decimal
							; h = 65 hex
		mov ah, someString + 1	; + 1 is a direct offset
								; of 1 BYTE
								; from the starting address
								; of someString label


	mov   ah, 'C'				
	movzx eax, tissue

	; end new code for 11/6/2024








	; new code for 11/4/2024

asdf:	mov bl, variable		; comment



	; end new code for 11/4/2024





	;mov num, variable		; not allowed to use
							; two memory operands

	mov variable, 10		; variable is
							; label
							; for array
							; of bytes

	;mov eax, tissue			; tissue is an 8 bit variable
							; this is an error
							; bc eax is 32 bits
							; mismatched/invalid operands

	; without zero extension
	; mov eax, tissue
	mov al, tissue

	mov ah, 10				; immediate values/addressing
							; the default is decimals
							; in hex, this is 0A

	mov ah, 10+1
						
						
							; can specify binary
	mov ah, 10010010b		; add a b at the end for binary
							; 9 2 in hex
							

							; can specify hex
							
	mov ah, 0abh			; for hex, add an hat the end
							; also must add a leading 0

	mov ah, 'C'				; ascii value of 43 hex, or 67 decimal
							

	movzx eax, tissue		; it'll take the value in tissue, which is 8
							; 0000 1000
							; copy into eax, which is a 32 bit register
							; and make eax = 0000 0000 0000 0000 0000 0000 0000 1000
							; in hex, eax = 0 0 0 0 0 0 0 8 

	mov al, 11111111b		; -1 in 2s complement
	movsx ax, al				; it should sign extend
								; the MSD, which is 1

	mov al, 01111111b			; since leading bit is 0
	movsx ax, al				; this is a positive #
								; so sign extend will add
								; leading 0s

	mov	eax, num	; eax = num	
					; eax is a register
					; it's provided by the h/w
					; num is a memory location
					
	mov ebx, 10		; ebx = 10
					; 10 is an immediate
					; addressing mode
					; or operand
					; hard coding
					; baked into the program
	add	eax,ebx				

	invoke ExitProcess,0
main endp
end main
