.DEFAULT_GOAL := help

today   = $(shell date "+%Y%m%d")
product_name = dotfiles
gpg_pub_key = CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC

## Create a patch and copy it to windows
.PHONY : patch
patch : clean diff-patch copy2win-patch

## Create a GPG-encrypted patch and copy it to Windows
.PHONY : gpg-patch
gpg-patch : clean diff-patch-gpg copy2win-patch-gpg

## Create a patch
.PHONY : diff-patch-raw
diff-patch-raw :
	bash utils/create-patch.sh

## Create a GPG-encrypted patch
.PHONY : diff-patch-gpg
diff-patch-gpg :
	echo "THIS IS WIP"
	#bash utils/create-patch.sh --use-gpg
	#git diff origin/master | gpg --encrypt --recipient $(gpg_pub_key) > $(product_name).$(today).patch.gpg

## Create a patch
.PHONY : diff-patch
diff-patch : diff-patch-raw

## Create a patch branch
.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

## Switch to master branch
.PHONY : switch-master
switch-master :
	git switch master

## Delete patch branch
.PHONY : delete-branch
delete-branch : clean switch-master
	git branch --list "patch*" | xargs -n 1 git branch -D

## Run clean
.PHONY : clean
clean :
	bash utils/clean.sh

## Run update
.PHONY : update
update : clean
	bash utils/update.sh

## Copy game settings(Windows only)
.PHONY : copy-windows-game-settings
copy-windows-game-settings :
	bash utils/copy-windows-game-settings.sh

## Copy patch to Windows
.PHONY : copy2win-patch-raw
copy2win-patch-raw :
	cp *.patch $$WIN_HOME/Downloads/

## Copy GPG-encrypted patch to Windows
.PHONY : copy2win-patch-gpg
copy2win-patch-gpg :
	cp *.patch.gpg $$WIN_HOME/Downloads/

## Copy patch to Windows
.PHONY : copy2win-patch
copy2win-patch : copy2win-patch-raw

## Install SKK JISYO
.PHONY : install-skk-jisyo
install-skk-jisyo :
	bash utils/install-skk-jisyo.sh

## Run tests
.PHONY : test
test : lint

## Run lints
.PHONY : lint
lint : selene-lint stylua-lint textlint typo-check pwsh-test shell-lint

## Run stylua lint
.PHONY : stylua-lint
stylua-lint :
	stylua --check ./

## Run selene
.PHONY : selene-lint
selene-lint :
	selene .

## Run textlint
.PHONY : textlint
textlint :
	pnpm run lint

## Run typos
.PHONY : typo-check
typo-check :
	typos .

## Run Invoke-PSScriptAnalyzer
.PHONY : pwsh-test
pwsh-test :
	@echo "Run PowerShell ScriptAnalyzer"
	@pwsh utils/pssa.ps1

## Run shellcheck
.PHONY : shell-lint
shell-lint :
	bash utils/lint.sh

## Run format
.PHONY : fmt
fmt : format

## Run format
.PHONY : format
format : stylua-format shell-format

## Run stylua format
.PHONY : stylua-format
stylua-format :
	stylua ./

## Run shfmt
.PHONY : shell-format
shell-format :
	bash utils/format.sh

## Run benchmark and append the results to the file
.PHONY : benchmark
benchmark :
	bash utils/benchmark.sh

## Add commit message up to `origin/master` to CHANGELOG.md
.PHONY : changelog
changelog :
	bash utils/changelog.sh

## Show help
.PHONY : help
help :
	@make2help $(MAKEFILE_LIST)
