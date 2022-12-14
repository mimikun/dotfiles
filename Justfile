today := `date "+%Y%m%d"`
product_name := dotfiles

patch : clean diff-patch copy2win

format-patch :
	git format-patch origin/master

diff-patch :
	git diff origin/master > {{product_name}}.{{today}}.patch

patch-branch :
	git switch -c patch-{{today}}

clean :
	bash clean.sh

update :
	bash update.sh

copy2win :
	cp *.patch $WIN_HOME/Downloads/
