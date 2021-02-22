
global  ft_read
    extern  __errno_location

section.data:
    SYS_READ       equ 0

section.text:

ft_read:
    mov     rax, SYS_READ
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
