import fileinput
from typing import List

def convert(line: str) -> List[chr]:
    chrs = [chr(int(hx,16)) for hx in line.strip().split(" ")]
    return chrs

def main():
    for line in fileinput.input():
        print("".join(convert(line)))




if __name__ == "__main__":
    main()
