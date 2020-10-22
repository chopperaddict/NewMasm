;============================
;preamble
;============================
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,  dwExitCode: DWORD
;============================
;Data section
;============================
.data
; define variables here
;stage 1 ******************
	  string BYTE "Hello",0;
	  numbers WORD 3 DUP(99h);			  
	  nums WORD 10h, 28h, 30h;

;stage 2 ******************
	  total DWORD ?;
 ; End of DATA section

;============================
;Code section (The program)
;============================
.code
; *********************************
; start  of our MAIN procedure
; *********************************
main PROC
; *********************************

;stage 1 ******************
; use write call
	  mov numbers[0], 23h;
	  mov ax, [numbers[2]];	; this is actually adding numbers[1] to ax, but we need to allow for the size of the item - a WORD = 2 bytes
; this gives the SAME result ax will contain the value from logical numbers[2]
	  mov ax, [numbers + 4];  
	  mov [numbers + 4], 77h;
	  mov ax, [numbers + 4];

; lets process a string now !
	  mov bh, string[1];		; gets char index [1] from our string = 'e'
	  mov bh, string[2];
;now lets change the string contents
	  mov string[1], 'W';
	  mov string[2], 'X';
;; set them back so we can do a loop through the string contents
	  mov string[1], 'e';
	  mov string[2], 'l';
; heres our loop
	;; preflight setup
			mov eax, 0;		// loop counter
			mov ecx, 3;			; number of times we want to go thru the loop
	; point to the first element in our numbers array
			mov esi, OFFSET numbers;

	topofloop :	  ; self explanatory ?
				add eax, [esi];  put the contents of whatever is in  the addr pointed to by esi into eax
				  add esi, 2;	  ; increment our string pointer (esi) by the size of the string content (WORD = 2)
				  loop topofloop;

;	  END OF stage 1 ******************
;	  START of stage 2 ******************

;	  END OF stage 2 ******************

INVOKE ExitProcess, 0
main ENDP
END main

