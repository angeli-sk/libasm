; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: angeli <angeli@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/02/18 13:31:00 by angeli        #+#    #+#                  ;
;    Updated: 2021/02/19 10:07:30 by angeli        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcmp

section .text

ft_strcmp:
	xor		rax, rax

_countloop:
	mov 	r9b, byte [rdi + rax]
	mov 	r8b, byte [rsi + rax]
	cmp		r9b, r8b
	jne		_eol
	cmp		r9b, byte 0
	je		_eol
	inc		rax
	jmp		_countloop

_eol:
	sub 	r9b, r8b
	movsx	rax, r9b
	ret
