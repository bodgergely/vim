format PE

section '.text' code readable executable

start:
    mov eax, 0xe
    cmp eax, 0xf
    cmp eax, 0xe
    cmp eax, 0xd
    nop
    ret
