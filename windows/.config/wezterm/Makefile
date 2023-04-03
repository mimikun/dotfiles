.PHONY : run
run :
	cp ./wezterm.lua $$WIN_HOME/.config/wezterm/

.PHONY : lint
lint : stylua-lint

.PHONY : stylua-lint
stylua-lint :
	stylua --check ./

.PHONY : fmt
fmt : format

.PHONY : format
format : stylua-format

.PHONY : stylua-format
stylua-format :
	stylua ./
