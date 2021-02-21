; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: angeli <angeli@student.codam.nl>             +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/02/18 17:26:07 by angeli        #+#    #+#                  ;
;    Updated: 2021/02/20 14:04:20 by angeli        ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global  ft_write
    extern  __errno_location

section.data:
    SYS_WRITE       equ 1

section.text:

ft_write:
    mov     rax, SYS_WRITE
    syscall
    test	rax, rax                        ; set SF to 1 if eax < 0 (negative)
    js        _error                        ; jump if SF == 1 sign flaggie
    ret

_error:
    neg     rax
    push    rax                             ; save errno return value on top of the stack
    call    __errno_location wrt ..plt      ; return rax = error();
    pop     rdx                             ; popping means restoring whatever is on top of the stack into a register.
    mov     [rax], rdx                      ;*rax = rdx
    mov     rax, -1
    ret
