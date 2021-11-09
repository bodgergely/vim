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

# main.cpp file
cat <<HEREDOC > $DIR/main.cpp
#include <iostream>

using namespace std;

int main(int argc, char** argv)
{
    cout << "Hello World" << endl;
    return 0;
}
HEREDOC

# build.sh file
cat <<HEREDOC > $DIR/build.sh
CC=g++
FLAGS="-std=c++17 -g"
OPT="-O0"
WARN=""
\$CC \$FLAGS \$OPT \$WARN -o build/main main.cpp
HEREDOC
chmod +x $DIR/build.sh

# aliases file
cat <<HEREDOC > $DIR/aliases
alias b='./build.sh'
alias rr='./build/main'
alias r='b && rr'
alias e='vim main.cpp'
HEREDOC


cd $DIR
