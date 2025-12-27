set -e
DIR=$1
mkdir -p $DIR
cd $DIR

/c/python311/python.exe ~/bin/gen_python_main.py > main.py

# generate alias file
cat <<HEREDOC > aliases
alias e="vim main.py"
alias r="python3 main.py"
HEREDOC

vim main.py
