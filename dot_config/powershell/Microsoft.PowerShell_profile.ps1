# alias
Set-Alias -Name vim -Value nvim

# function
function gcd-fzf {
  $repo = $(ghq list -p | fzf)
  Set-Location $repo
}

# keybinding
# Set CTRL+G to Gcd
Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock {
  gcd-fzf
}

# starship config
$starship = '~/.cargo/bin/starship'

Invoke-Expression (& $starship init powershell --print-full-init | Out-String)
Invoke-Expression (& $starship completions powershell | Out-String)
