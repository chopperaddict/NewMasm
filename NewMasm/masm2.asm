;**************************************************************************
; this is a working test asm file to try out data declarations and manipulating data in them
;preamble
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,  dwExitCode: DWORD
;**************************************************************************
;	  Start of DATA section
;Data section
.data
; define variables here
	  total DWORD ?;			;Uninitialized DWORD
	  string BYTE "Hello World", 0;				; length is 12 incl null terminator
	  ;create an array of integers (as WORDS)
	  numbers WORD 5 , 10, 15, 20, 25, 30, 50, 75, 100
;---------------------------------------------------
 ; End of DATA section
;**************************************************************************

;	  Start of CODE section (the program)
.code

; start  of our MAIN procedure - main PROC
; ************ OUR MAIN() ENTRY POINT *********************
main PROC					  ; main procedure entry point

	  ;*** set up a loop - setup section ***
	  mov eax, 0;		;clean start, remove junk in eax
;	  mov ecx, 9			  ; this is the length of our numbers array
;	  mov esi,  OFFSET numbers;		  ;push the address  of the first byte of our numbers array into  esi

; THIS WORKS JUST FINE
; loop through ascci '1' - 'xxx', breaking out  if it equals 5
	  mov al, 1
	  add al, 48
	  ; now we have ascii char '1' in al
; Start of our loop
 topofloop:
	  cmp al, (5 + 48)		  ; '5' ASCII
	  je alldone
	  inc al							  ;increment our ASCII value by 1
	  ;; this is faster than using the loop command
	  dec ecx
	  jnz topofloop
;	  loop topofloop;		  ; This decrements loop counter by 1 - loop ends when it reches zero
; end of the loop
;	  call loop1
alldone:

; GENERAL MOV experiments below here
	  mov eax, 10;					;set eax to 10 - eax = 10
	  add eax, 12;					;Add 12 to eax - eax = 22
	  mov ebx, 4;					;set ebx to 4 - ebx = 4
	  add eax, ebx;					;Add ebx to eax - eax = 22 + 4  :  26
	  mov total, eax;				;save result to our variable - total - total = 26
;	   mov al, 12345				;This ERRORS during compile- TOO LARGE a constant value

 ;------------------------------------------------------------------
 ; End of CODE section - now we exit the program gracefully
;------------------------------------------------------------------
INVOKE ExitProcess, 0

main ENDP
END main