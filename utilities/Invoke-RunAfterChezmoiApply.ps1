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

    Copy-Item -Path $base_profile -Destination $home_pwsh_profile
    Copy-Item -Path $base_profile -Destination $home_powershell_profile
    Copy-Item -Path $base_profile -Destination $work_pwsh_profile
    Copy-Item -Path $base_profile -Destination $work_powershell_profile

    #####################################
    # Copy vim (paleovim) configuration #
    #####################################

    Write-Output "Copy vim (paleovim) configuration"
    $windows_pvim_config = Join-Path -Path $env:USERPROFILE -ChildPath "vimfiles\"
    $home_pvim_config = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\vim\*"
    $work_pvim_config = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_vim\*"

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
