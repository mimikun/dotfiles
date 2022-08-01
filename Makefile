today   = $(shell date "+%Y%m%d")

.PHONY : patch
patch :
	git format-patch master

.PHONY : diff-patch
diff-patch :
	git diff master > dotfiles.$(today).patch

.PHONY : clean
clean :
	rm -f *.patch
