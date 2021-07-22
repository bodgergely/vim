#!/usr/bin/python3
import subprocess
import sys

def handle_pattern(pattern):
    if ' ' in pattern or '\t' in pattern:
        pattern = '\"' + pattern + '\"'
    return pattern

def grep(pattern, extensions, directory):
    includes = ""
    if extensions:
        inc = "--include="
        includes = " ".join([inc + "*." + ext for ext in extensions])
  
    pattern = handle_pattern(pattern)
    cmd = f'grep --color -n -R -I {pattern} {includes} {directory}'
    #print(cmd)
    subprocess.call(cmd, shell=True)

if __name__ == "__main__":
    extensions = []
    if len(sys.argv) > 2:
        extensions = sys.argv[2].split(',')
    grep(sys.argv[1], extensions, '.')
