function Invoke-InstallCargoPackage {
    function Invoke-ExistsCmd() {
        Param($cmdName)
        Get-Command -Name $cmdName > $null 2>&1
        $result = $?
        return $result
    }

    $tmp = Join-Path -Path $env:USERPROFILE -ChildPath ".mimikun-pkglists"
    $pkglist = Join-Path -Path $tmp -ChildPath "windows_cargo_packages.txt"

    Get-Content -Path $pkglist |
    ForEach-Object {
        $pkg = $_
        $cond = Invoke-ExistsCmd $pkg
        if (-not $cond) {
            Write-Output "$pkg is not found"
            cargo install $pkg
        }
    }
}

Set-Alias -Name install_cargo_package -Value Invoke-InstallCargoPackage
