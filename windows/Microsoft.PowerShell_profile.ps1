function CustomSudo {Start-Process powershell.exe -Verb runas}
sal sudo CustomSudo

function CustomShutdown {Stop-Computer}
sal shutdown CustomShutdown

function CustomReboot {Restart-Computer}
sal reboot CustomReboot

function CustomRebootUbuntu {wsl -t ubuntu}
sal rebootubuntu CustomRebootUbuntu

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# starship config
Invoke-Expression (& 'C:\ProgramData\chocolatey\lib\starship\tools\starship.exe' init powershell --print-full-init | Out-String)

