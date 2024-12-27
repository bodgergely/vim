set disassembly-flavor intel
set detach-on-fork off
set follow-fork-mode child
set print pretty on
b main
source /home/geri/pwndbg/gdbinit.py
