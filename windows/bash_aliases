alias aer="source $HOME/.bash_aliases"
alias reload="source $HOME/.bashrc"
alias ae="vim $HOME/.bash_aliases; aer;"
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc; reload'
alias python='winpty python.exe'
alias p='python'
alias ipy='ipython'
alias v='vim'

export WORKSPACE='~/workspace'

alias cdworkspace="cd $WORKSPACE"
alias cdbooks='cd ~/Dropbox/books'
alias cddropbox="cd ~/Dropbox"
alias cdrussian="cd ~/Dropbox/russian"
alias russian="vim ~/Dropbox/russian/words.txt"

#export PATH='/c/MinGW/bin':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.14.26428/bin/Hostx64/x86':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE':$PATH
#export PATH='/cygdrive/c/Windows/System32':$PATH

export C='/cygdrive/c/'

alias cdvimrc="cd $WORKSPACE/vimrc"

export CHEATSHEET="$WORKSPACE/vimrc/CHEATSHEET.md"
alias cheatsheet="vim $CHEATSHEET"

alias l='ls -lha'

alias git_developers='git shortlog -sne'
alias gcl='git clone'
alias gpu='git push'
alias gpl='git pull'
alias gfe='git fetch'
alias gs="git status"
alias gl="git log"
alias gb="git branch"
alias ga="git add"
alias gc="git checkout"
alias git_discard="git checkout --"
alias git_unstage="git reset HEAD"
alias git_update="git fetch && git pull"
alias gco="git commit"
alias gd="git diff"
alias git_submodule_recursive="git submodule update --init --recursive"
alias git_submodule_sync='git submodule sync'
alias git_log_pretty="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias gg="git grep -n --color"
git_lazy_push()
{
    if [[ -z $1 ]]; then echo "Usage: git_lazy_push <filepath>"; return 127; fi
    git add $1 && git commit -m "changing $1" && git push
}

alias cl="clear"
alias linecount=loc
alias mex="chmod +x"
alias grep="grep --color"
