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


section.data:
    SYS_WRITE       equ 0x2000004

section.text:
    global  _ft_write
    extern  ___error

_ft_write:
    mov     rax, SYS_WRITE
    syscall
    jc        _error
    ret

_error:
    push    rax                    ; save errno return value on top of the stack
    call    ___error    ; return rax = error();
    pop     rdx                    ; popping means restoring whatever is on top of the stack into a register.
    mov     [rax], rdx            ;*rax = rdx
    mov        rax, -1
    ret