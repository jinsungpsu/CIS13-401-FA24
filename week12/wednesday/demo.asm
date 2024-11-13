.386
.model flat,stdcall
.stack 4096
.data
NUM_STUDENTS = 4000

PI EQU <3.14159>
TAX_RATE EQU <0.06>


grades DWORD 10, 20, 30, 40, ?, NUM_STUDENTS DUP(?), 100, 3998 DUP(50)


array BYTE 1,2,3,4,5
arraySize = $ - array			; $ current memory location
								; array is label for a memory location
								; arraySize will be 5
								; because there are 5 elements in there
								; it's a symbolic constant

shoe BYTE 1,2,3
arraySize2 = $ - array			; this is wrong


; new for 11/13/24

interestingString BYTE "Hello World",0	; offset to get the memory location
										; more specifically, the offset from
										; its enclosing memory segment
										; you can use VS debug, windows, memory
										; to view stuff in your memory modules

x DWORD 10
y DWORD 10
z DWORD ?

aBigVar DWORD 0AABBCCDDh			; DWORD is 32 bits
								; or 4 BYTES
								; each byte can be represented
								; using 2 hex chars

; end 11/13/24

ExitProcess proto,dwExitCode:dword

.code
main proc
	; 11/13/24 notes

	; could not mov aBigVar DWORD 0AABBCCDDh
	; into WORD or BYTE, because of operand size mismatch

	; mov ax, aBigVar is invalid

	mov ax, WORD PTR aBigVar
	; this'll move the lower 16 bits of aBigVar
	; into ax, which is the values CCDD in hex

	mov ax, WORD PTR [aBigVar+2]
	; this shifts it 2 bytes over
	; so it'll move AABB into AX

	comment /
		for (int i = 0; i < LENGTHOF array; i++) {
			cout << array[i*TYPE array];	
		}
	/



	mov eax, OFFSET interestingString

	; if i want to add the first 3 elements in the array of bytes

	mov al, array			; eax = array[0]
							; array is an array of BYTE
							; so offsets will be 1
							; don't forget for WORD, it'll be 2
							; for dword it'll be 4
							; etc.
	add al, array+1		; eax += array[1]
	add al, array+2		; eax += array[2]


	comment /

		int x = 10;
		int y = 10;
		int z = -y + (20 - x)

	/

	; first define the variables in the .data section

	mov eax, 20			; eax = 20
	sub eax, x			; eax -= x

	mov ebx, y			; ebx = y
	neg ebx				; ebx = -y

	; neg y				; y = -y, we won't do this
						; b/c it'll work for THIS equation
						; but may break our program later
						; since we are not technically
						; supposed to reassign y

	add eax, ebx		; eax += ebx

	mov z, eax			; z = eax

	mov ecx, OFFSET z







	; ends 11/13/24 notes



	mov eax, arraySize			; this should move 5 into eax


	mov eax, grades + (3999 * 4)			; 4000, index 3999
											; 3999 * 4 (bytes)
											; b/c each DWORD
											; is 4 bytes
											; and offset is done
											; by # of bytes
											; bc cell size is 8 bits
	mov eax, grades[4]

	invoke ExitProcess,0
main endp
end main
