today   = $(shell date "+%Y%m%d")

.PHONY : patch
patch : diff-patch

.PHONY : format-patch
format-patch :
	git format-patch master

.PHONY : diff-patch
diff-patch :
	git diff master > dotfiles.$(today).patch

.PHONY : clean
clean :
	rm -f *.patch
