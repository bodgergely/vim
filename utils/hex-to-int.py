import fileinput
import sys

if len(sys.argv) > 1:
    for n in sys.argv[1:]:
        print int(n, 16)
else:
    for line in fileinput.input():
        print int(line, 16)


