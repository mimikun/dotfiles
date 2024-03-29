# Tasks for dotfiles

Using [mask](https://github.com/jacobdeichert/mask)

## fixgit

> Delete .git\index.lock (Windows Only)

```bash
echo "Linux is not support!"
```

```powershell
if (Test-Path .\.git\index.lock) {
    Remove-Item .\git\index.lock
}
```

## fixencoding

> Fix the encoding of tasks.ps1 (Windows Only)

```bash
echo "Linux is not support!"
```

```powershell
$taskfile_path = "tasks.ps1"
$taskfile_file = Get-Content -Path $taskfile_path
Set-Content -Path $taskfile_path -Value $taskfile_file -Encoding "UTF8"
```

## patch

> Create a patch and copy it to windows

```bash
mask clean
mask diff-patch
mask copy2win-patch
```

```powershell
mask clean
mask diff-patch
mask copy2win-patch
```

## gpg-patch

> Create a GPG-encrypted patch and copy it to Windows

```bash
mask clean
mask diff-patch --gpg
mask copy2win-patch --gpg
```

```powershell
mask clean
mask diff-patch --gpg
mask copy2win-patch --gpg
```

## diff-patch

> Create a patch

**OPTIONS**
* gpg
    * flags: --gpg
    * desc: Use GPG encrypt

```bash
PRODUCT_NAME="dotfiles"
DEFAULT_REMOTE="origin"
DEFAULT_BRANCH="master"
TODAY=$(date +'%Y%m%d')
BRANCH_NAME=$(git branch --show-current)
GPG_PUB_KEY="CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"

if [[ "$BRANCH_NAME" = "$DEFAULT_BRANCH" ]] || [[ "$BRANCH_NAME" = "patch-"* ]]; then
    echo "This branch is $DEFAULT_BRANCH or patch branch"

    for p in "$PRODUCT_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
else
    echo "This branch is uniq feat branch"

    for p in "$PRODUCT_NAME" "_" "$BRANCH_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
fi

if [[ "$gpg" == "true" ]]; then
    GPG_PATCH_NAME+=$PATCH_NAME
    GPG_PATCH_NAME+=".gpg"
    echo "gpg patch file name: $GPG_PATCH_NAME"
    git diff "$DEFAULT_REMOTE/$DEFAULT_BRANCH" | gpg --encrypt --recipient "$GPG_PUB_KEY" >"$GPG_PATCH_NAME"
else
    echo "patch file name: $PATCH_NAME"
    git diff "$DEFAULT_REMOTE/$DEFAULT_BRANCH" >"$PATCH_NAME"
fi
```

```powershell
param(
    $gpg = $env:gpg
)

$product_name = "dotfiles-windows"
$default_remote = "origin"
$default_branch = "master"
$today = Get-Date -UFormat '%Y%m%d'
$branch_name = (git branch --show-current)
$gpg_pub_key = "CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"

if (($branch_name -eq $default_branch) -or ($branch_name -match "^patch-*")) {
    Write-Output "This branch is $default_branch or patch branch"
    $patch_name = "$product_name.$today.patch"
} else {
    $branch_name = $branch_name -replace "/", "-"

    Write-Output "This branch is uniq feat branch"
    $patch_name = "$product_name.$branch_name.$today.patch"
}

$TempMyOutputEncode=[System.Console]::OutputEncoding
[System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

if ($gpg) {
    $gpg_patch_name = "$patch_name.gpg"
    Write-Output "gpg patch file name: $gpg_patch_name"
    #git diff "$default_remote/$default_branch" | 
    #gpg --encrypt --recipient "$gpg_pub_key" >"$gpg_patch_name"
    Write-Output "Windows is not gpg support!"
} else {
    Write-Output "patch file name: $patch_name"
    git diff "$default_remote/$default_branch" | Out-File -Encoding default -FilePath $patch_name
}

[System.Console]::OutputEncoding=$TempMyOutputEncode
```

## patch-branch

> Create a patch branch

```bash
TODAY=$(date +'%Y%m%d')
git switch -c "patch-$TODAY"
```

```powershell
$TODAY = Get-Date -UFormat '%Y%m%d'
git switch -c "patch-$today"
```

## switch-master

> Switch to DEFAULT branch

```bash
DEFAULT_BRANCH="master"
git switch "$DEFAULT_BRANCH"
```

```powershell
$DEFAULT_BRANCH = "master"
git switch $DEFAULT_BRANCH
```

## delete-branch

> Delete patch branch

```bash
mask clean
mask switch-master
git branch --list "patch*" | xargs -n 1 git branch -D
```

```powershell
mask clean
mask switch-master
git branch --list "patch*" | ForEach-Object{ $_ -replace " ", "" } | ForEach-Object { git branch -D $_ }
```

## clean

> Run clean

```bash
# patch
rm -f ./*.patch
rm -f ./*.patch.gpg

# fish completions
rm -f dot_config/fish/completions/bd.fish
rm -f dot_config/fish/completions/docker-compose.fish
rm -f dot_config/fish/completions/docker.fish
rm -f dot_config/fish/completions/fisher.fish
rm -f dot_config/fish/completions/ghq.fish
rm -f dot_config/fish/completions/gitignore.fish
rm -f dot_config/fish/completions/spin.fish
rm -f dot_config/fish/completions/poetry.fish
rm -f dot_config/fish/completions/hwm.fish

# zip file
rm -f ./*.zip
rm -f dot_config/nvim/nvim-conf.zip
rm -f dot_vim/vim-conf.zip
```

```powershell
$home_only_file =@(
    '$env:USERPROFILE\utilities\GamingMode.bat'
    '$env:USERPROFILE\utilities\Mining.bat'
    '$env:USERPROFILE\utilities\MiningMode.bat'
    '$env:USERPROFILE\utilities\StopTrex.bat'
    '$env:USERPROFILE\utilities\StopTrex.ps1'
    '$env:USERPROFILE\utilities\dual-gminer-mining.bat'
    '$env:USERPROFILE\utilities\gminer-flux-mining.bat'
    '$env:USERPROFILE\utilities\gminer-mining.bat'
    '$env:USERPROFILE\utilities\lolminer-mining.bat'
    '$env:USERPROFILE\utilities\miniz-flux-mining.bat'
    '$env:USERPROFILE\utilities\t-rex-mining.bat'
)

Remove-Item *.patch
Remove-Item *.patch.gpg
Remove-Item *.zip

if ($env:COMPUTERNAME -eq "TANAKAPC") {
    $home_only_file |
        ForEach-Object {
            if (Test-Path $_) {
                Remove-Item $_
            }
        }
}
```

## update

> Run update

```bash
mask clean

host_name=$(cat /etc/hostname)

# fish
cp ~/.config/fish/completions/* ./dot_config/fish/completions/
cp ~/.config/fish/fish_plugins ./dot_config/fish/fish_plugins

# mise
chezmoi add ~/.mise.toml
chezmoi add ~/.config/mise/config.toml
chezmoi add ~/.config/mise/settings.toml

# cargo packages
chezmoi add ~/linux_cargo_packages.txt

# pip packages
chezmoi add ~/linux_pip_packages.txt

# Brewfile
chezmoi add ~/Brewfile

# go packages (managed by gup)
chezmoi add ~/.config/gup/gup.conf

# managed by aqua
chezmoi add ~/.config/aqua/aqua.yaml
chezmoi add ~/.config/aqua/policy.yaml
chezmoi add ~/.config/aqua/registry.yaml

# lazy.nvim lockfile
chezmoi add ~/.config/nvim/lazy-lock.json

# mason.nvim lockfile (mason-lock.nvim)
chezmoi add ~/.config/nvim/mason-lock.json

# dotfyle.json
chezmoi add ~/.config/nvim/dotfyle.json
deno fmt dot_config/nvim/dotfyle.json

# ~/.local/bin/*
chezmoi add ~/.local/bin/chezmoi_post_apply_hook
chezmoi add ~/.local/bin/chezmoi_pre_apply_hook
chezmoi add ~/.local/bin/editorconfig
chezmoi add ~/.local/bin/generate_cargo_package_list
chezmoi add ~/.local/bin/generate_pip_package_list
chezmoi add ~/.local/bin/git-amend-commit
chezmoi add ~/.local/bin/git-browse
chezmoi add ~/.local/bin/git-hash
chezmoi add ~/.local/bin/git-ignore
chezmoi add ~/.local/bin/install_cargo_packages
chezmoi add ~/.local/bin/install_gh_extensions
chezmoi add ~/.local/bin/install_pip_packages
chezmoi add ~/.local/bin/lk
chezmoi add ~/.local/bin/numeronym
chezmoi add ~/.local/bin/pcd
chezmoi add ~/.local/bin/pueue_update_cargo_packages
chezmoi add ~/.local/bin/pueue_update_pip_packages
chezmoi add ~/.local/bin/re_boot
chezmoi add ~/.local/bin/read_confirm
chezmoi add ~/.local/bin/shut_down
chezmoi add ~/.local/bin/update_bat_fish_completion
chezmoi add ~/.local/bin/update_cargo_packages
chezmoi add ~/.local/bin/update_chromedriver
chezmoi add ~/.local/bin/update_docker_compose
chezmoi add ~/.local/bin/update_fish_completions
chezmoi add ~/.local/bin/update_geckodriver
chezmoi add ~/.local/bin/update_helix_fish_completion
chezmoi add ~/.local/bin/update_pip_packages
chezmoi add ~/.local/bin/update_pnpm
chezmoi add ~/.local/bin/update_poetry
chezmoi add ~/.local/bin/update_twitch_cli
chezmoi add ~/.local/bin/vup
chezmoi add ~/.local/bin/wsl-open

# ArchLinux configs
# HOSTNAME = azusa ONLY
if [ "$host_name" = "azusa" ]; then
    chezmoi add ~/.config/i3/config
    chezmoi add ~/.config/i3status-rust/config.toml
    chezmoi add ~/.config/fcitx5/config
    chezmoi add ~/.config/betterlockscreen/betterlockscreenrc
    chezmoi add ~/.config/polybar/config.ini
    #chezmoi add ~/.config/rofi/config.rasi
    chezmoi add ~/.config/flameshot/flameshot.ini

    chezmoi add ~/.xinitrc
    chezmoi add ~/.xmodmap
    chezmoi add ~/.Xresources
fi
```

```powershell
$home_only_file =@(
    '$env:USERPROFILE\utilities\GamingMode.bat'
    '$env:USERPROFILE\utilities\Mining.bat'
    '$env:USERPROFILE\utilities\MiningMode.bat'
    '$env:USERPROFILE\utilities\StopTrex.bat'
    '$env:USERPROFILE\utilities\StopTrex.ps1'
    '$env:USERPROFILE\utilities\dual-gminer-mining.bat'
    '$env:USERPROFILE\utilities\gminer-flux-mining.bat'
    '$env:USERPROFILE\utilities\gminer-mining.bat'
    '$env:USERPROFILE\utilities\lolminer-mining.bat'
    '$env:USERPROFILE\utilities\miniz-flux-mining.bat'
    '$env:USERPROFILE\utilities\t-rex-mining.bat'
)

mask clean

# contour
chezmoi add $env:USERPROFILE\AppData\Local\contour\contour.yml

# GitHub CLI config
chezmoi add "$env:USERPROFILE\AppData\Roaming\GitHub CLI\config.yml"
chezmoi add "$env:USERPROFILE\AppData\Roaming\GitHub CLI\hosts.yml"

# Hyper config
chezmoi add $env:USERPROFILE\AppData\Roaming\Hyper\config.json
chezmoi add $env:USERPROFILE\AppData\Roaming\Hyper\.hyper.js

if ($env:COMPUTERNAME -ne "TANAKAPC") {
    # SKKFEP
    chezmoi add $env:USERPROFILE\AppData\Roaming\SKKFEP\skkuser.txt

    # CorvusSKK
    chezmoi add $env:USERPROFILE\AppData\Roaming\CorvusSKK\userdict.txt
}


# alacritty
chezmoi add $env:USERPROFILE\AppData\Roaming\alacritty\alacritty.yml

# lsd
chezmoi add $env:USERPROFILE\AppData\Roaming\lsd\config.yaml

# pueue
chezmoi add $env:USERPROFILE\AppData\Roaming\pueue\pueue.yml

# komorebi files
chezmoi add $env:USERPROFILE\applications.yaml
chezmoi add $env:USERPROFILE\komorebi.json

# whkd config
chezmoi add $env:USERPROFILE\.config\whkdrc

# winfetch config
chezmoi add $env:USERPROFILE\.config\winfetch\config.ps1

# GlazeWM config
chezmoi add $env:USERPROFILE\.glaze-wm\config.yaml

# nyagos config
chezmoi add $env:USERPROFILE\.nyagos

# cargo package list
#chezmoi add $env:USERPROFILE\cargo_packages.txt

# starship config
#chezmoi add $env:USERPROFILE\.config\starship.toml

# wezterm config
chezmoi add $env:USERPROFILE\.config\wezterm\wezterm.lua

# gitignore_global
chezmoi add $env:USERPROFILE\.gitignore_global

# ssh config
#chezmoi add $env:USERPROFILE\.ssh\config

# doskey config
chezmoi add $env:USERPROFILE\macros.txt

# utilities
chezmoi add $env:USERPROFILE\utilities\Reboot.bat
chezmoi add $env:USERPROFILE\utilities\RebootUbuntu.bat
chezmoi add $env:USERPROFILE\utilities\Shutdown.bat
chezmoi add $env:USERPROFILE\utilities\Ter.bat
chezmoi add $env:USERPROFILE\utilities\capslock2ctrl.reg
chezmoi add $env:USERPROFILE\utilities\install_cargo_packages.ps1
chezmoi add $env:USERPROFILE\utilities\port_forwarding.ps1

if ($env:COMPUTERNAME -ne "TANAKAPC") {
    $home_only_file |
        ForEach-Object {
            if (Test-Path $_) {
                chezmoi add $_
            }
        }
}

mask fixencoding
```

## copy2win-patch

> Copy patch to Windows

**OPTIONS**
* gpg
    * flags: --gpg
    * desc: Use GPG encrypt

```bash
if [[ "$gpg" == "true" ]]; then
    cp *.patch.gpg $$WIN_HOME/Downloads/
else
    cp *.patch $WIN_HOME/Downloads/
fi
```

```powershell
param(
    $gpg = $env:gpg
)

$TempMyOutputEncode=[System.Console]::OutputEncoding
[System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

if ($gpg) {
    Copy-Item -Path .\*.patch.gpg -Destination $env:USERPROFILE\Downloads
} else {
    Copy-Item -Path .\*.patch -Destination $env:USERPROFILE\Downloads
}

[System.Console]::OutputEncoding=$TempMyOutputEncode
```

## install-skk-jisyo

> Install SKK JISYO (Linux only)

```bash
current_dir=$(pwd)
SKK_JISYO_DIR="$HOME/.skk"
if [ ! -d "$SKK_JISYO_DIR" ]; then
    mkdir -p "$SKK_JISYO_DIR"
fi

if read_confirm; then
    cd /tmp || exit
    wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz
    gzip -d SKK-JISYO.L.gz
    cp SKK-JISYO.L ~/.skk/SKK-JISYO.L
    cd "$current_dir" || exit
fi
```

```powershell
Write-Output "Windows is not support!"
```

## test

```bash
mask lint
```

```powershell
mask lint
```

## lint

> Run lints

```bash
mask selene-lint
mask stylua-lint
mask textlint
mask typo-check
mask pwsh-test
mask shell-lint
```

```powershell
mask selene-lint
mask stylua-lint
mask textlint
mask typo-check
mask pwsh-test
```

## stylua-lint

> Run stylua lint

```bash
stylua --check ./
```

```powershell
stylua --check ./
```

## selene-lint

> Run selene

```bash
selene .
```

```powershell
selene .
```

## textlint

> Run textlint

```bash
pnpm run textlint
```

```powershell
pnpm run textlint
```

## typo-check

> Run typos

```bash
typos .
```

```powershell
typos .
```

## pwsh-test

> Run Invoke-PSScriptAnalyzer

```bash
echo "Run PowerShell ScriptAnalyzer"
pwsh utils/pssa.ps1
```

```powershell
Write-Output "Run PowerShell ScriptAnalyzer"
Get-ChildItem -Recurse |
    Where-Object {
        $_.Name -match "\.ps1$" -and
        $_.FullName -notmatch "\\node_modules\\"
    } |
    ForEach-Object {
        Write-Output $_.FullName
        Invoke-ScriptAnalyzer -Severity Warning $_.FullName
    }
```

## shell-lint

> Run shell lint (Linux only)

```bash
shellcheck --shell=bash --external-sources \
	utils/*

shfmt --language-dialect bash --diff \
	./**/*
```

```powershell
Write-Output "Windows is not support!"
```

## fmt

```bash
mask format
```

```powershell
mask format
```

## format

> Run format

```bash
mask stylua-format
mask shell-format
```

```powershell
mask stylua-format
```

## stylua-format

> Run stylua format

```bash
stylua ./
```

```powershell
stylua ./
```

## shell-format

> Run shfmt (Linux only)

```bash
shfmt --language-dialect bash --write \
	./**/*
```

```powershell
Write-Output "Windows is not support!"
```

## benchmark

> Run benchmark and append the results to the file (Linux only)

```bash
RESULT_FILE="STARTUPTIME.md"
TODAY=$(date +'%Y%m%d')

{
    echo "## $TODAY"

    echo ""
    echo "### Neovim"
    echo ""
    echo '```shell'
    echo '❯ vim-startuptime -vimpath nvim | head -n 6' >>$RESULT_FILE
    vim-startuptime -vimpath nvim | head -n 6
    echo '```'

    echo ""
    echo "### Fish-shell"
    echo ""
    echo '```shell'
    echo '❯ hyperfine -w 5 -r 50 "fish -i -c exit"'
    hyperfine -w 5 -r 50 "fish -i -c exit"
    echo '```'

    echo ""
    echo "### PowerShell Core(Linux) (pwsh)"
    echo ""
    echo '```powershell'
    echo '❯ hyperfine -w 5 -r 50 pwsh -i -c exit"'
    hyperfine -w 5 -r 50 "pwsh -i -c exit"
    echo '```'

    echo ""
    echo "### Paleovim(vim)"
    echo ""
    echo '```shell'
    echo '❯ vim-startuptime -vimpathvim | head -n 6' >>$RESULT_FILE
    vim-startuptime -vimpath vim | head -n 6
    echo '```'
    echo ""
} >>$RESULT_FILE
```

```powershell
Write-Output "Windows is not support!"
```

## changelog

> Add commit message up to `origin/master` to CHANGELOG.md

```bash
TODAY=$(date "+%Y.%m.%d")
RESULT_FILE="CHANGELOG.md"
LATEST_GIT_TAG=$(git tag | head -n 1)
GIT_LOG=$(git log "$LATEST_GIT_TAG..HEAD" --pretty=format:"%B")

{
    echo "## run"
    echo ""
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/- /g'
    echo ""
    echo '```bash'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/git commit -m "WIP:/g' | sed -e 's/$/" --allow-empty/g'
    echo '```'
    echo ""
    echo "## [v$TODAY]"
    echo ""
    echo "### Added - 新機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Changed - 既存機能の変更について"
    echo ""
    echo "なし"
    echo ""
    echo "### Removed - 今回で削除された機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Fixed - 不具合修正について"
    echo ""
    echo "なし"
    echo ""
} >>$RESULT_FILE
```

```powershell
Write-Output "Windows is not support now!"
```

## morning-routine

> Run workday morning routine

```bash
git cleanfetch
mask delete-branch
git pull
mask patch-branch
```

```powershell
git cleanfetch
mask delete-branch
git pull
```

## pab

> Create a patch branch (alias)

```bash
mask patch-branch
```

```powershell
mask patch-branch
```

## deleb

> Delete patch branch (alias)

```bash
mask delete-branch
```

```powershell
mask delete-branch
```
