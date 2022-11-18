today   = $(shell date "+%Y%m%d")
product_name = dotfiles

.PHONY : patch
patch : clean diff-patch copy2win

.PHONY : format-patch
format-patch :
	git format-patch origin/master

.PHONY : diff-patch
diff-patch :
	git diff origin/master > $(product_name).$(today).patch

.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

.PHONY : clean
clean :
	bash clean_files.sh

.PHONY : update
update :
	bash update_dotfiles.sh

.PHONY : copy2win
copy2win :
	cp *.patch $$WIN_HOME/Downloads/
