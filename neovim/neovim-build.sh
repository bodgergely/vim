#!/bin/bash
# exit when any command fails
set -e

function help_me() {
    echo "neovim-build.sh <release|debug> <install-path>"
    exit 0
}


if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]
then
    help_me
fi

if [[ $# -ne 2 ]]; then
   help_me
fi

TYPE=$1
INSTALL_PATH=$2


sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python

function finish {
    # Your cleanup code here
    sudo rm /usr/bin/python
    sudo ln -s /usr/bin/python2 /usr/bin/python
}
trap finish EXIT INT TERM

export PATH=/usr/bin:$PATH
alias python='/usr/bin/python3'


if [[ $TYPE == "release" ]]; then
    make -j`nproc` CMAKE_INSTALL_PREFIX=$INSTALL_PATH CMAKE_BUILD_TYPE=RelWithDebInfo
elif [[ $TYPE == "debug" ]]; then
    make -j`nproc` CMAKE_INSTALL_PREFIX=$INSTALL_PATH
else
    echo "Invalid build type! Should be release or debug"
    exit -1
fi
    
make install
