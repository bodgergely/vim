stty -ixon
shopt -s histverify

function l() { 
    ls -lharSt $@
}

export PYTHON3_DIR="/c/Program Files/Python310"
export PYTHON3_DIR_SCRIPTS="$PYTHON3_DIR"/Scripts
export PYTHON3_EXE="$PYTHON3_DIR"/python.exe
export PYTHON3_SITE_PACKAGES_DIR="$PYTHON3_DIR"/Lib/site-packages

alias aer="source $HOME/.bash_aliases"
alias reload="source $HOME/.bashrc"
alias ae="vim $HOME/.bash_aliases; aer;"
alias ae-code="code $HOME/.bash_aliases; aer;"
alias pae="cat $HOME/.bash_aliases"
alias vimrc="vim $HOME/.vimrc"
alias bashrc="vim $HOME/.bashrc; reload"
alias python="winpty python.exe"
#alias python3="winpty '$PYTHON3_DIR'/python.exe"
alias python3="'$PYTHON3_DIR'/python.exe"
alias p='python'
alias p3='python3'
alias ip3="winpty '$PYTHON3_DIR'/python.exe"
alias pip3="'$PYTHON3_DIR_SCRIPTS'/pip.exe"
alias ip3="winpty '$PYTHON3_DIR'/Scripts/ipython.exe"
alias ipython="ip3"
alias ipy='ipython'
alias hex2int="$HOME/bin/hex-to-int.sh"
alias int2hex="$HOME/bin/int-to-hex.sh"
alias newline-remove="$HOME/bin/newline-remove.sh"

alias clock="date +'%H:%M:%S'"

