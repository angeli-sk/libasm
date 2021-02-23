; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strdup.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: akramp <akramp@student.codam.nl>             +#+                     ;
;                                                   +#+                      ;
;   Created: 2021/02/23 13:48:03 by akramp        #+#    #+#                 ;
;   Updated: 2021/02/23 13:48:03 by akramp        ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

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
    mov     rax, 0
    ret



