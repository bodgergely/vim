import fileinput

for line in fileinput.input():
    print hex(int(line))


