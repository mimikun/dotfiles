# Run after chezmoi apply
function Invoke-RunAfterChezmoiApply() {
    Write-Output "post-apply-hook"
    $home_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $home_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $work_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $work_powershell_profile = Join-Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    $base_profile = $home_pwsh_profile
    Copy-Item -Path $base_profile -Destination $home_powershell_profile
    Copy-Item -Path $base_profile -Destination $work_pwsh_profile
    Copy-Item -Path $base_profile -Destination $work_powershell_profile
}

Invoke-RunAfterChezmoiApply
