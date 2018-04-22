alias aer="source $HOME/.bash_aliases"
alias ae="vim $HOME/.bash_aliases; aer"
alias reload="source $HOME/.bashrc"

export PATH=$PATH:~/bin

# gcc cross compiler
export PATH=$PATH:$HOME/opt/cross/bin
alias cross_gcc=i686-elf-gcc

export WORKSPACE=$HOME/workspace
export AI_PATH="$WORKSPACE/AI/"
export HANDSON_ML_PATH="$AI_PATH/handson-ml/"
export SITE_PACKAGES="$HOME/anaconda3/lib/python3.6/site-packages"
export BOTO3_PATH="$SITE_PACKAGES/boto3/"

#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.6m"
#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/home/geri/boost/boost_1_66_0/include"
#export LD_LIBRARY_PATH:/home/geri/boost/boost_1_66_0/lib"

# YouCompleteMe ycm generator
alias ycm_generate=$WORKSPACE/vim_plugins/c++/YCM-Generator/config_gen.py

alias pcalc=$HOME/bin/pcalc.py

alias clion=$HOME/clion/clion-2018.1/bin/clion.sh
#commands
alias p="python"
alias p2="python2"
alias ipy="ipython"
alias psi="python setup.py install"
alias psc="python setup.py clean"
alias convert_ipy_notebook="jupyter nbconvert --to script"

alias lha="ls -lha"

ff() {
    find . -name "$1"
}

alias greprec=grep.py


#vim
alias vim="PYTHONPATH=$PYTHONPATH:$HOME/anaconda3/lib/python3.6/site-packages/ vim"
alias scheme_vim="MYVIMRC=~/.scheme_vimrc vim"

#nvim
alias nvim=nvim.appimage

# git
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias ga="git add"
alias gc="git checkout"
alias gco="git commit"

#directories
alias cdworkspace="cd $HOME/workspace/"
alias cdbodos="cd $WORKSPACE/bodos/src"
alias cdlazyprogrammer="cd $HOME/workspace/AI/lazyprogrammer/machine_learning_examples"
alias cdlongshot="cd $HOME/workspace/longshot"
alias cdgoprojects_longshot="cd $HOME/workspace/longshot/go_projects/src/github.com/longshotsyndicate"
alias cdsitepackages="cd $HOME/anaconda3/lib/python3.6/site-packages"
alias cdstats="cd $WORKSPACE/stats"
alias cdbayes="cd $WORKSPACE/stats/ThinkBayes"
alias cdhandson_ml="cd $HANDSON_ML_PATH"
alias cdplayground="cd $WORKSPACE/playground"
alias cdgym="cd $WORKSPACE/AI/openai/gym"
alias cdnand="cd $WORKSPACE/coursera/nand2tetris"

#ansible
source $WORKSPACE/ansible/hacking/env-setup -q

export PATH=$PATH:$HOME/nodejs/node-v9.8.0-linux-x64/bin/
export PATH=$PATH:$HOME/workspace/pyflame/src

