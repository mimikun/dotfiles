.DEFAULT_GOAL := help

today   = $(shell date "+%Y%m%d")
product_name = neovim-config
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
	git diff origin/master > $(product_name).$(today).patch

## Create a GPG-encrypted patch
.PHONY : diff-patch-gpg
diff-patch-gpg :
	git diff origin/master | gpg --encrypt --recipient $(gpg_pub_key) > $(product_name).$(today).patch.gpg

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
	rm -f *.patch
	rm -f *.patch.gpg
	rm -f *.zip

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

## Run tests
.PHONY : test
test : lint

## Run lints
.PHONY : lint
lint : stylua-lint selene-lint

## Run stylua lint
.PHONY : stylua-lint
stylua-lint :
	stylua --check ./

# Run selene lint
.PHONY : selene-lint
selene-lint :
	selene .

## Run format
.PHONY : fmt
fmt : format

## Run format
.PHONY : format
format : stylua-format

## Run stylua format
.PHONY : stylua-format
stylua-format :
	stylua ./

## Create and Copy 2 Windows release file
.PHONY : release
release : copy2win-release

## Create release file
.PHONY : create-release
create-release : clean
	zip -r $(product_name).zip \
		Makefile \
		README.md \
		coc-settings.json \
		init.lua \
		lua/* \
		stylua.toml \
		selene.toml \
		vim.yaml

## Copy 2 Windows release file
.PHONY : copy2win-release
copy2win-release : create-release
	cp *.zip $$WIN_HOME/Downloads/

## Show help
.PHONY : help
help :
	@make2help $(MAKEFILE_LIST)
