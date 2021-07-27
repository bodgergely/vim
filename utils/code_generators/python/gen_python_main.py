#!/usr/bin/python3

import sys


def main_body():
    return  """
def main(argv):
    pass


if __name__ == "__main__":
    main(sys.argv)
"""


def gen_includes(include_list):
    def lookup(name):
        for p in include_list:
            if p == name:
                return True
        return False

    l = ""
    
    for i in include_list:
        l += "import " + i + '\n'
    if not lookup('sys'):
        l += "import sys\n"
    return l


def main():
    includes = sys.argv[1:]
    print(gen_includes(includes) + '\n'*1 + main_body())

if __name__ == '__main__':
    main()
