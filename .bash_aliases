alias aer="source $HOME/.bash_aliases"
alias ae="vim $HOME/.bash_aliases; aer"
alias reload="source $HOME/.bashrc"


export PATH=$PATH:~/bin
export PATH=$PATH:~/arduino/arduino-1.8.5-linux64/arduino-1.8.5
#export PATH=~/anaconda3/bin/:$PATH
export PATH=$HOME/Qt/5.9.1/gcc_64/bin:$PATH

# gcc cross compiler
export PATH=$PATH:$HOME/opt/cross/bin
alias cross_gcc=i686-elf-gcc

export WORKSPACE=$HOME/workspace
export UI=/usr/include
export AI_PATH="$WORKSPACE/AI/"
export HACKING="$WORKSPACE/hacking/"
export HANDSON_ML_PATH="$AI_PATH/handson-ml/"
export SITE_PACKAGES="/usr/lib/python3.6/site-packages"
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
alias p2=/usr/bin/python2
alias ipy2=/usr/bin/ipython
alias ipy="ipython3"
alias psi="python setup.py install"
alias psc="python setup.py clean"
alias convert_ipy_notebook="jupyter nbconvert --to script"
alias linecount=loc
alias objd='objdump -Mintel -D'

alias lha="ls -lha"

ff() {
    find . -name "$1"
}

alias gr=grep.py "$@"


#vim
alias vim_background_color="$HOME/vim_background_color.py"
alias vimrc_min="cat $WORKSPACE/vimrc/vimrc_minimal | cs"
alias vim_hex="cat $WORKSPACE/vimrc/vim_hex | cs"
alias vim="PYTHONPATH=$PYTHONPATH:/usr/lib/python3.6/site-packages/ vim -X"
alias scheme_vim="MYVIMRC=~/.scheme_vimrc vim"

#nvim
alias nvim=nvim.appimage

# git
alias gpu='git push'
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias ga="git add"
alias gc="git checkout"
alias gco="git commit"
alias gd="git diff"

# gdb
alias gdb_vanilla="gdb --command $WORKSPACE/vimrc/gdb_scripts/gdbvanilla --args"
alias gdb_peda="gdb --command $WORKSPACE/vimrc/gdb_scripts/peda.gdb --args"
alias gdb_pwndbg="gdb --command $WORKSPACE/vimrc/gdb_scripts/pwndbg.gdb --args"

# wargames !!!
export WARGAMES="$HACKING/wargames/"
export PWNABLE="$WARGAMES/pwnable_kr/"
alias cdsoftmmu="cd $PWNABLE/HackersSecret/softmmu"
alias cdpwn="cd $WARGAMES/pwnable_kr"
alias cdwar="cd $WARGAMES"
alias wargame_environ_setup="cat $WARGAMES/scripts/env.sh | cs"
alias shellcode_generate="$WARGAMES/shellcode/shellcode.py"
alias cdnar="cd $WARGAMES/narnia"
alias cdbehemoth="cd $WARGAMES/behemoth"
alias cdvortex="cd $WARGAMES/vortex"
# end of wargames

#directories
alias cdvimrc="cd $WORKSPACE/vimrc"
alias cdblog="cd $WORKSPACE/bodgergely.github.io"
alias cdhacking="cd $HACKING"
alias cdworkspace="cd $HOME/workspace/"
alias cdbodos="cd $WORKSPACE/bodos/src"
alias cdlazyprogrammer="cd $HOME/workspace/AI/lazyprogrammer/machine_learning_examples"
alias cdlongshot="cd $HOME/workspace/longshot"
alias cdgoprojects_longshot="cd $HOME/workspace/longshot/go_projects/src/github.com/longshotsyndicate"
alias cdsitepackages="cd /usr/lib/python3.6/site-packages"
alias cdstats="cd $WORKSPACE/stats"
alias cdbayes="cd $WORKSPACE/stats/ThinkBayes"
alias cdhandson_ml="cd $HANDSON_ML_PATH"
alias cdplayground="cd $WORKSPACE/playground"
alias cdgym="cd $WORKSPACE/AI/openai/gym"
alias cdtlpi="cd $WORKSPACE/sysprog/tlpi"
alias cdbooks="cd $HOME/Dropbox/books"
alias cdlinux="cd $WORKSPACE/linux"
alias cdkernelhacking="cd $HACKING/kernel_hacking"
alias cdbusybox="cd $HOME/busybox/build"
alias cdnand2tetris="cd $WORKSPACE/coursera/nand2tetris"
alias cdweb="cd /var/www/html"
alias apache_restart="sudo systemctl restart apache2.service"

#apt-get
alias agi="sudo apt-get install"
alias agi_yes="sudo apt-get -y install"
alias agr="sudo apt-get remove"

#metasploit
alias cdmetasploit="cd /opt/metasploit-framework/embedded/framework"

export PATH=$PATH:$HOME/nodejs/node-v9.8.0-linux-x64/bin/
export PATH=$PATH:$HOME/workspace/pyflame/src

tmux source-file ~/.tmux.conf
alias diskspace_check='ncdu'

# jekyll (blog generator)
alias jekyll_serve="bundle exec jekyll serve"

# make
alias configure_debug_build='./configure CFLAGS="-ggdb3 -O0" CXXFLAGS="-ggdb3 -O0" LDFLAGS="-ggdb3"'
alias configure_32='./configure CFLAGS="-m32 -O2" CXXFLAGS="-m32 -O2" LDFLAGS="-m32"'

# tor browser
alias tor='~/tor-browser_en-US/start-tor-browser.desktop'

#terminal theme chooser
alias terminal_theme_chooser='wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh'

alias network_restart='sudo systemctl restart network-manager.service'

#radare
alias Cutter='~/workspace/hacking/radare2/cutter/build/Cutter'

