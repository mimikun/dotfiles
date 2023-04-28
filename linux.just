today := `date "+%Y%m%d"`
product_name := "dotfiles"
gpg_pub_key := "CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"

default :
    @just --list

alias fmt := format

patch : clean diff-patch copy2win-patch

diff-patch-raw :
    git diff origin/master > {{product_name}}.{{today}}.patch

diff-patch-gpg :
    git diff origin/master | gpg --encrypt --recipient {{gpg_pub_key}} > {{product_name}}.{{today}}.patch.gpg

diff-patch : diff-patch-raw

patch-branch :
    git switch -c patch-{{today}}

switch-master :
    git switch master

delete-branch : switch-master
    git branch --list "patch*" | xargs -n 1 git branch -D

clean :
    bash utils/clean.sh

update : clean
    bash utils/update.sh

copy2win-patch-raw :
    cp *.patch $WIN_HOME/Downloads/

copy2win-patch-gpg :
    cp *.patch.gpg $WIN_HOME/Downloads/

copy2win-patch : copy2win-patch-raw

lint : stylua-lint

stylua-lint :
    stylua --check ./

format : stylua-format

stylua-format :
	stylua ./

apply-windows-powershell-config :
        cp windows/Microsoft.PowerShell_profile.ps1 $$WIN_HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
        cp windows/Microsoft.PowerShell_profile.ps1 $$WIN_HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

apply : apply-windows-powershell-config
    chezmoi apply
