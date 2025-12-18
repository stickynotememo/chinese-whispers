global _1_assembly_func
section   .text
; _start:   mov       rax, 1                  ; system call for write
          ; mov       rdi, 1                  ; file handle 1 is stdout
          ; mov       rsi, message            ; address of string to output
          ; mov       rdx, 13                 ; number of bytes
          ; syscall                           ; invoke operating system to do the write
          ; mov       rax, 60                 ; system call for exit
          ; xor       rdi, rdi                ; exit code 0
          ; syscall                           ; invoke operating system to exit

_1_assembly_func:
	mov rax, message
	ret
	
section   .data

message:  db        "Hello from Assembly.", 21      ; note the newline at the end; Define variables in the data section
