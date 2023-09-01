# completions setup
# starship setup
Invoke-Expression (starship init powershell --print-full-init | Out-String)
# starship completion
Invoke-Expression (starship completions powershell | Out-String)
# wezterm completion
Invoke-Expression (wezterm shell-completion --shell power-shell | Out-String)
# rustup completion
Invoke-Expression (rustup completions powershell | Out-String)
# chezmoi
Invoke-Expression (chezmoi completion powershell | Out-String)
# github-cli
Invoke-Expression (gh completion -s powershell | Out-String)
# just completion
# Powershell v7以上のときのみ読み込む
if ($True) {
    Invoke-Expression (just --completions powershell | Out-String)
}

$env:EDITOR = "nvim"

# alias bd
function Set-ParentLocation() {
    Set-Location ..
}
Set-Alias -Name bd -Value Set-ParentLocation

# alias touch
Set-Alias -Name touch -Value New-Item

# alias ls (lsd or exa)
Get-Command exa -ErrorAction Ignore | Out-Null
$res = $?
if ($res) {
    # alias ls exa
    Set-Alias -Name ls -Value exa
    # exa aliases
    function Invoke-ExaTree() {
        exa -T
    }
    Set-Alias -Name lt -Value Invoke-ExaTree
    function Invoke-ExaLa() {
        exa -la
    }
    Set-Alias -Name la -Value Invoke-ExaLa
}

# alias gcd
$env:PSGhqPath = "$env:GHQ_ROOT\github.com\mimikun\PSGhq\Set-GhqLocation.ps1"
if (Test-Path($env:PSGhqPath)) {
    . $env:PSGhqPath
    Set-Alias -Name gcd -Value Set-GhqLocation
}

# alias update_cargo_package
$env:UpdateCargoPackagePath = "$env:GHQ_ROOT\github.com\mimikun\update_cargo_packages\Invoke-UpdateCargoPackage.ps1"
if (Test-Path($env:UpdateCargoPackagePath)) {
    . $env:UpdateCargoPackagePath
    Set-Alias -Name update_cargo_package -Value Invoke-UpdateCargoPackage
}

# alias pueue_update_cargo_package
$env:PueueUpdateCargoPackagePath = "$env:GHQ_ROOT\github.com\mimikun\update_cargo_packages\Invoke-PueueUpdateCargoPackage.ps1"
if (Test-Path($env:PueueUpdateCargoPackagePath)) {
    . $env:PueueUpdateCargoPackagePath
    Set-Alias -Name pueue_update_cargo_package -Value Invoke-PueueUpdateCargoPackage
}

# alias vup
$env:VupPath = "$env:GHQ_ROOT\github.com\mimikun\vup\Invoke-Vup.ps1"
if (Test-Path($env:VupPath)) {
    . $env:VupPath
    Set-Alias -Name vup -Value Invoke-Vup
}

# alias vupueue
$env:VupueuePath = "$env:GHQ_ROOT\github.com\mimikun\vup\Invoke-Vupueue.ps1"
if (Test-Path($env:VupueuePath)) {
    . $env:VupueuePath
    Set-Alias -Name vupueue -Value Invoke-Vupueue
}

# alias chezmoi_cd
function Set-ChezmoiDirLocation() {
    Set-Location $env:CHEZMOI_DIR
}
Set-Alias -Name chezmoi_cd -Value Set-ChezmoiDirLocation
