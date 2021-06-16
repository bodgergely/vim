Set-PSReadLineOption -EditMode Emacs
Function cheatsheet {vim "C:\Users\bodge\workspace\vimrc\CHEATSHEET.md"}
Function profile-open {vim "C:\Users\bodge\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"}
Set-Alias -Name ae -Value profile-open
Function cdtmp {cd "$env:USERPROFILE\AppData\Local\"}
