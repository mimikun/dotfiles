.DEFAULT_GOAL := help

## Create a patch and copy it to windows
.PHONY : patch
patch : clean diff-patch copy2win-patch

## Create a patch
.PHONY : diff-patch
diff-patch :
	mise tasks run patch:create

## Switch to master branch
.PHONY : switch-master
switch-master :
	mise tasks run git:switch-master

## Run clean
.PHONY : clean
clean :
	mise tasks run clean

## Run update
.PHONY : update
update :
	mise tasks run update

## Copy game settings(Windows only)
.PHONY : copy-windows-game-settings
copy-windows-game-settings :
	bash scripts/copy-windows-game-settings.sh

## Copy patch to Windows
.PHONY : copy2win-patch
copy2win-patch :
	mise tasks run patch:copy2win

## Run lint
.PHONY : lint
lint :
	mise tasks run lint

## Run format
.PHONY : format
format :
	mise tasks run format

## Run test
.PHONY : test
test : lint

## Run fmt
.PHONY : fmt
fmt : format

## Run benchmark and append the results to the file
.PHONY : benchmark
benchmark :
	mise tasks run benchmark

## Add commit message up to `origin/master` to CHANGELOG.md
.PHONY : changelog
changelog :
	mise tasks run changelog

## Run git cleanfetch
.PHONY : clean-fetch
clean-fetch :
	mise tasks run git:fetch:clean-fetch

## Delete patch branch
.PHONY : delete-branch
delete-branch :
	mise tasks run git:delete-branch

## Run git pull
.PHONY : pull
pull :
	mise tasks run git:pull

## Create a patch branch
.PHONY : patch-branch
patch-branch :
	mise tasks run patch:branch

## Run workday morning routine
.PHONY : morning-routine
morning-routine :
	mise tasks run git:morning-routine

## Run view
.PHONY : view
view :
	mise tasks run view

## Show help
.PHONY : help
help :
	@make2help $(MAKEFILE_LIST)
