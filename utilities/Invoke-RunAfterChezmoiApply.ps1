# Run after chezmoi apply
function Invoke-RunAfterChezmoiApply() {
    Write-Output "post-apply-hook"

    ############################
    # Copy PowerShell profiles #
    ############################

    Write-Output "Copy PowerShell profiles"
    $base_profile = Join-Path $env:USERPROFILE -ChildPath ".config\powershell\Microsoft.PowerShell_profile.ps1"
    $home_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $home_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $work_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $work_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    if ($env:COMPUTERNAME -eq "TANAKAPC") {
        Copy-Item -Path $base_profile -Destination $work_pwsh_profile
        Copy-Item -Path $base_profile -Destination $work_powershell_profile
    } else {
        Copy-Item -Path $base_profile -Destination $home_pwsh_profile
        Copy-Item -Path $base_profile -Destination $home_powershell_profile
    }

    ####################################
    # Copy nvim (neovim) configuration #
    ####################################

    $windows_nvim_config = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim\"
    $linux_nvim_config = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\nvim\*"

    Write-Output "Remove old nvim(neovim) configuration"
    Remove-Item $windows_nvim_config

    # folder exist check
    if (-not (Test-Path -Path $windows_nvim_config)) {
        # mkdir $windows_nvim_config
        New-Item -Path $windows_nvim_config -ItemType "directory" > $null
    }

    Write-Output "Copy nvim (neovim) configuration"
    Copy-Item -Path $linux_nvim_config -Destination $windows_nvim_config -Recurse -Force

    #####################################
    # Copy vim (paleovim) configuration #
    #####################################

    Write-Output "Copy vim (paleovim) configuration"
    $windows_pvim_config = Join-Path -Path $env:USERPROFILE -ChildPath "vimfiles\"
    $home_pvim_config = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\vim\*"
    $work_pvim_config = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_vim\*"

    Write-Output "Remove old vim(paleovim) configuration"
    Remove-Item $windows_pvim_config

    # folder exist check
    if (-not (Test-Path -Path $windows_pvim_config)) {
        # mkdir $windows_pvim_config
        New-Item -Path $windows_pvim_config -ItemType "directory" > $null
    }

    if ($env:COMPUTERNAME -eq "TANAKAPC") {
        Copy-Item -Path $work_pvim_config -Destination $windows_pvim_config -Recurse -Force
    } else {
        Copy-Item -Path $home_pvim_config -Destination $windows_pvim_config -Recurse -Force
    }
}

Invoke-RunAfterChezmoiApply
