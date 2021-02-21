; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: angeli <angeli@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/02/18 12:51:45 by angeli        #+#    #+#                  ;
;    Updated: 2021/02/19 10:06:25 by angeli        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy

section .text

_ft_strcpy:
	xor		rax, rax

_count_loop:
	mov 	dl, byte [rsi + rax]
	mov 	byte [rdi + rax], dl
	cmp		dl, byte 0
	je		_eol
	inc		rax
	jmp		_count_loop

_eol:
	mov		rax, rdi
	ret
