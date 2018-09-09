export WORKSPACE=$HOME/workspace
export HACKING=$WORKSPACE/hacking

mkdir -p $WORKSPACE
mkdir -p $HACKING

cd $WORKSPACE
git clone git@github.com:bodgergely/vim.git
mv ./vim ./vimrc
rm ~/.bashrc
ln -s $WORKSPACE/vimrc/.vimrc ~/.vimrc
ln -s $WORKSPACE/vimrc/.bashrc ~/.bashrc
ln -s $WORKSPACE/vimrc/.bash_aliases ~/.bash_aliases
ln -s $WORKSPACE/vimrc/.tmux.conf ~/.tmux.conf
ln -s $WORKSPACE/vimrc/.gitconfig ~/.gitconfig
ln -s $WORKSPACE/vimrc/.gdbinit ~/.gdbinit

source ~/.bashrc
tmux source-file ~/.tmux.conf


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:cgag/loc.git 
git clone https://github.com/longld/peda.git ~/peda
git clone https://github.com/pwndbg/pwndbg ~/pwndbg
cd pwndbg
./setup.sh

mkdir -p $HACKING/radare
git clone git@github.com:radare/radare2.git $HACKING/radare/radare2
cd $HACKING/radare/radare2
sudo ./sys/install.sh

cd $HACKING
git clone git@github.com:bodgergely/linux_kernel_hacking.git 
git clone git@github.com:bodgergely/wargames.git
git clone git@github.com:bodgergely/utility_tools.git $WORKSPACE/utility_tools

