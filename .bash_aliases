# load tmux if we are not in tmux
#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

alias aer="source $HOME/.bash_aliases"
alias reload="source $HOME/.bashrc"
alias ae="vim $HOME/.bash_aliases; aer;"
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc; reload'
alias fzfrc='vim $HOME/.fzf.bash'

# golang
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$HOME/workspace/go/bin

#neovim
export PATH=$HOME/neovim/bin:$PATH

export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:~/arduino/arduino-1.8.5-linux64/arduino-1.8.5
export PATH=~/anaconda3/bin:$PATH
export PATH=$HOME/Qt/5.9.1/gcc_64/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-11-oracle

# gcc cross compiler
export PATH=$PATH:$HOME/opt/cross/bin
alias cross_gcc=i686-elf-gcc

export WORKSPACE=$HOME/workspace
export UI=/usr/include
export AI_PATH="$WORKSPACE/AI/"
export HACKING="$WORKSPACE/hacking/"
export HANDSON_ML_PATH="$AI_PATH/handson-ml/"
export SITE_PACKAGES="/usr/local/lib/python3.6/site-packages"

#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.6m"
#export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/home/geri/boost/boost_1_66_0/include"
#export LD_LIBRARY_PATH:/home/geri/boost/boost_1_66_0/lib"

# YouCompleteMe ycm generator
alias ycm_generate=$HOME/.vim/bundle/YCM-Generator/config_gen.py
alias ycm_tern_gen='cp $WORKSPACE/vimrc/.tern-project $PWD'

alias pcalc=$HOME/bin/pcalc.py

alias clion=$HOME/clion/clion-2018.1/bin/clion.sh

# copy paste - xclip
alias cs="xclip -selection clipboard"
alias vs="xclip -o -selection clipboard"
alias c="xclip"
alias v="xclip -o"

#commands
# export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.6/site-packages/
export PYTHONSTARTUP=~/.pystartup
#alias pip=/usr/bin/pip2
alias p="python3"
alias p2=python2
alias p3=python3
alias ipy3=ipython3
alias ipy=ipython3
alias psi="python setup.py install"
alias psc="python setup.py clean"
alias pydebug='pudb'
alias convert_ipy_notebook="jupyter nbconvert --to script"
alias linecount=loc
alias objd='objdump -Mintel -D'

alias ls="ls -X --color=auto"
alias l="ls -XFlha"

ff() {
    find . -name "$1"
}

# to find files ending with .c or .h
findc() 
{ 
    find $1 -name '*.[ch]'
}

alias grep='grep --color'
alias g=grep.py "$@"


#vim
alias vim_background_color="$HOME/bin/vim_background_color.py"
alias vimrc_min="cat $WORKSPACE/vimrc/vimrc_minimal | cs"
alias vim_hex="cat $WORKSPACE/vimrc/vim_hex | cs"
#alias vim="PYTHONPATH=$PYTHONPATH:/usr/lib/python3.6/site-packages/ vim"
#alias v="PYTHONPATH=$PYTHONPATH:/usr/lib/python3.6/site-packages/ vim"
#alias vim="PYTHONPATH=$PYTHONPATH:$HOME/anaconda3/lib/python3.7/site-packages/ vim"
#alias v="PYTHONPATH=$PYTHONPATH:$HOME/anaconda3/lib/python3.7/site-packages/ vim"
alias v=vim
alias scheme_vim="MYVIMRC=~/.scheme_vimrc vim"

# git
alias git_developers='git shortlog -sne'
alias gcl='git clone'
alias gpu='git push'
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias ga="git add"
alias gc="git checkout"
alias git_discard="git checkout --"
alias git_unstage="git reset HEAD"
alias gco="git commit"
alias gd="git diff"
alias git_submodule_recursive="git submodule update --init --recursive"
alias git_submodule_sync='git submodule sync'
alias git_log_pretty="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias gg="git grep -n --color"


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
alias cdmyrepos='cd $WORKSPACE/my_repos'
alias cdbodos="cd $WORKSPACE/bodos/src"
alias cdlazyprogrammer="cd $HOME/workspace/AI/lazyprogrammer/machine_learning_examples"
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
alias cdembedded="cd $WORKSPACE/coursera/embedded_boulder/ese-coursera-course1"
alias cdweb="cd $WORKSPACE/my_repos/website"
alias cdhtb='cd $WARGAMES/pentestlabs/hackthebox'
alias cdbhp='cd $WORKSPACE/my_repos/black_hat_python/BHP-Code'
alias cdrust='cd $WARGAMES/tutorials/lang-tut/rust'
alias cddropbox='cd $HOME/Dropbox'
alias cdlangtut='cd $HOME/tutorials/lang-tut/'
alias cdtmp='cd /tmp'
alias cdudemy='cd $WORKSPACE/my_repos/udemy'
#go
alias cdgo='cd $HOME/workspace/go/src'
alias cdgo_playground='cd $GOPATH/src/playground'
#tools
alias cdutility_tools='cd $WORKSPACE/my_repos/utility_tools'
#apache
alias apache_restart="sudo systemctl restart apache2.service"
alias apache_status="sudo systemctl status apache2.service"
alias apache_start="sudo systemctl start apache2.service"
alias apache_stop="sudo systemctl stop apache2.service"

