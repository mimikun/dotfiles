# alias
Set-Alias -Name vim -Value nvim

# PSGhq setup
$PSGhqPath = "$env:GHQ_ROOT\github.com\mimikun\PSGhq\Set-GhqLocation.ps1"
if (Test-Path($PSGhqPath)) {
    . $PSGhqPath
    Set-Alias -Name gcd -Value Set-GhqLocation
}

# keybinding
# Set CTRL+G to Gcd
Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock {
  gcd
}

# starship config
Invoke-Expression (& "$HOME/.cargo/bin/starship" init powershell --print-full-init | Out-String)
Invoke-Expression (& "$HOME/.cargo/bin/starship" completions powershell | Out-String)

# wezterm config
Invoke-Expression (& wezterm shell-completion --shell power-shell | Out-String)
