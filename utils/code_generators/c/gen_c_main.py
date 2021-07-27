#!/usr/bin/python3

import sys


def main_body():
    return  """
int main(int argc, char** argv)
{

    return 0;
}
"""


def gen_includes(include_list):
    l = ""
    for i in include_list:
        l += "#include " + "<" + i + ">" + '\n'
    return l


def parse_includes(includes):
    add_stdio = True
    for i in includes:
        if 'stdio' in i:
            add_stdio = False
            break
    if add_stdio:
        return ['stdio.h'] + includes
    else:
        return includes

def main():
    includes = parse_includes(sys.argv[1:])
    print(gen_includes(includes) + main_body())

if __name__ == '__main__':
    main()
