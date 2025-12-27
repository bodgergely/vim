Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
# EOF Choco profile

Set-PSReadLineOption -EditMode Emacs
Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value vim
Function notes {vim "C:\Users\gergely.bod\OneDrive - HP Inc\notes.md"}
Function cheatsheet {vim "C:\Users\gergely.bod\workspace\vimrc\CHEATSHEET.md"}
Function profile-open {notepad++.exe $PROFILE}
#Function vimrc { vim $env:HOMEPATH\.vimrc }
Function vimrc { vim $env:HOMEPATH\AppData\Local\nvim\init.vim }
$env:DEV="C:\dev"
$env:OUT="$env:DEV\out\win7-64bit-ninja"
$env:BEM_BUILD_LOCATION="$env:OUT\bem"
Function cdworkspace { cd $HOME\workspace }
Function cddev {cd $env:DEV }
Function cdkrypton {cd $env:DEV/Krypton }
Function cdbem {cd $env:DEV/Krypton/bem }
Function cdbemtests {cd $env:DEV/Krypton/bem/tests }
Function cdscratch {cd $env:HOMEPATH/scratchpad }
Function cdout {cd $env:OUT}

Set-Alias -Name ae -Value profile-open
# Set-Alias -Name gm -Value Get-Member
Set-Alias -Name find -Value "C:\Users\gergely.bod\Progs\GnuWin32\bin\find.exe"
#new-alias grep findstr
$env:GITBASH_BIN="C:\Program Files\Git\usr\bin"
Function grep { & $env:GITBASH_BIN\grep.exe $args }


Function cdtmp {cd "$env:USERPROFILE\AppData\Local\"}
function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function gh($command)
{
    Get-Help $command -full | less 
}

Remove-Item Alias:man
Set-Alias -Name man -Value gh

function Color-Console {
#  $Host.ui.rawui.backgroundcolor = "blue"
#  $Host.ui.rawui.foregroundcolor = "white"
  $hosttime = (Get-ChildItem -Path $PSHOME\PowerShell.exe).CreationTime
  $hostversion="$($Host.Version.Major)`.$($Host.Version.Minor)"
  $Host.UI.RawUI.WindowTitle = "PowerShell $hostversion ($hosttime)"
  Clear-Host
}
Color-Console

function Prompt
{
#$env:COMPUTERNAME + "\" + (Get-Location) + "> "
"" + (Get-Location) + "> "
}

Set-PSReadlineOption -BellStyle None

####################
#### Functions #####
####################

Function traceroute
{
    Start-Process -FilePath "$env:systemroot\system32\tracert.exe" -ArgumentList $args -NoNewWindow
}

function printApplicationThreads($processname) 
{
    foreach($proc in (Get-Process -Name $processname)) 
    {   
        $id=$proc.Id; 
        echo "Process: $id"; 
        $proc.Threads | ForEach-Object Id 
    }
}


function bem-test()
{
    & python.exe C:\dev\Krypton\bem\tests\run.py $args
}

function logbundle-generate($path)
{
    &"$env:BRS/BrLogMgr.exe" zip --all_users --output_zip=$path
}

function bem-update()
{
    & python.exe C:\dev\p2v-tools\bin\bem.py --verbose update
    echo "bem-update returned: $?"
}
function bem-kill()
{
    & python.exe C:\dev\p2v-tools\bin\bem.py --verbose kill
    echo "bem-kill returned: $?"
}

function bem-resurrect()
{
    & python.exe C:\dev\p2v-tools\bin\bem.py --verbose resurrect
    echo "bem-resurrect returned: $?"
}

function bem-python-activate()
{
    C:\dev\Krypton\bem\tests\.virtualenv\Scripts\activate.ps1
}

function bem-selftests
{
    cd C:\dev\Krypton\bem\tests
    bem-python-activate
    python run.py selftests
}

function clear-test-logs()
{
    rm -Recurse C:\test\*
    rm -Recurse C:\dev\Krypton\bem\tests\test-results\*
}

function bem-test-scanpath()
{
    clear-test-logs
	python.exe C:\dev\Krypton\bem\tests\run.py C:\dev\Krypton\bem\tests\tests\sure_sense\test_com_interface.py::StatusReportingTests::test_scan_path
}


function bemsvc-stop() {
    sc.exe stop BrEndpointSvc
}

function bemsvc-start() {
    sc.exe start BrEndpointSvc
}

function bemsvc-query() {
    sc.exe query BrEndpointSvc
}

function bem-delete-logs() {
	rm C:\ProgramData\Bromium\BEM\logs\BemSvc\*
}

function bem-clear-logs() 
{
	bemsvc-stop
	sleep 5
	bem-delete-logs
	bemsvc-start
}


function Install-Driver($name)
{
	$cleanName = $name -replace ".sys|.\\", ""

	sc.exe stop $cleanName
	sc.exe delete $cleanName

	cp $name c:\windows\system32\drivers\ -verbose -force
	sc.exe create $cleanName type= kernel start= demand error= normal binPath= c:\windows\System32\Drivers\$cleanName.sys DisplayName= $cleanName

	sc.exe start $cleanName
}

cd ~
