# Run before chezmoi apply

function Invoke-RunBeforeChezmoiApply() {
    Write-Output "pre-apply-hook"
    # TODO: set $env:BW_SESSION

    # Copy config file from Linux
    $home_pwsh_profile = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1.tmpl"
    $base_profile = Join-Path $env:CHEZMOI_DIR -ChildPath "dot_config/powershell/Microsoft.PowerShell_profile.ps1.tmpl"
    Copy-Item -Path $base_profile -Destination $home_powershell_profile
}

Invoke-RunBeforeChezmoiApply
