; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: angeli <angeli@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/02/18 12:17:20 by angeli        #+#    #+#                  ;
;    Updated: 2021/02/20 13:24:22 by angeli        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global ft_strlen

section .text

ft_strlen:
	xor		rax, rax				; set rax to 0
	jmp 	_count_loop

_increment:
	inc		rax

_count_loop:
	mov		sil, byte [rdi + rax]	; RAX is used as counter
	cmp		sil, byte 0
	je		_eol
	jmp		_increment
	jmp		_count_loop

_eol:
	ret
