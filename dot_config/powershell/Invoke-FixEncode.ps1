$pwsh_config_path = "Microsoft.PowerShell_profile.ps1"
$pwsh_config_file = Get-Content -Path $pwsh_config_path
Set-Content -Path $pwsh_config_path -Value $pwsh_config_file -Encoding "utf8BOM"
