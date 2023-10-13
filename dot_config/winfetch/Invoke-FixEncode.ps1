$file_path = "config.ps1"
$file = Get-Content -Path $file_path
Set-Content -Path $file_path -Value $file -Encoding "utf8BOM"
