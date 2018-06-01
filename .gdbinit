#add-auto-load-safe-path /home/geri/workspace/python/cpython/python-gdb.py
set disassembly-flavor intel
source ~/peda/peda.py
# below is for peda to work in tui
pset option ansicolor off
set prompt (gdb-peda) 
