#!/bin/bash

# exit when any command fails
set -e

if [[ -z $1 ]]; then
    echo "Provide installation path!"
    exit -1
fi

PATH_INSTALL=$1
mkdir -p $PATH_INSTALL

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
make clean
rm -rf ./build
make -j`nproc` CMAKE_INSTALL_PREFIX=$PATH_INSTALL CMAKE_BUILD_TYPE=RelWithDebInfo 
make install

