today   = $(shell date "+%Y%m%d")
product_name = nvim-conf
gpg_pub_key = CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC

.PHONY : patch
patch : clean diff-patch copy2win-patch

.PHONY : gpg-patch
gpg-patch : clean diff-patch-gpg copy2win-patch-gpg

.PHONY : diff-patch-raw
diff-patch-raw :
	git diff origin/master > $(product_name).$(today).patch

.PHONY : diff-patch-gpg
diff-patch-gpg :
	git diff origin/master | gpg --encrypt --recipient $(gpg_pub_key) > $(product_name).$(today).patch.gpg

.PHONY : diff-patch
diff-patch : diff-patch-raw

.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

.PHONY : switch-master
switch-master :
	git switch master

.PHONY : delete-branch
delete-branch : clean switch-master
	git branch --list "patch*" | xargs -n 1 git branch -D

.PHONY : clean
clean :
	rm -f *.patch
	rm -f *.patch.gpg
	rm -f *.zip

.PHONY : copy2win-patch-raw
copy2win-patch-raw :
	cp *.patch $$WIN_HOME/Downloads/

.PHONY : copy2win-patch-gpg
copy2win-patch-gpg :
	cp *.patch.gpg $$WIN_HOME/Downloads/

.PHONY : copy2win-patch
copy2win-patch : copy2win-patch-raw

.PHONY : lint
lint : stylua-lint selene-lint

.PHONY : stylua-lint
stylua-lint :
	stylua --check ./

.PHONY : selene-lint
selene-lint :
	selene .

.PHONY : fmt
fmt : format

.PHONY : format
format : stylua-format

.PHONY : stylua-format
stylua-format :
	stylua ./

.PHONY : release
release : copy2win-release

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

.PHONY : copy2win-release
copy2win-release : create-release
	cp *.zip $$WIN_HOME/Downloads/
