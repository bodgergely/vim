#!/usr/bin/python2

import sys
import os

g_vimrc_file = os.path.expanduser('~/.vimrc')

search_string = 'set background='

def vim_bg_color(color):
    inserted = False
    lines = [l for l in open(g_vimrc_file, 'r')]
    nlines = []
    for l in lines:
        if search_string in l:
            if not inserted:
                nlines.append(search_string+color+'\n')
                inserted = True
        else:
            nlines.append(l)
    with open(g_vimrc_file, 'w') as nf:
        nf.writelines(nlines)



if __name__ == '__main__':
    args = sys.argv
    if len(args) != 2:
        print "Usage: vim_background_color.py color"
        sys.exit(1)
    vim_bg_color(args[1])




