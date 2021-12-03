import fileinput
import sys

if len(sys.argv) > 1:
    for n in sys.argv[1:]:
        print hex(int(n))
else:
    for line in fileinput.input():
        print hex(int(line))


