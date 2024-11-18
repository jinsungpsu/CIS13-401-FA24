comment /
.data
intarray WORD 100h,200h,300h,400h
.code
mov edi,OFFSET intarray	; address of intarray
mov ecx,LENGTHOF intarray	; loop counter
mov ax,0	; zero the accumulator
L1:
add ax,[edi]	; add an integer
add edi,TYPE intarray	; point to next integer
	loop L1	; repeat until ECX = 0
/ 
.386
.model flat,stdcall
.stack 4096
.data

array WORD 1,2,3,99,55

ExitProcess proto,dwExitCode:dword

.code
main proc

	; loop/array lab
	; how many times do i need to loop?https://github.com/jinsungpsu/CIS130-401-FA24/tree/main
	; same answer as how many elements in this array?
	; same answer as what is the LENGTHOF this array

	mov ecx, LENGTHOF array					; will be how many times we loop
	mov ebx, 0								; will be a counter that starts at 0
	mov eax, 0								; my accumulator to hold all future values

LOOP_START:
	add ax, array[ebx * TYPE array]			; need to scale my offset
	inc EBX

	loop LOOP_START








	mov ecx, 5		; ecx = 5

					; for (ecx = 5; ecx != 0; ecx--)
L1:	mov eax, 1		; eax = 1
	
	loop l1

	invoke ExitProcess,0
main endp
end main
