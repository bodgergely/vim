from __future__ import print_function
import fileinput

res = ""
for line in fileinput.input():
    res += line.rstrip()

print(res)

