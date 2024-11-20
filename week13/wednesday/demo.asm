comment /
Create an assembly program that creates an array (in main memory) that stores the decimal values 1,2,3,4,5,6,7,8,9,10
Create a second array (in main memory) that stores the decimal values 11, 12, 13, 14, 15
Write a procedure to calculate the sum of EVERY OTHER array value (1+3+5+7+9 = 25 and 11+13+15 = 39)
Call the procedure using both arrays and store the sum into a two new memory locations (variables in the data section)
Add comments to every instruction to the .code section
Write the program in such a way that it will work even if the number of elements is changed
In other words, avoid hard-coding when possible, so the program should use various directives and use a loop
/
.386
.model flat,stdcall
.stack 4096
.data

array1 BYTE 1,2,3		; sum should be 1+3 = 4
array1sum BYTE ?
array2 DWORD 4,5,6,7	; sum should be 4+6 = 10
array2sum DWORD ?

ExitProcess proto,dwExitCode:dword

.code
main proc
	; make sure all the parameters are in the proper registers
	; ebx = address of array, ecx = number of elements, edx = size of elements

	mov ebx, offset array1
	mov ecx, LENGTHOF array1
	mov edx, TYPE array1

	call sumEveryOther
	; we can assume eax has the sum
	mov array1sum, eax

	invoke ExitProcess,0
main endp

; -----------------------------------------------
sumEveryOther PROC
; description: calculate the sum of EVERY OTHER array value
; receives: ebx = address of array, ecx = number of elements, edx = size of elements
; returns: eax = sum of the items
; requires: nothing
;
;
; pseudocode:
; -----------------------------------------------

sumEveryOther ENDP

	ret
end main
