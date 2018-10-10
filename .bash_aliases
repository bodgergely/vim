alias aer="source $HOME/.bash_aliases"
alias reload="source $HOME/.bashrc"
alias ae="vim $HOME/.bash_aliases; aer; reload"
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc; reload'


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
export SITE_PACKAGES="/usr/local/lib/python3.6/site-packages"
export BOTO3_PATH="$SITE_PACKAGES/boto3/"

#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.6m"
#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/home/geri/boost/boost_1_66_0/include"
#export LD_LIBRARY_PATH:/home/geri/boost/boost_1_66_0/lib"

# YouCompleteMe ycm generator
alias ycm_generate=$WORKSPACE/vim_plugins/c++/YCM-Generator/config_gen.py
alias ycm_tern_gen='cp $WORKSPACE/vimrc/.tern-project $PWD'

alias pcalc=$HOME/bin/pcalc.py

alias clion=$HOME/clion/clion-2018.1/bin/clion.sh

# copy paste - xclip
alias "cs=xclip -selection clipboard"
alias "vs=xclip -o -selection clipboard"
alias "c=xclip"
alias "v=xclip -o"

#commands
# export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.6/site-packages/
export PYTHONSTARTUP=~/.pystartup
alias pip=/usr/bin/pip2
alias p="python"
alias p2=/usr/bin/python2
alias p3=/usr/bin/python3
alias ipy3=/usr/bin/ipython3
alias ipy="ipython"
alias psi="python setup.py install"
alias psc="python setup.py clean"
alias pydebug='pudb'
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
alias vim="PYTHONPATH=$PYTHONPATH:/usr/lib/python3.6/site-packages/ vim"
alias v="PYTHONPATH=$PYTHONPATH:/usr/lib/python3.6/site-packages/ vim"
alias scheme_vim="MYVIMRC=~/.scheme_vimrc vim"

#nvim
alias nvim=nvim.appimage

# git
alias git_developers='git shortlog -sne'
alias gcl='git clone'
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
alias cdnatas="cd $WARGAMES/natas"
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
alias cdhtb='cd $WARGAMES/pentestlabs/hackthebox'
alias cdbhp='cd $WORKSPACE/my_repos/black_hat_python'

#apache
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
alias ping_google='ping www.google.com'

#radare
alias Cutter='~/cutter/Cutter-v1.7.1-x86_64.AppImage'

#webassembly
export WEBASSEMBLY=$WORKSPACE/webassembly
alias webassembly_setup_env='source $WEBASSEMBLY/emsdk/emsdk_env.sh'
#source $WEBASSEMBLY/emsdk/emsdk_env.sh 
# compile the program like below
# emcc hello.c -s WASM=1 -o hello.html
# emscripten webserver can serve it like below
alias emrun_here='emrun --no_browser --port 8080 .'

#nmap
#alias nmap_1='sudo nmap -v -A -sS -oX nmap_output'
alias nmap_syn='sudo nmap -v -A -sS'
alias nmap_top_ports_20='sudo nmap -sT --top-ports 20'

#kali
alias mount_shared='~/Desktop/mount-shared-folders.sh'
alias cdshared='cd ~/operating_systems/linux/kali/shared'
export OFFSEC_DIR=$HOME'/Desktop/offsec/'
alias conn_offsec_network='cd $OFFSEC_DIR/offsec_connectivity_pack; cat auth.txt | cs; ./connect.sh'
alias test_offsec_connection='ping 10.11.1.220'
alias win7_machine_connect='cd $OFFSEC_DIR/offsec_connectivity_pack; ./win7_remote_desktop.sh'
alias win7_machine_connect_fullscreen='cd $OFFSEC_DIR/offsec_connectivity_pack; ./win7_remote_desktop_fullscreen.sh'
export WIN7_offsec_machine_ip='10.11.11.142'
export EXPLOITDB='~/workspace/hacking/exploitdb/'



