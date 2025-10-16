# elvish config file
eval (starship init elvish)
eval (mdbook completion elvish)
eval (pixi completion --shell elvish | slurp)
eval (dotter gen-completions --shell elvish)
eval (tombi completion elvish)
if (eq $E:TERM "xterm-ghostty") {
  use ghostty-integration
}
