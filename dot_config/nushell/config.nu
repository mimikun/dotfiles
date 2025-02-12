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

# Equationzhao/g
^g --init nushell | save -f ($nu.data-dir | path join "vendor/autoload/.g.nu")
# NOTE: if you want to replace nushell's g command with g
#def nug [arg?] {
#    if ($arg == null) {
#        g $arg
#    } else {
#        g
#    }
#}
#alias g = ^g
