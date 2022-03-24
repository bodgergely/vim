Open x64 Native Tools Command Prompt for VS 2019
"%WindowsSdkDir%\tools\x64\devcon.exe" help
"%WindowsSdkDir%\tools\x64\devcon.exe" install .\K_MSRs.inf Root\K_MSRs
"%WindowsSdkDir%\tools\x64\devcon.exe" remove .\K_MSRs.inf Root\K_MSRs

or

right click 'Install' on nullFilter.inf
sc.exe start nullFilter

