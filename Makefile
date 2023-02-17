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

.PHONY : switch-master
switch-master :
	git switch master

.PHONY : delete-branch
delete-branch : switch-master
	git branch -D patch-*

.PHONY : clean
clean :
	bash clean.sh

.PHONY : update
update : clean
	bash update.sh

.PHONY : copy2win
copy2win :
	cp *.patch $$WIN_HOME/Downloads/
