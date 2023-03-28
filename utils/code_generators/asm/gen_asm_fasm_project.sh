#!bash

function usage()
{
    echo "$0 <dir>"
}

if [[ "$#" -lt 1 ]]; then
    usage
    exit 255
fi

DIR=$1
BUILD_DIR=$1/build
if ! mkdir "$DIR"; then
    echo "Folder already exists!"
    exit 255
fi

function cleanup()
{
    rm -rf DIR
}
set -e
trap cleanup EXIT

mkdir $BUILD_DIR

# main.asm file
cat <<HEREDOC > $DIR/main.asm
format PE console

section '.text' code readable executable

start:
    mov eax, 0xe
    cmp eax, 0xf
    cmp eax, 0xe
    cmp eax, 0xd
    nop
    ret
HEREDOC

# aliases file
cat <<HEREDOC > $DIR/aliases
alias e="vim main.asm"
alias b="fasm.exe main.asm ./build/main.exe"
alias r="b && ./build/main.exe"
HEREDOC

cd $DIR
