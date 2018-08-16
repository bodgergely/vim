source ~/pwndbg/gdbinit.py
set disassembly-flavor intel
set detach-on-fork off
set follow-fork-mode child
b main
