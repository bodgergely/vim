find . -path ./.git -prune -o -type f -print0 | xargs -0 sed -i 's/-O0/-O0/g'
