# exit when any command fails
set -e

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
make -j`nproc` CMAKE_INSTALL_PREFIX=$HOME/neovim-dev
make install

