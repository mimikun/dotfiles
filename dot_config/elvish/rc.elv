# elvish config file
eval (starship init elvish)
eval (mdbook completion elvish)
eval (pixi completion --shell elvish | slurp)
if (eq $E:TERM "xterm-ghostty") {
  use ghostty-integration
}
