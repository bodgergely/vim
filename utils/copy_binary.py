#!/usr/bin/python3

import sys

def print_help():
    print("binary_copy <source_file> <target_file>")

def copy(target_path, source_path, buffering=4096):
    with open(source_path, 'rb') as source:
        with open(target_path, 'wb') as target:
            read_bytes = buffering
            while read_bytes == buffering:
                data = source.read()
                read_bytes = len(data)
                target.write(data)


if __name__ == "__main__":
    if len(sys.argv) < 3 or sys.argv[0] == "--help" or sys.argv[0] == "-h":
        print_help()
    else:
        source = sys.argv[1]
        target = sys.argv[2]
        copy(target, source)

