#!/usr/bin/python3

import sys


def main(number):
    base = 10
    if number[0:2] == "0x":
        base = 16
    number = int(number, base)
    integer = str(int(number))
    hexa = hex(number)
    binary = bin(number)[2:]
    print(integer)
    print(hexa)
    print(binary)


if __name__ == "__main__":
    main(sys.argv[1])

