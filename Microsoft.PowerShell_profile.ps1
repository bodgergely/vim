# /C/Users/bodge/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Set-PSReadLineOption -EditMode Emacs
Function cheatsheet {vim "C:\Users\bodge\workspace\vimrc\CHEATSHEET.md"}
Function profile-open {vim $PROFILE}
Function cdworkspace { cd $HOME\workspace }
Set-Alias -Name v -Value vim

Set-Alias -Name ae -Value profile-open
Set-Alias -Name gm -Value Get-Member



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