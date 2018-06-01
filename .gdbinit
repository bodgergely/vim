#add-auto-load-safe-path /home/geri/workspace/python/cpython/python-gdb.py
# http://security.cs.pub.ro/hexcellents/wiki/kb/toolset/peda
set disassembly-flavor intel
#source ~/peda/peda.py
#set pagination off
# below is for peda to work in tui
# pset option ansicolor off
# set prompt (gdb-peda) 
source $WORKSPACE/hacking/pwndbg/gdbinit.py
