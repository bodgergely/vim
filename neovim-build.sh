#!/bin/bash
# exit when any command fails
set -e

if [[ -z $1 ]]
then
    echo Provide the path for install location!
    exit -1
fi

if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]
then
    echo "neovim-build.sh <install-path>"
    exit 0
fi

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
make -j`nproc` CMAKE_INSTALL_PREFIX=$1 CMAKE_BUILD_TYPE=RelWithDebInfo
make install

