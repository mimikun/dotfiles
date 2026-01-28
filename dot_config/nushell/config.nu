# create vendor/autoload dir
mkdir ($nu.data-dir | path join "vendor/autoload")

# starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# oh-my-posh
#oh-my-posh init nu --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/tokyonight_storm.omp.json' | save -f ($nu.data-dir | path join "vendor/autoload/oh-my-posh.nu")

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

# rip
rip completions nushell | save -f ($nu.data-dir | path join "vendor/autoload/rip.nu")

#use '/home/yuto/.x-cmd.root/local/data/nu/rc.nu' *; source '/home/yuto/.x-cmd.root/local/data/nu/advise.nu'; # boot up x-cmd.

# pixi
pixi completion --shell nushell | save -f ($nu.data-dir | path join "vendor/autoload/pixi-completions.nu")

# intelli-shell
intelli-shell init nushell | save -f ($nu.data-dir | path join "vendor/autoload/intelli-shell.nu")

# jump
jump shell nushell | save -f ($nu.data-dir | path join "vendor/autoload/jump.nu")

# try-rs
source '/home/mimikun/.config/try-rs/try-rs.nu'

