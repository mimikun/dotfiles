today   = $(shell date "+%Y%m%d")

.PHONY : patch
patch : diff-patch

.PHONY : format-patch
format-patch :
	git format-patch origin/master

.PHONY : diff-patch
diff-patch :
	git diff origin/master > dotfiles.$(today).patch

.PHONY : patch-branch
patch-branch :
	git switch -c patch-$(today)

.PHONY : clean
clean :
	bash clean_files.sh

.PHONY : update
update :
	bash update_dotfiles.sh
