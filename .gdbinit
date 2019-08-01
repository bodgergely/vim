#add-auto-load-safe-path /home/geri/workspace/python/cpython/python-gdb.py
# http://security.cs.pub.ro/hexcellents/wiki/kb/toolset/peda
set disassembly-flavor intel
set detach-on-fork off
set follow-fork-mode child
# source ~/peda/peda.py
#set pagination off
# below is for peda to work in tui
# pset option ansicolor off
# set prompt (gdb-peda) 
#source ~/workspace/hacking/pwndbg/gdbinit.py

# below is a kernel debug security disabling command
set auto-load safe-path /
set print pretty on
