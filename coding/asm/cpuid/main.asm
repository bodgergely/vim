format PE console
entry start

include 'win32a.inc'

section '.data' data readable writeable
    hello db 'My age is: %d.!',0

section '.text' code readable executable

start:
    ; write the string to the console
    push dword 37
    push dword hello
    call [printf]

    ;exit program
    push 0
    call [ExitProcess]

section '.idata' import data readable
    library msvcrt, 'msvcrt.dll'
    import msvcrt, printf, 'printf',\
        ExitProcess, '_exit'
