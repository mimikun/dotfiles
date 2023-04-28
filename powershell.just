# Windows only
# Windows PowerShell v5
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]
today := `Get-Date -UFormat '%Y%m%d'`
product_name := "dotfiles"

default :
    @just --list

alias fmt := format

patch : clean diff-patch copy2win-patch

diff-patch-raw :
    git diff origin/master > {{product_name}}.{{today}}.patch

diff-patch : diff-patch-raw

patch-branch :
    git switch -c patch-{{today}}

switch-master :
    git switch master

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

update : clean
    Write-Output "手動でファイルをコピーしてください"

copy2win-patch-raw :
    cp *.patch $WIN_HOME/Downloads/

copy2win-patch : copy2win-patch-raw

lint : stylua-lint

stylua-lint :
    stylua --check ./

format : stylua-format

stylua-format :
    stylua ./
