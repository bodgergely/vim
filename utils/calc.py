import fileinput
import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        print(eval(" ".join(sys.argv[1:])))
    else:
        print(eval(" ".join([line for line in fileinput.input()])))



