$tmp = Join-Path -Path $env:USERPROFILE -ChildPath ".mimikun-pkglists"
$filepath = Join-Path -Path $tmp -ChildPath "windows_cargo_packages.txt"

function Invoke-GenerateCargoPackageList() {
    cargo install-update --list |
    Select-Object -Skip 3 |
    ForEach-Object { $_.Split(" ")[0] } |
    Where-Object { $_ -ne "" } |
    Out-File -FilePath $filepath -Encoding utf8
}

Set-Alias -Name generate_cargo_package_list -Value Invoke-GenerateCargoPackageList
