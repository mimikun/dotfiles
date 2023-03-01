Write-Output "Please edit this PowerShell script file!!!"
pause

$file = "\path\to\cargo_packages.txt"

foreach ($crate in Get-Content $file) {
    cargo install $crate
    Start-Sleep -Seconds 5
}
