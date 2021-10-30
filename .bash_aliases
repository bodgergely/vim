alias aer="source $HOME/.bash_aliases"
alias reload="source $HOME/.bashrc"
alias ae="vim $HOME/.bash_aliases; aer;"
alias vimrc='vim $HOME/.vimrc'
alias bashrc='vim $HOME/.bashrc; reload'
alias python='winpty python.exe'
alias p='python'
alias ipy='ipython'
alias v='vim'
function np() {
    'notepad++.exe' $1 &
}


#export PATH='/c/MinGW/bin':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.14.26428/bin/Hostx64/x86':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE':$PATH
#export PATH='/cygdrive/c/Windows/System32':$PATH

export WORKSPACE='~/workspace'
export DEV="/c/dev/"
export VIMRC="$WORKSPACE/vimrc"
export ONEDRIVE="$HOME/\"OneDrive - HP Inc/\""
#export CHEATSHEET="$ONEDRIVE/cheatsheet.md"
export CHEATSHEET="$WORKSPACE/vimrc/cheatsheet.md"
export NOTES="$ONEDRIVE/notes.md"
export KRYPTON="$DEV/Krypton"
export OUT="$DEV/out/DEBUG_win7-64bit-ninja/"
export BRS="/c/Program Files/HP/Sure Click/servers"
export SURECLICK_INSTALL_FOLDER="/c/Program Files/HP/Sure Click/"
export SURECLICK_LOGS="/c/Users/gergely.bod/AppData/LocalLow/Bromium/vSentry/Logs"
export BEM_LOGS="/c/ProgramData/Bromium/BEM/logs"
export BEMK_LOGS="/c/ProgramData/Bromium/BEM/logs/Bemk"

export P2VTOOLS="$DEV/p2v-tools/bin"

alias cdworkspace="cd $WORKSPACE"
alias cdout="cd $OUT"
alias cdvimrc="cd $VIMRC"
alias cddocs="cd $VIMRC/Docs"
alias cdonedrive="cd $ONEDRIVE"
alias cdjiras="cd $ONEDRIVE/jiras"
alias cdkrypton="cd $KRYPTON"
alias cdlogs="cd $SURECLICK_LOGS"
alias cdlogsbemk="cd $BEMK_LOGS"
alias cdbem="cd $KRYPTON/bem"
alias cdsureclick='cd "$SURECLICK_INSTALL_FOLDER"'
alias cdp2vtools='cd "$DEV/p2v-tools/bin"'
alias notes="vim $NOTES"
alias cheatsheet="vim $CHEATSHEET"

#alias bki="cd $KRYPTON && clear &&  ./brake.bat init krypton installer; notepad.exe"
#alias bk="cd $KRYPTON && clear && ./brake.bat krypton installer; notepad.exe"
alias bki="cd $KRYPTON && clear &&  ./brake.bat init krypton; notepad.exe"
alias bk="cd $KRYPTON && clear && ./brake.bat krypton; notepad.exe"
alias bk-bemsvc="cd $KRYPTON && clear && ./brake.bat krypton --target BemSvc-sign; notepad.exe"
alias btests="$KRYPTON/brake.bat init_bem bem krypton --target bem-test-deps; cd $KRYPTON/bem/tests && python.exe build.py --build && notepad.exe"
alias bem-update="python.exe /c/dev/p2v-tools/bin/vSentry.py update --refresh-guest"
alias bem-kill="python.exe /c/dev/p2v-tools/bin/vSentry.py kill"
alias bem-resurrect="python.exe /c/dev/p2v-tools/bin/vSentry.py resurrect"
alias bem-clear-logs="python.exe /c/dev/p2v-tools/bin/vSentry.py clear-logs"
alias bem-grep-logs="python.exe /c/dev/p2v-tools/bin/vSentry.py grep-logs"

alias brman='"$BRS/BrManage.exe"'
alias brremoteman='"$BRS/BrRemoteManagement.exe"'
alias brremoteman-update-status-policy='"$BRS/BrRemoteManagement.exe" --update-status-and-policy'
alias brman-management-server-print='"$BRS/BrManage.exe" management-server print'
alias brman-init-system-status='"$BRS/BrManage.exe" init-system status'
alias brman-init-user-request='"$BRS/BrManage.exe" init-user request'
function brman-config-get() {
    "$BRS/BrManage.exe" config get --name=$1
}

function update-etl() {
    python.exe $P2VTOOLS/updateTmfs.py /c/dev/out/DEBUG_win7-64bit-ninja/servers/BemK_4_3_2_0.pdb
}
function decode-etl() {
    python.exe $P2VTOOLS/decodeEtl.py -o bemk.txt "$@"
}

alias clear-test-logs="rm -rf /c/test/*"


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
