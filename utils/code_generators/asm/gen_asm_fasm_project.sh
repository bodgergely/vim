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
entry start

include "win32a.inc"

section '.text' code readable executable
start:
    push hello
    call [printf]
    pop ecx

    push 0
    call [ExitProcess]

section '.rdata' data readable
    hello db 'Hello world!', 10, 0

section '.idata' data readable import
    library kernel32, 'kernel32.dll', \
            msvcrt,   'msvcrt.dll'
    import kernel32, ExitProcess, 'ExitProcess'
    import msvcrt, printf, 'printf'
HEREDOC

# aliases file
cat <<HEREDOC > $DIR/aliases
alias e="vim main.asm"
alias b="fasm.exe main.asm ./build/main.exe"
alias r="b && ./build/main.exe"
alias run="./build/main.exe"
HEREDOC

cd $DIR
