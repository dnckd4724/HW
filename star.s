section .data
			s db 0x2A
			n db 0x0a
section .text

global _start
_start:
	mov r12, [rsp+16]
	cmp r12, 0x00
	je End
	mov r12, [r12]
	AND r12, 0x0f
	cmp r12, 0x00
	je L9
	add r12, 0x01
	mov r8, 0x00
	mov r9, 0x02
	jmp L3
L0:	
	call _Space
	mov r8, 0x01	
	inc r9
	cmp r9, r12
	je L4
	jmp L3
L1:
	call _Space
	add r8, 0x02
	cmp r8, r12
	je End
	dec r8
	jmp L3
L2:
	inc r8
L3:
	call _Star
	cmp r8, 0x00
	je L1
	cmp r8, r9
	jb L2 
	je L0

L4:
	cmp r12, 0x03
	je L9
	mov r8, 0x03
	mov r9, r8
	jmp L8
L5:	
	mov r8, r9
	cmp r9, r12
	je L9
	jmp L8
	
L6:
	call _Space
	inc r9
	jmp L5
	
L7:
	inc r8
L8:
	call _Star
	cmp r12, r8
	ja L7
	je L6
	
L9:
	call _Star
	call _Space	
End:	
	MOV rax, 60
	syscall
 
_Star:
	MOV rax, 1
	MOV rdi, 1          
	MOV rsi, s
	MOV rdx, 0x01
	syscall
	ret

_Space:
	MOV rax, 1
	MOV rdi, 1           
	MOV rsi, n
	MOV rdx, 0x01
	syscall	
	ret	
  

