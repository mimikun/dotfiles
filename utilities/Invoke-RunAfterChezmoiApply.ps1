# Run after chezmoi apply
function Invoke-RunAfterChezmoiApply() {
    Write-Output "post-apply-hook"

    Write-Output "Copy PowerShell profiles"
    $base_profile = Join-Path $env:USERPROFILE -ChildPath ".config\powershell\Microsoft.PowerShell_profile.ps1"
    $home_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $home_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $work_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $work_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    Copy-Item -Path $base_profile -Destination $home_pwsh_profile
    Copy-Item -Path $base_profile -Destination $home_powershell_profile
    Copy-Item -Path $base_profile -Destination $work_pwsh_profile
    Copy-Item -Path $base_profile -Destination $work_powershell_profile

    Write-Output "Copy vim (paleovim) configuration"
    $windows_vim_config = Join-Path -Path $env:USERPROFILE -ChildPath "vimfiles"
    $home_vim_config = Join-Path -Path $env:USERPROFILE -ChildPath ".config\vim"
    $work_vim_config = Join-Path -Path $env:USERPROFILE -ChildPath ".vim"
    if ($env:COMPUTERNAME -eq "TANAKAPC") {
        Copy-Item -Path $work_vim_config -Destination $windows_vim_config -Recurse
    } else {
        Copy-Item -Path $home_vim_config -Destination $windows_vim_config -Recurse
    }
}

Invoke-RunAfterChezmoiApply
