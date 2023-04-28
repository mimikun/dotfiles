today := `Get-Date -UFormat '%Y%m%d'`
product_name := "dotfiles"
gpg_pub_key := "CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"
set shell := ["pwsh", "-c"]
set windows-shell := ["pwsh.exe", "-NoLogo", "-Command"]
win_download := if os() == "windows" {
    $env:USERPROFILE\Downloads\
} else {
    $env:WIN_HOME\Downloads\
}

default :
    @just --list

alias fmt := format

patch : clean diff-patch copy2win-patch

diff-patch-raw :
    git diff origin/master > {{product_name}}.{{today}}.patch

[linux]
diff-patch-gpg :
    git diff origin/master | gpg --encrypt --recipient {{gpg_pub_key}} > {{product_name}}.{{today}}.patch.gpg

diff-patch : diff-patch-raw

patch-branch :
    git switch -c patch-{{today}}

switch-master :
    git switch master

[linux]
delete-branch : switch-master
    git branch --list "patch*" | xargs -n 1 git branch -D

[windows]
delete-branch : switch-master
    git branch --list "patch*" | ForEach-Object{ $_ -replace " ", "" } | ForEach-Object { git branch -d $_ }

clean :
    Remove-Item *.patch
    Remove-Item *.patch.gpg
    Remove-Item dot_config/fish/completions/bd.fish
    Remove-Item dot_config/fish/completions/docker-compose.fish
    Remove-Item dot_config/fish/completions/docker.fish
    Remove-Item dot_config/fish/completions/fisher.fish
    Remove-Item dot_config/fish/completions/ghq.fish
    Remove-Item dot_config/fish/completions/gitignore.fish
    Remove-Item dot_config/fish/completions/spin.fish
    Remove-Item dot_config/fish/completions/poetry.fish
    Remove-Item dot_config/fish/completions/hwm.fish

[linux]
update : clean
    cp ~/.config/fish/completions/* ./dot_config/fish/completions/
    cp ~/.config/fish/fish_plugins ./dot_config/fish/fish_plugins
    chezmoi add ~/.tool-versions
    chezmoi add ~/asdf_plugin_list.txt
    chezmoi add ~/cargo_packages.txt
    chezmoi add ~/.local/bin/generate_cargo_package_list
    chezmoi add ~/.local/bin/git-ammend-commit
    chezmoi add ~/.local/bin/git-browse
    chezmoi add ~/.local/bin/git-hash
    chezmoi add ~/.local/bin/git-ignore
    chezmoi add ~/.local/bin/install_asdf_plugins
    chezmoi add ~/.local/bin/install_cargo_packages
    chezmoi add ~/.local/bin/install_gh_extensions
    chezmoi add ~/.local/bin/numeronym
    chezmoi add ~/.local/bin/pcd
    chezmoi add ~/.local/bin/re_boot
    chezmoi add ~/.local/bin/read_confirm
    chezmoi add ~/.local/bin/shut_down
    chezmoi add ~/.local/bin/update_asdf_neovim_nightly
    chezmoi add ~/.local/bin/update_bat_fish_completion
    chezmoi add ~/.local/bin/update_chromedriver
    chezmoi add ~/.local/bin/update_docker_compose
    chezmoi add ~/.local/bin/update_fish_completions
    chezmoi add ~/.local/bin/update_geckodriver
    chezmoi add ~/.local/bin/update_ripgrep_fish_completion
    chezmoi add ~/.local/bin/vupueue
    chezmoi add ~/.config/gup/gup.conf

copy2win-patch-raw :
    cp *.patch {{win_download}}

[linux]
copy2win-patch-gpg :
    cp *.patch.gpg {{win_download}}

copy2win-patch : copy2win-patch-raw

lint : stylua-lint

stylua-lint :
    stylua --check ./

format : stylua-format

stylua-format :
    stylua ./

[linux]
apply-windows-powershell-config :
        cp windows/Microsoft.PowerShell_profile.ps1 $env:WIN_HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
        cp windows/Microsoft.PowerShell_profile.ps1 $env:WIN_HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

[linux]
apply : apply-windows-powershell-config
    chezmoi apply
