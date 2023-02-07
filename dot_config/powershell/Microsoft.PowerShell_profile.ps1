# alias
Set-Alias -Name vim -Value nvim

# function
function gcd-fzf {
  $ghqrepo = $(ghq list -p | fzf)
  Set-Location $ghqrepo
}

# keybinding
# Set CTRL+G to Gcd
Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock {
  gcd-fzf
}

# starship config
$starship = '~/.cargo/bin/starship'
$starship init powershell --print-full-init | Out-String | Invoke-Expression
$starship completions powershell | Out-String | Invoke-Expression