#apt-get
alias agi="sudo apt-get install"
alias agi_yes="sudo apt-get -y install"
alias agr="sudo apt-get remove"

#metasploit
alias cdmetasploit="cd /opt/metasploit-framework/embedded/framework"
export METASPLOIT_DIR=/opt/metasploit-framework/embedded/framework

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
alias torbrowser='~/tor/tor-browser_en-US/start-tor-browser.desktop'
#alias torbrowser='xhost si:localuser:geri;sudo -u geri -H torbrowser-launcher'

#terminal theme chooser
alias terminal_theme_chooser='wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh'

alias network_restart='sudo systemctl restart network-manager.service'
alias ping_google='ping www.google.com'
alias ports_open='sudo netstat -peanut'
alias ports_listening='sudo netstat -ltup'

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
alias nmap_top_ports_20='sudo nmap -v -sT --top-ports 20'

#ssh
alias ssh_start='sudo service ssh start'
alias ssh_stop='sudo service ssh stop'
alias ssh_status='sudo service ssh status'

#sql
#alias sqlmap='python ~/bin/sqlmap.py'

export RASPBERRY_1=192.168.1.10
alias ssh_raspberry_1='ssh pi@$RASPBERRY_1' 

#kali
alias mount_shared='~/Desktop/mount-shared-folders.sh'
alias cdshared='cd ~/operating_systems/linux/kali/shared'
export OFFSEC_DIR=$HOME'/Desktop/offsec/'
alias conn_offsec_network='cd $OFFSEC_DIR/offsec_connectivity_pack; cat auth.txt | cs; ./connect.sh'
alias test_offsec_connection='ping 10.11.1.220'
alias win7_machine_connect='cd $OFFSEC_DIR/offsec_connectivity_pack; ./win7_remote_desktop.sh'
alias win7_machine_connect_fullscreen='cd $OFFSEC_DIR/offsec_connectivity_pack; ./win7_remote_desktop_fullscreen.sh'
export WIN7_offsec_machine_ip='10.11.11.142'
export EXPLOITDB='/usr/share/exploitdb/'
export LAB=$HOME'/Desktop/lab'
alias cdlab='cd $LAB'
export NET=10.11.1


#metasploit
alias msfconsole='sudo msfconsole'

#ssl key log file
export SSLKEYLOGFILE=~/sslkeylog.log

#MINGW - mingw
alias mingw_32_g++=i686-w64-mingw32-g++
alias mingw_64_g++=x86_64-w64-mingw32-g++

#compression
alias targz_compress='tar -czvf'
alias bzip_compress='tar -cjvf'
alias targz_uncompress='tar -xzvf'
alias bzip_uncompress='tar -xjvf'

alias cl='clear'

alias trace='sudo trace-cmd record -p function_graph'

alias eclipse='~/eclipse/eclipse/eclipse'
alias cl='clear'

alias php5_enable='sudo a2enmod php5.6'
alias php7_enable='sudo a2enmod php7.2'
alias php5_disable='sudo a2dismod php5.6'
alias php7_disable='sudo a2dismod php7.2'

export LD_LIBRARY_PATH=$HOME/lib

# cloudflare vpn
alias vpn_connect_1=$HOME/vpn/vpn_sf.sh
alias vpn_connect_2=$HOME/vpn/vpn_lhr.sh

# cloudflare
alias cdcf='cd $HOME/workspace/cf'
alias questions='vim $HOME/Dropbox/cloudflare/questions.md'
alias learn_nginx='vim $HOME/Dropbox/cloudflare/nginx.md'
alias learn_opentracing='vim $HOME/Dropbox/cloudflare/opentracing.md'

# chrome detach the gchat
alias chrome-chat="google-chrome --app=https://chat.google.com/ --profile-directory='Profile 1'"

