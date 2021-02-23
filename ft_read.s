; ************************************************************************** ;
;                                                                            ;
;                                                        ::::::::            ;
;   ft_read.s                                          :+:    :+:            ;
;                                                     +:+                    ;
;   By: Angi <Angi@student.codam.nl>                 +#+                     ;
;                                                   +#+                      ;
;   Created: 2021/02/23 13:05:14 by Angi          #+#    #+#                 ;
;   Updated: 2021/02/23 13:05:14 by Angi          ########   odam.nl         ;
;                                                                            ;
; ************************************************************************** ;

section.data:
    SYS_READ       equ 0x2000003

section.text:
global  _ft_read
extern  ___error

_ft_read:
    mov     rax, SYS_READ
    syscall
    jc       _err                           ; jump if SF == 1 sign flaggie
    ret

_err:
    push    rax                             ; save errno return value on top of the stack
    call    ___error                        ; return rax = error();
    pop     rdx                             ; popping means restoring whatever is on top of the stack into a register.
    mov     [rax], rdx                      ;*rax = rdx
    mov     rax, -1
    ret
