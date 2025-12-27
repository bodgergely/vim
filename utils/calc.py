import fileinput
import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        command = " ".join(sys.argv[1:])
        # print(f"[DEBUG] - command:###{command}###EOF")
        print(eval(command))
    else:
        print(eval(" ".join([line for line in fileinput.input()])))



