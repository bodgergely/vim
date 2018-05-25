alias aer="source $HOME/.bash_aliases"
alias ae="vim $HOME/.bash_aliases; aer"
alias reload="source $HOME/.bashrc"

export PATH=$PATH:~/bin
export PATH=$PATH:~/arduino/arduino-1.8.5-linux64/arduino-1.8.5

# gcc cross compiler
export PATH=$PATH:$HOME/opt/cross/bin
alias cross_gcc=i686-elf-gcc

export WORKSPACE=$HOME/workspace
export UI=/usr/include
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

# copy paste - xclip
alias "cs=xclip -selection clipboard"
alias "vs=xclip -o -selection clipboard"
alias "c=xclip"
alias "v=xclip -o"

#commands
alias p="python"
alias p2="python2"
alias ipy2=$HOME/miniconda2/bin/ipython2
alias ipy="ipython"
alias psi="python setup.py install"
alias psc="python setup.py clean"
alias convert_ipy_notebook="jupyter nbconvert --to script"
alias linecount=loc

alias lha="ls -lha"

ff() {
    find . -name "$1"
}

alias gr=grep.py "$@"


#vim
alias vimrc_min="cat $WORKSPACE/vimrc/vimrc_minimal | cs"
alias vim_hex="cat $WORKSPACE/vimrc/vim_hex | cs"
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
alias gd="git diff"

# wargames !!!
alias wargame_environ_setup="cat $WORKSPACE/wargames/scripts/env.sh | cs"
alias cdnar="cd $WORKSPACE/wargames/narnia"
# end of wargames

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
alias cdtlpi="cd $WORKSPACE/sysprog/tlpi"
alias cdbooks="cd $HOME/Dropbox/books"
alias cdlinux="cd $WORKSPACE/linux"
alias cdkernelhacking="cd $WORKSPACE/kernel_hacking"

export PATH=$PATH:$HOME/nodejs/node-v9.8.0-linux-x64/bin/
export PATH=$PATH:$HOME/workspace/pyflame/src

tmux source-file ~/.tmux.conf