# nginx - openresty
export PATH=$HOME/openresty/bin:$HOME/openresty/nginx/sbin:$PATH
alias cdopenresty='cd $HOME/openresty_debug'

#traceroute
alias traceroute_icmp='sudo traceroute -I'

export VISUAL=nvim
export EDITOR=nvim
export BROWSER=google-chrome
alias r=ranger
alias t='tree -FC'

# kubernetes
alias k='kubectl'

#perf
perf_paranoid_disable() { echo "echo -1 > /proc/sys/kernel/perf_event_paranoid" | cs ; }

#perf flamegraph system wide
alias perf_flame="perf_flame.sh"

if [ -f ~/.cf_aliasesrc ]; then
    source ~/.cf_aliasesrc
fi

#smtp server in python
smtp_server() { sudo python -m smtpd -n -c DebuggingServer :25; }
#http server in python
http_server() { python3 -m http.server $1; }
http_server_python2() { python2 -m SimpleHTTPServer $1; }

# go playground
go_playground()
{
    code $GOPATH/src/playground
}
go_playground_vim()
{
    cdgo_playground
    vim $GOPATH/src/playground/play.go
}

alias f='fzf | xargs vim'

# disk/harddrive/filesystem utilities
alias parted_l='sudo parted -l'
alias fdisk_l='sudo fdisk -l'
# Use below to get filesystems mount points/ sizes
# $ df -Th
# $ lsblk
# $ fsck
# $ mke2fs - create ext2/3/4 file systems
# $ fstab

alias mex='chmod +x'

function psg()
{
    ps aux | grep $1;
}

alias cheatsheet='vim $WORKSPACE/vimrc/CHEATSHEET.md'

alias truecolor_test='curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash'

function k_set_namespace()
{
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}

function k_get_namespace()
{
    kubectl config view --minify --output 'jsonpath={..namespace}'
}

function gen_bash_file()
{
    if [[ ! -z $1 ]]; then
        echo "#!/usr/bin/env bash" > $1
        chmod +x $1
        vim $1
    else
        echo "Usage: gen_bash_file <filename>"
    fi
}
# memory
# $ free

function get_mem_info()
{
    cat /proc/meminfo | grep -E '(MemTotal|MemFree|MemAvailable|Cached|Active\(anon\)|Inactive\(anon\)|Active\(file\)|Inactive\(file\)|AnonPages|Swap)' | \
        awk '{print $1 " " $2/1000/1000 " GB"}'
}

function get_kernel_configs()
{
    cat /boot/config-`uname -r`
}

function whatismyip()
{
    # https://github.com/chubin/awesome-console-services
    curl l2.io/ip
}

function text_share()
{
    curl -F 'clbin=<-' https://clbin.com
}

function dictionary()
{
    what=$@
    echo Getting description for: $what
    curl 'dict://dict.org/d:'"$what"
}

# search for how to do things in the command line
# git clone git@github.com:bodgergely/how2.git
# sudo npm i -g ./how2

# sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hstr && hstr --show-configuration >> ~/.bashrc && . ~/.bashrc

# nnn - file manager
# sudo apt install nnn
NNN_OPENER=/usr/bin/vim
NNN_USE_EDITOR=0
# Put the line below in ~/.bashrc or ~/bash_profile:
#
#   eval "$(jump shell bash)"
#
# The following lines are autogenerated:

__jump_prompt_command() {
  local status=$?
  jump chdir && return $status
}

__jump_hint() {
  local term="${COMP_LINE/#j /}"
  jump hint $term
}

j() {
  local dir="$(jump cd $@)"
  test -d "$dir"  && cd "$dir"
}

[[ "$PROMPT_COMMAND" =~ __jump_prompt_command ]] || {
  PROMPT_COMMAND="__jump_prompt_command;$PROMPT_COMMAND"
}

complete -o dirnames -C '__jump_hint' j

####### END OF JUMP aliases ####################################
################################################################

function color_picker()
{
    # can't run under tmux - use it without tmux
    bash -c  "$(curl -sLo- https://git.io/vQgMr)"
}

## digital ocean
# $ doclt

function git_extra_help()
{
    firefox https://github.com/tj/git-extras/blob/master/Commands.md
}

function weather_quick()
{
    ansiweather -l London
}

function weather()
{
    curl wttr.in/London
}

function bash_wiki()
{
    firefox http://mywiki.wooledge.org/
}

function gen_go_project()
{
    cookiecutter https://github.com/lacion/cookiecutter-golang.git
}

