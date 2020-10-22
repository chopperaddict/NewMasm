.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,  dwExitCode: DWORD
.data
; define variables here


.code
main PROC

; use write call
mov eax, 5;
mov ebx, 21
add eax, ebx
sub eax, 7


INVOKE ExitProcess, 0
main ENDP
END main