if [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    alias fzf="winpty fzf"
    # the below is needed on windows for nvim(neovim) to work
    # https://vi.stackexchange.com/questions/29442/git-bash-neovim-not-working
    # either this: in $home find .gitconfig and add the path to your editor, but use two escapes \\ when there is space, e.g. C:/Program\\ Files/...
    # or the below
    #alias nvim='winpty nvim'
    #alias vim='nvim'
    alias lua="winpty /c/dev/Krypton/deps/lua_vs2015/out/bin/lua.exe"
    alias luac="/c/dev/Krypton/deps/lua_vs2015/out/bin/luac.exe"
fi

alias v='vim'
function np() {
    'notepad++.exe' $1 &
}


#export PATH='/c/MinGW/bin':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.14.26428/bin/Hostx64/x86':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build':$PATH
#export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE':$PATH
#export PATH='/cygdrive/c/Windows/System32':$PATH
export PATH="$HOME/bin:$PATH"
export PATH="/c/Program Files/LLVM/bin:$PATH"
export PATH="$HOME/AppData/Local/SumatraPDF:$PATH"
export PATH="$HOME/Progs/fasm:$PATH"
export INCLUDE="$HOME/Progs/fasm/INCLUDE"

export PROGRAMFILES_x86="/c/Program Files (x86)"
export PROGRAMFILES="/c/Program Files"
export PROGRAMDATA="/c/ProgramData"

export WORKSPACE="$HOME/workspace"
export DEV="/c/dev/"
export MYREPOS="$WORKSPACE/myrepos"
export VIMRC="$WORKSPACE/vimrc"
export CPPPLAY="$WORKSPACE/cpp"
export ONEDRIVE="$HOME/\"OneDrive - HP Inc/\""
#export CHEATSHEET="$ONEDRIVE/cheatsheet.md"
export CHEATSHEET="$WORKSPACE/vimrc/cheatsheet.md"
export NOTES="$ONEDRIVE/notes.md"
export KRYPTON="$DEV/Krypton"
export BEM="$KRYPTON/bem"
export OUT="$DEV/out/win7-64bit-ninja"
export BRS="/c/Program Files/HP/Sure Click/servers"
export SURECLICK_INSTALL_FOLDER="/c/Program Files/HP/Sure Click/"
export SURECLICK_LOGS="/c/Users/gergely.bod/AppData/LocalLow/Bromium/vSentry/Logs"
export LOCALLOW="$HOME/AppData/LocalLow"
export PROGRAMDATA_BROMIUM="$PROGRAMDATA/Bromium"
export BEM_LOGS_LOCAL="$LOCALLOW/Bromium/BEM/Logs"
export BEM_LOGS="/c/ProgramData/Bromium/BEM/logs"
export BEMK_LOGS="/c/ProgramData/Bromium/BEM/logs/Bemk"
export BEMSVC_LOGS="/c/ProgramData/Bromium/BEM/logs/BemSvc"
export GUEST_INSTALL="/c/Windows/GuestInstall"
export BEM_BUILD_LOCATION="$OUT/bem"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export WINKIT="$PROGRAMFILES_x86/Windows Kits/10/"
export WINKIT_BIN="$WINKIT/bin/10.0.18362.0/x64"
export WINKIT_INCLUDE="$WINKIT/include/10.0.18362.0/"
export VISUAL_STUDIO_DIR="$PROGRAMFILES_x86/Microsoft Visual Studio"
export MSVC="$VISUAL_STUDIO_DIR/2019/Enterprise/VC/Tools/MSVC/14.24.28314"
export WIN_DRIVER_SAMPLES="~/workspace/microsoft/Windows-driver-samples"
export BD_DEFINITIONS_ZIP="/c/dev/bd_definitions.zip"   # this one for BEM python tests needed


export P2VTOOLS="$DEV/p2v-tools/bin"

alias cdworkspace="cd $WORKSPACE"
alias cdmyrepos="cd $WORKSPACE/myrepos"
alias cdbio="cd $WORKSPACE/myrepos/bioinformatics"
alias cdout="cd $OUT"
alias cdvimrc="cd $VIMRC"
alias cdcpp="cd $CPPPLAY"
alias cddocs="cd $VIMRC/Docs"
alias cdonedrive="cd $ONEDRIVE"
alias cdjiras="cd $ONEDRIVE/jiras"
alias pushdjiras="pushd $ONEDRIVE/jiras"
alias cddesktop="cd $DESKTOP"
alias cddocuments="cd $DOCUMENTS"
alias cdkrypton="cd $KRYPTON"
alias cdlogs="cd $BEM_LOGS"
alias cdlocallow="cd $LOCALLOW"
alias cdlogsbem="cd $BEM_LOGS"
alias cdlogsbemlocal="cd $BEM_LOGS_LOCAL"
alias cdlogsbemk="cd $BEMK_LOGS"
alias cdlogssureclick="cd $SURECLICK_LOGS"
alias cdlogsbemsvc="cd $BEMSVC_LOGS"
alias cdlogsvsentry="cd /c/ProgramData/Bromium/vSentry/Logs"
alias cdbem-progdata="cd $PROGRAMDATA_BROMIUM/Bem"
alias cdbem-settings="cd $PROGRAMDATA_BROMIUM/Bem/Settings"
alias bem-settings="vim $PROGRAMDATA_BROMIUM/Bem/Settings/policy.xml"
alias cdevents="cd ~/AppData/Local/Bromium/vSentry/BrMVData/Security/Events"
alias cdbem="cd $BEM"
alias cdsureclick='cd "$SURECLICK_INSTALL_FOLDER"'
alias cdp2vtools='cd "$DEV/p2v-tools/bin"'
alias cdguestinstall="cd $GUEST_INSTALL"
alias cdbemtests="cd $BEM/tests"
alias cdtestlogs="cd /c/test"
alias cdashtestartifacts="cd /c/AshTestArtifacts/sure_sense/"
alias notes="vim $NOTES"
alias notes-npp="notepad++ $NOTES"
alias notes-code="code $NOTES"
alias cheatsheet="vim $CHEATSHEET"
alias cpp-code="code $CPPPLAY"
alias cpp-vim="cd $CPPPLAY && vim cpp/main.cpp"
alias cdscratch="cd ~/scratchpad"
alias cdwinkit="cd '$WINKIT'"
alias cdwinkitbin="cd '$WINKIT_BIN'"
alias cdwinkitinclude="cd '$WINKIT_INCLUDE'"
alias winkit-code="code '$WINKIT_INCLUDE'"
alias cdvisualstudio="cd '$VISUAL_STUDIO_DIR'"
alias cdmsvc="cd '$MSVC'"
alias msvc-code="code '$MSVC'"
alias cdprogramfiles="cd '$PROGRAMFILES'"
alias cdprogramfiles86="cd '$PROGRAMFILES_x86'"
alias cdprogramdata="cd '$PROGRAMDATA'"
alias cdsys32="cd /c/Windows/System32"
alias cddriversamples="cd $WIN_DRIVER_SAMPLES"
alias cdplayground="cd $MYREPOS/playground"
alias cdtmp="cd $HOME/Desktop/tmp"
alias cdtemp="cdtmr"


alias brake-conf="vim $HOME/.config/brake/brake.config"


export BEMSVC_SERVICE_NAME="BrEndpointSvc"

function bem() {
    python.exe /c/dev/p2v-tools/bin/bem.py "$@"
}

function vsentry() {
    python.exe /c/dev/p2v-tools/bin/vsentry.py "$@"
}

alias bem-kill="python.exe /c/dev/p2v-tools/bin/bem.py kill"
alias vsentry-kill="python.exe /c/dev/p2v-tools/bin/vSentry.py kill"
alias bem-resurrect="python.exe /c/dev/p2v-tools/bin/bem.py resurrect"
alias vsentry-resurrect="python.exe /c/dev/p2v-tools/bin/vsentry.py resurrect"
alias bem-clear-logs="python.exe /c/dev/p2v-tools/bin/bem.py clear-logs"
alias vsentry-clear-logs="python.exe /c/dev/p2v-tools/bin/vSentry.py clear-logs"
alias vsentry-grep-logs="python.exe /c/dev/p2v-tools/bin/vSentry.py grep-logs"
alias bem-test="python.exe $BEM/tests/run.py"
function clear-test-logs { rm -rf /c/test/*; rm -rf $BEM/tests/test-results/*; }
function clear-test-artifacts { 
    rm -rf /c/AshTestArtifacts/sure_sense/temp_av_ignore_dirs/tmp*;
}

alias brman='"$BRS/BrManage.exe"'
alias bemman='"$BRS/BemMan.exe"'
alias brremoteman='"$BRS/BrRemoteManagement.exe"'
alias brremoteman-update-status-policy='"$BRS/BrRemoteManagement.exe" --update-status-and-policy'
alias brremoteman-update-threats='"$BRS/BrRemoteManagement.exe" --update-threats'
alias brman-management-server-print='"$BRS/BrManage.exe" management-server print'
alias brman-state='brman vSentry get-state'
alias state=brman-state
alias state-watch="while brman-state | grep -i remaining; do sleep 1; done; notepad.exe"
alias brman-init-system-status='"$BRS/BrManage.exe" init-system status'
alias brman-init-user-request='"$BRS/BrManage.exe" init-user request && state-watch'
alias brman-init-system-request='"$BRS/BrManage.exe" init-system request && state-watch'
alias brman-init-cancel='"$BRS/BrManage.exe" init-system cancel'

function bemsvc-stop() {
    sc.exe stop $BEMSVC_SERVICE_NAME
}

function bemsvc-start() {
    sc.exe start $BEMSVC_SERVICE_NAME
}

function bemsvc-query() {
    sc.exe query $BEMSVC_SERVICE_NAME
}

function brman-config-get() {
    "$BRS/BrManage.exe" config get --name=$1
}

function brman-config-set() {
    if [ "$#" -lt 2 ]; then
        echo "Usage: brman-config-get <name> <value>"
        return 255
    fi
    "$BRS/BrManage.exe" config set --name=$1 --value=$2
}

function ls-install() {
    FOLDER="$SURECLICK_INSTALL_FOLDER/servers/"
    cd "$FOLDER"
    pwd
    l
    cd -
}
function ls-build() {
    FOLDER="$OUT/servers/"
    cd "$FOLDER"
    pwd
    l
    cd -
}

function cdinstall() {
    FOLDER="$SURECLICK_INSTALL_FOLDER/servers/"
    cd "$FOLDER"
}

function cdbuild() {
    FOLDER="$OUT/servers/"
    cd "$FOLDER"
}

function bem-update(){
    python.exe /c/dev/p2v-tools/bin/vSentry.py --verbose update --refresh-guest
    python.exe /c/dev/p2v-tools/bin/bem.py --verbose update $@
    ret=$?
    echo "bem-update finished with ret val: $ret"
    #if [[ $ret -eq 0 ]]; then
        #state-watch
    #fi
    return $ret
}
function rm-build-log() {
    if [[ -f /tmp/build.txt ]]; then
        rm /tmp/build.txt;
    fi
}
function build-clear() {
    clear;
    rm-build-log;
}

function bk-hostshellextension() {
    cd $KRYPTON
    ./brake.bat krypton --target HostShellExtension; ret="$?"; cd -; echo "Build returned: $ret";
    if [[ $ret -ne 0 ]]; then return $ret; fi;
    cd $KRYPTON
    ./brake.bat krypton --target HostShellExtension-sign; ret="$?"; cd -; echo "Build returned: $ret";
    return $ret;
}

function bk-bemshellext() {
    /c/dev/Krypton/brake.bat krypton --target SureSenseShellExt-dist; ret="$?"; 
    if [[ $ret -eq 0 ]]; then
        echo Build successful
    else
        echo Build failed
    fi
    clock;
    return $ret;
}

function bk-bemshellext-cp() {
    FOLDER=~/Desktop/tmp/
    bk-bemshellext && cp /c/dev/out/win7-64bit-ninja/servers/SureSenseShellExt.dll $FOLDER
    if [[ $? -eq 0 ]]; then
        echo Copied /c/dev/out/win7-64bit-ninja/servers/SureSenseShellExt.dll to $FOLDER
    else
        echo Failed copying SureSenseShellExt.dll
    fi
}

function bem-hostshellextension-update() {
    FILENAME="HostShellExtension.dll"
    FILENAME_PDB="HostShellExtension.pdb"
    FOLDER="$SURECLICK_INSTALL_FOLDER/4.3.20.0/servers"
    rm "$FOLDER/$FILENAME" "$SURECLICK_INSTALL_FOLDER/servers/$FILENAME"
    cp "$OUT/servers/$FILENAME" "$FOLDER/"
    cp "$OUT/servers/$FILENAME_PDB" "$FOLDER/"
    cp  "$OUT/servers/$FILENAME" "$SURECLICK_INSTALL_FOLDER/servers/"
    cp  "$OUT/servers/$FILENAME_PDB" "$SURECLICK_INSTALL_FOLDER/servers/"
    echo "DLLs:"
    md5sum "$OUT/servers/$FILENAME"
    md5sum "$FOLDER/$FILENAME"
    md5sum "$SURECLICK_INSTALL_FOLDER/servers/$FILENAME"
    echo ""
    echo "PDB files:"
    md5sum "$OUT/servers/$FILENAME_PDB"
    md5sum "$FOLDER/$FILENAME_PDB"
    md5sum "$SURECLICK_INSTALL_FOLDER/servers/$FILENAME_PDB"
}

# how to pass version or cmake define to brake
#./brake.bat init krypton installer --version 4.4.2.1 --cmakedefine "BRC_WSC_SUPPORT:BOOL=ON"
# --version 4.4.2.888 --cmakedefine "BRC_WSC_SUPPORT:BOOL=ON"
alias bki-installer='cd $KRYPTON && build-clear &&  ./brake.bat init krypton installer --version 4.4.2.888 --cmakedefine "BRC_WSC_SUPPORT:BOOL=ON" > /tmp/build.txt; ret="$?"; echo "Build script returned: $ret"; clock; notepad.exe /tmp/build.txt & cd -'
alias bk-installer='cd $KRYPTON && build-clear && ./brake.bat krypton installer --version 4.4.2.888 --cmakedefine "BRC_WSC_SUPPORT:BOOL=ON" > /tmp/build.txt; ret="$?"; echo "Build script returned: $ret"; clock; notepad.exe /tmp/build.txt & cd -'
alias bk-installer-apppack='cd $KRYPTON && build-clear && ./brake.bat krypton installer apppack --appname sure_sense --noguestinstaller > /tmp/build.txt; ret="$?"; echo "Build script returned: $ret"; clock; notepad.exe /tmp/build.txt & cd -'
alias bki='cd $KRYPTON && build-clear &&  ./brake.bat init krypton > /tmp/build.txt; ret="$?"; echo "Build script returned: $ret"; clock; notepad.exe /tmp/build.txt & cd -'
alias bk='cd $KRYPTON && build-clear && ./brake.bat krypton > /tmp/build.txt; ret="$?"; echo "Build script returned: $ret"; clock; notepad.exe /tmp/build.txt & cd -'
alias bkupdate='bk; if [[ $ret -eq 0 ]]; then bem-update; else echo "Build failed so wont run bem-update"; fi'
alias bkiupdate='bki; if [[ $ret -eq 0 ]]; then bem-update; else echo "Build failed so wont run bem-update"; fi'
function bk-bemsvc() {
    cd $KRYPTON && clear && clock; ./brake.bat krypton --target BemSvc-dist; ret="$?"; clock; cd -; echo "Build returned: $ret";
    return $ret;
}
function bk-bemsvc-cp() {
    FOLDER=~/Desktop/tmp/
    bk-bemsvc && cp "$OUT/servers/BemSvc.exe" $FOLDER
    if [[ $? -eq 0 ]]; then
        echo Copied /c/dev/out/win7-64bit-ninja/servers/BemSvc.exe to $FOLDER
    else
        echo Failed copying BemSvc.exe
    fi
}
function bk-bemsvc-update() {
    #if bk-bemsvc; then bem-update --skip-vsentry; fi;
    if bk-bemsvc; then bem-update; fi;
}

function bem-build-isuresense() {
    $KRYPTON/brake.bat init krypton --target ISureSenseInterface_wheel
}
function bem-build-tests() {
    bem-build-isuresense &&
    $KRYPTON/brake.bat init_bem bem krypton --target bem-test-deps && cd $KRYPTON/bem/tests && python.exe build.py --build; echo Return aval: $?; notepad.exe
}

alias nuke="cd $KRYPTON && clear && ./brake.bat nuke;"

function etl-update() {
    python.exe $P2VTOOLS/updateTmfs.py $OUT/servers/BemK_4_3_4_0.pdb
}
function etl-decode() {
    python.exe $P2VTOOLS/decodeEtl.py -o bemk.txt "$@"
}
function etl-decode-guest() {
    etl-decode --uxen 4.3.4.419 "$@"
}
function decode-brf() {
    python.exe /c/dev/Krypton/bem/scripts/decode_brf.py "$@"
}
function decode-xevts() {
    $KRYPTON/deps/uxen/buildoutput/hp_branded/dist/windows/filecrypt.exe "$@"
}

function dx() { decode-xevts -d "$1" `printf "$1%s" ".decoded"`;  }

function grep-bemk() {
    grep -P "$@" ./bemk.txt
}


# windows stuff
alias cffexplorer="'/c/Program Files/NTCore/Explorer Suite/CFF Explorer.exe'"
# eof windows stuff




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
git_config_global()
{
    git config --global --edit
}


alias cls="clear"
alias linecount=loc
alias mex="chmod +x"
alias grep="grep --color"
alias ff="find . -iname $@"
function g() {
    grep -R "$@" .
}
#function gp() {
    #if [ "$#" -eq 1 ]; then
        #grep -R -P "$1" .
    #else
        #grep -R -P "$@"
    #fi
#}

alias fzfrc='vim $HOME/.fzf.bash'
alias f="v -c Files"
alias cs="clip.exe"


function test-comment() {
    echo -n "retest this please, vSentry build with pr_smoke" | cs ;
}

function bem-test-scanpath() {
    clear-test-logs && bem-test $SYSTEMDRIVE/dev/Krypton/bem/tests/tests/sure_sense/test_com_interface.py::StatusReportingTests::test_scan_path
}

function bem-test-com-interface() {
    clear-test-logs && bem-test $SYSTEMDRIVE/dev/Krypton/bem/tests/tests/sure_sense/test_com_interface.py
}

function bem-test-license() {
    clear-test-logs && bem-test $SYSTEMDRIVE/dev/Krypton/bem/tests/tests/sure_sense/test_com_interface.py::ErrorStateTests::test_no_hp_license
}

function test-unzip-bemsvc() {
    filename=$1;
    7z-unzip-cdtodir $filename;
    cd Logs;
    7z-unzip-cdtodir BemLogs.7z
    cd BEM_Logs;
}


function jira-70183() {
    cdjiras; vim KRY-70183.md; cd -;
}

function jira-bemsvc-stop() {
    cdjiras; cd bemsvc-protected-shutdown; vim KRY-72857.md; cd -;
}

function 7z-unzip() {
    filename=$1
    basename="${filename%%.*}"
    7z x -o$basename "$1"
}

function 7z-unzip-cdtodir() {
    filename=$1;
    basename="${filename%%.*}";
    7z-unzip $filename;
    cd $basename;
}

function makecert() {
    "$WINKIT_BIN"/makecert.exe $@
}

function pvk2pfx() {
    "$WINKIT_BIN"/pvk2pfx.exe $@
}

function signtool() {
    "$WINKIT_BIN"/signtool.exe $@
} 

function gen-python-project() {
    if [[ -z $1 ]]; then echo "Usage: gen-python-project <projname>"; return 127; fi
    bash ~/bin/gen_python_project.sh $1
}

function gen-cpp-project() {
    if [[ -z $1 ]]; then echo "Usage: gen-python-project <projname>"; return 127; fi
    bash ~/bin/gen_cpp_project.sh $1
    cp -r "$VIMRC/vscode/.vscode" $1
    cp "$VIMRC/.clang-format" $1
    cp "$VIMRC/.clang-tidy" $1
}

function source_pytest3() {
    alias pytest='"$PYTHON3_DIR_SCRIPTS"/pytest.exe'
}

function currnotes() {
    pushdjiras
    vim KRY-75780-bemsvc-doesnt-run-on-upgrade-pre-mvi-to-mvi.md
    #vim README.md
    popd
}

function services-list() {
    sc queryex type=service state=all
}


function services-list-running() {
    sc queryex type=service
}

function services-query() {
    sc query $1
}

# ripgrep/rg
function rg() {
    rg.exe --no-heading "$@"
}


# nand2tetris
export NAND2TETRIS=$WORKSPACE/myrepos/nand2tetris
alias cdnand="cd $NAND2TETRIS"
alias nand2tetris-code="code $NAND2TETRIS"
# eof nand2tetris

function update-vimrc() {
    cdvimrc && git_lazy_push .;
    cd -;
}

function commit-message() {
    #echo | cs
    echo -n "KRY-76151 - $@" | cs
}
