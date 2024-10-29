# nvim-rocks

## Requirements

- Neovim nightly
- `netrw` enabled
- Lua v5.1.x
    - rocks.nvim is working Lua v5.1.x ONLY.

## How to setup

### git clone, set env-var, and run installer

```fish
cd ~/.config
git clone https://github.com/mimikun/nvim-rocks.git
cd nvim-rocks
set -Ux NVIM_APPNAME nvim-rocks
nvim -u NORC -c "source https://raw.githubusercontent.com/nvim-neorocks/rocks.nvim/master/installer.lua"
```

### installer phase

When you start the installer, you will be taken to a screen like this.

```txt
                                    _ __ ___   ___| | _____   _ ____   _(_)_ __ ___ 
                                   | '__/ _ \ / __| |/ / __| | '_ \ \ / / | '_ ` _ \
                                   | | | (_) | (__|   <\__ \_| | | \ V /| | | | | | |
                                   |_|  \___/ \___|_|\_\___(_)_| |_|\_/ |_|_| |_| |_|



                                          Welcome to the rocks.nvim installer!
                              rocks.nvim is a modern approach to Neovim plugin management.


                This page lists all of the most important tweakable aspects of the installation process.
             To edit a value, move your cursor over it and modify the value using regular Neovim keybinds.
                                    When you are ready, press <CR> on the OK button.

                                        This installer supports using the mouse.
              Once you start editing a value, you may exit it by pressing Enter or by clicking elsewhere.

              -------------------------------------------------------------------------------------------

                      Rocks installation path: /home/YOUR_USERNAME/.local/share/nvim-rocks/rocks
                                        Set up luarocks (recommended) ?: true

                                                         < OK >
```

`Set up luarocks (recommended) ?:` MUST be set to `false`.
If they are set to true, an error will occur.

When you finished entering the param, move using `hjkl` and press `Enter` on the `OK` line.

Please ignore any errors that may appear. (This is your chance to contribute! 🤣 🤣 🤣 )

### If the installation is successful

close the program with `:q`, and re-run neovim.

### Install or Sync plugins

Run `:Rocks sync` and `:Rocks Sync`

## rocks.nvim and extensions

[nvim-neorocks/rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim/)
[nvim-neorocks/rocks-git.nvim](https://github.com/nvim-neorocks/rocks-git.nvim)
[nvim-neorocks/rocks-lazy.nvim](https://github.com/nvim-neorocks/rocks-lazy.nvim)
[nvim-neorocks/rocks-treesitter.nvim](https://github.com/nvim-neorocks/rocks-treesitter.nvim)
[nvim-neorocks/rocks-config.nvim](https://github.com/nvim-neorocks/rocks-config.nvim)
[nvim-neorocks/rocks-dev.nvim](https://github.com/nvim-neorocks/rocks-dev.nvim)

