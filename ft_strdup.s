; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_strdup.s                                        :+:    :+:            ;
;                                                     +:+                    ;
;   By: Angi <Angi@student.codam.nl>                 +#+                     ;
;                                                   +#+                      ;
;   Created: 2021/02/23 13:06:40 by Angi          #+#    #+#                 ;
;   Updated: 2021/02/23 13:06:40 by Angi          ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

global _ft_strdup
extern  	___error
extern		_malloc
extern		_ft_strlen
extern		_ft_strcpy

section .text

_ft_strdup:
	push rdi
	call 	_ft_strlen
	mov		rcx, rax		; len is returned in rax
	inc		rcx				; add one space for \0
	mov		rdi, rcx		; save len for malloc in rdi
	call 	_malloc
	cmp		rax, 0			; check if malloc fails
	je		_error
	mov		rdi, rax		; save the malloced string to rdi
	pop		rsi
	call	_ft_strcpy
	ret

_error:
	pop		rdi
    mov     rax, 0
    ret
