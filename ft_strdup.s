global ft_strdup
	extern  	__errno_location
	extern		malloc
	extern		ft_strlen
	extern		ft_strcpy

section .text

ft_strdup:
	push rdi

_len:
	call ft_strlen
	mov		rcx, rax		; len is returned in rax
	inc		rcx				; add one space for \0

_malloc:
	mov		rdi, rcx		; save len for malloc in rdi
	call 	malloc wrt ..plt
	cmp		rax, 0			; check if malloc fails
	je		_error

_cpy:
	mov		rdi, rax		; save the malloced string to rdi
	pop		rsi
	call	ft_strcpy
	ret

_error:
	pop		rdi
    neg     rax
    push    rax                             ; save errno return value on top of the stack
    call    __errno_location wrt ..plt      ; return rax = error();
    pop     rdx                             ; popping means restoring whatever is on top of the stack into a register.
    mov     [rax], rdx                      ;*rax = rdx
    mov     rax, -1
    ret



