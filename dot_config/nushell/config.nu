# create vendor/autoload dir
mkdir ($nu.data-dir | path join "vendor/autoload")

# starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# atuin
atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")

# jujutsu
jj util completion nushell | save -f ($nu.data-dir | path join "vendor/autoload/jujutsu.nu")

# broot
broot --print-shell-function nushell | save -f ($nu.data-dir | path join "vendor/autoload/broot.nu")
