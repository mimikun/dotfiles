# Changelog

## [v2023.09.27]

### Added - 新機能について

- Add new rust tools
    - cargo-wipe
    - rrc

### Changed - 既存機能の変更について

- Update eza fish completion
- Update STARTUPTIME.md
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1943
    - yq 4.35.2
- Update vup and vupueue command

### Removed - 今回で削除された機能について

- Remove fish plugin: mimikun/update_asdf_neovim

### Fixed - 不具合修正について

なし

## [v2023.09.25]

### Added - 新機能について

- Add some asdf paths
- Add new `$LOCALBIN` commands: git-shallow-clone
- Add benchmark task

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1941
- Update update_asdf_neovim command
- Update README.md
- Update TODO.md
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.24]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update eza fish completion
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.23]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.22]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1927
- Improved config.fish
    - direnv and linuxbrew is now cached
- Improved asdf path definition

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.21]

### Added - 新機能について

- Add new rust tool: git-graph

### Changed - 既存機能の変更について

- Update asdf tools version
    - bitwarden 2023.9.0
    - vim 9.0.1922

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.20]

### Added - 新機能について

- Add rtx fish config
- Add .rtx.toml

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Improved config.fish
    - Use cache
- Update asdf tools version
    - vim 9.0.1916
    - chezmoi 2.40.0
    - powershell-core 7.3.7
- Update rtx config
    - asdf_compat = true
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.19]

### Added - 新機能について

- Add new rust tool: taplo-cli
- Add NOTE in config.fish
- Add dotfyle command
    - https://github.com/RoryNesbitt/dotfyle-cli
- Add some neovim plugins
    - vim-skk/skkeleton
    - willelz/skk-tutorial.vim
- Add new neovim colorschemes
    - https://github.com/kyoh86/momiji
    - https://github.com/sainnhe/edge
- Add make task: install-skk-jisyo
    - Add utils/install-skk-jisyo.sh
    - Update README.md and some utils
- Add STARTUPTIME.md
- Add hyperfine completion update process
- Add update_hyperfine_fish_completion command
- Add hyperfine fish completion
- Add yazi configs
- Add treefmt

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Improved bun PATH definition
- Improved defining fish paths
- Update fzf-lua config
    - Use fzf-opts
    - Improve fzf(bin) scrollbar
- Update brew fish completion
- Update asdf tools version
    - vim 9.0.1910
    - github-cli 2.35.0
    - nodejs 18.18.0
- Update update_fish_completion command

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Revert "Fix dps-translate-vim error"
    - This reverts commit 539b0c51fc1c9dae2384150a68b5f92724af6eca.

## [v2023.09.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1907

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix CHANGELOG.md

## [v2023.09.17]

### Added - 新機能について

- Add new neovim plugin: vim-ambiwidth
    - https://github.com/rbtnn/vim-ambiwidth

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1903

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.16]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1901

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.15]

### Added - 新機能について

- Add utils.lua
    - Add many bannars
    - Add is_git() function
- Add new neovim plugin: denops-translate.vim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update TODO.md
- Update telescope.nvim config
    - Use utils.lua
- Update fzf.vim config
    - Use utils.lua
- Update fzf-lua config
    - Use utils.lua
- Update dashboard.nvim config
    - Use utils.lua
- Update alpha-nvim config
    - Use utils.lua
- Use `bannars["remember_covid_19"]`

### Removed - 今回で削除された機能について

- Disable nvim-surround
    - Fix #36

### Fixed - 不具合修正について

- Fix dps-translate-vim error

## [v2023.09.14]

### Added - 新機能について

- Add utils/create-patch.sh
    - Create the patch using a shell script
- Add shell-format task
- Add shell-lint task

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update fzf-lua config
- Update fzf.vim config
    - <C-p> process rewrite in Lua
- Update neogit config
    - Fix #44
- Update rtx fish completion
- Update TODO.md
- Update some $LOCALBINs
    - vup
    - vupueue

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.13]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update some neovim plugins config
- Update lazy-lock.json
- Update asdf tools version
    - dotnet-core 7.0.401
- Update todo-comments.nvim config
    - Fix #40
- Update trouble.nvim config
    - Fix #39
- Update telescope.nvim config
- Update TODO.md

### Removed - 今回で削除された機能について

- Disable neo-tree.nvim

### Fixed - 不具合修正について

なし

## [v2023.09.12]

### Added - 新機能について

- Add cargo-msrv
- Add neovim screenshot in README.md
- Add Invoke-FixEncode.ps1
    - Fix Linux PowerShell config-file encode

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1897
- Update TODO.md
- Update ls aliases
    - zsh
    - fish
- Update lazy-lock.json
- Update some fish completions
    - brew
    - eza
- Bump actions/checkout from 3 to 4
- Update dial.nvim config
    - Fix #43
- Update gitsigns.nvim config
    - Fix #45
- Update nvim-nu config
    - Fix #42
- Update scrollbar.nvim config
    - Fix #38
- Update neo-tree.nvim config
    - Fix #37

### Removed - 今回で削除された機能について

- Remove AppData/Local/nvim/lua/plugins/nvim-nu.lua.tmpl

### Fixed - 不具合修正について

- Fix PSSA error

## [v2023.09.11]

### Added - 新機能について

- Add update_asdf_neovim command
- Use eza
    - exa is finished.
    - https://github.com/ogham/exa/issues/1243
- Add some neovim plugins
    - dps-tenki-vim.lua
    - tenki.lua

### Changed - 既存機能の変更について

- Update TODO.md
- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1894

### Removed - 今回で削除された機能について

- Use eza
    - Remove exa completion

### Fixed - 不具合修正について

なし

## [v2023.09.10]

### Added - 新機能について

- Add some LOCALBINs
    - pueue_update_asdf_neovim_stable
    - update_asdf_neovim_stable

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update utils/update.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix tasks.ps1 some error
    - Invoke-FixEncoding
    - Invoke-FileUpdate
    - Invoke-FileClean
    - Invoke-SyncConf

## [v2023.09.09]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update nvim plugin config: obsidian.nvim
- Update asdf tools version
    - vim 9.0.1888
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.08]

### Added - 新機能について

- Add generate_asdf_plugin_list command
- Add TODO.md
- Add asdf-jq
- Add Invoke-FixEncode.ps1 (use for develop)
- Define obsidian vault related vars

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Copy of `OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` to the other 3 setting files
- Change PowerShell config file to chezmoi template

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix PowerShell config copy process

## [v2023.09.07]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update nvim plugin config: coc.nvim
- Update tasks.ps1
- Update windows pvim coc-settings.json
- Update asdf tools version
    - vim 9.0.1882
    - chezmoi 2.39.1
    - github-cli 2.34.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.06]

### Added - 新機能について

- Add some asdf plugins
    - lua
    - luaJIT
- Add new nvim plugin: themery.nvim
- Add obsidian-nvim.lua.tmpl

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - Update
        - vim 9.0.1876
    - Add
        - lua 5.4.6
        - luajit 2.0.5--2.4.4
- Update some nvim plugin configs
- Update nvim plugin manager config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix filetypes can't detected on chezmoi-vim
- Update nvim plugin config: coc.nvim
    - Fix #18

## [v2023.09.05]

### Added - 新機能について

- Add nvim plugin: obsidian.nvim
- Use luarocks

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1872
- Update update_fish_completions
- Update nvim plugin config: tree-sitter
- Update brew fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.04]

### Added - 新機能について

- Use rtx(but disabled)
- Add some sheldon plugins.toml
- Add sheldon fish completion
- Add act config
- Add AppData/Roaming/SKKFEP/DICTS directory

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1863
    - chezmoi 2.39.0
- Update update_fish_completions

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.03]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1854
- Update linux_cargo_packages.txt
- Update utils/update.sh
- Update Linux cargo_packages.txt
- Update nushell config
- Update .chezmoiignore

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- [NEED REVERT] Update update_pnpm
- Fix bash launch error

## [v2023.09.02]

### Added - 新機能について

- Add chezmoi.toml template

### Changed - 既存機能の変更について

- Update .chezmoiignore
- Update lazy-lock.json
- Update pip_packages.txt
- Update cargo_packages.txt
- Update asdf tools version
    - vim 9.0.1839
- Update Windows chezmoi_apply hook scripts
- Update deno fish completion
- Update LOCALBINs
    - generate_cargo_package_list
    - generate_pip_package_list
    - install_cargo_packages
    - install_pip_packages

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.01]

### Added - 新機能について

- Merge dotfiles-windows
- Use sheldon
- global gitignore desktop.ini
- gitignore some files
- Add lint task

### Changed - 既存機能の変更について

- Update .config/README.md
- Update pwsh-test task
- Update textlint deps
- Update README
- Update nvim plugin config: fzf.lua
- Update Linux wezterm config
- Update editorconfig
- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1833
- Update utils/clean.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix typo-check error
- Fix typos.toml
- Fix textlint error
- Revert "[NEED REVERT] Use dashboard-nvim"
    - Fix: [nvimのダッシュボードが表示されない(alpha.nvim) Issue #33](https://github.com/mimikun/dotfiles/issues/33)

## [v2023.08.31]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update .chezmoiignore
- Update nvim README
- Update dashboard-nvim config
- Update asdf tools version
    - vim 9.0.1826

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- alpha.nvim がNeovimのHEADで動かない問題への暫定対策
    - [NEED REVERT] Use dashboard-nvim

## [v2023.08.30]

### Added - 新機能について

- Add some nvim plugins
    - scrollbar.nvim
    - nvim-ts-autotag
    - dial.nvim
    - vim-silicon
    - telescope.nvim
    - silicon.lua
    - readablefold.vim
    - neo-tree.nvim
    - neogit
    - git.nvim
    - gitsigns.nvim
    - Comment.nvim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update github-copilot.lua
- Update asdf tools version
    - vim 9.0.1822
- Update rye fish completion

### Removed - 今回で削除された機能について

- Disable some nvim plugins
    - gin.vim
    - vim-gitgutter

### Fixed - 不具合修正について

- Sort nvim README.md
- File format

## [v2023.08.29]

### Added - 新機能について

- Add chezmoi_apply_hook scripts
- Add some LOCALBINs
- Add about chezmoi settings in README

### Changed - 既存機能の変更について

- Update fish_plugins
- Cleanup coc-nvim config
- Update todo-comments.nvim config
- Update alpha.nvim config
- Update nvim README.md
- Improved dashboard-nvim config
- Update README.md
- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1815
    - bitwarden 2023.8.2

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.28]

### Added - 新機能について

- Add ron-rs/ron.vim for pvim and nvim
- Add gojekyll
- Add gitui config
- Add lsd fish completion

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update some fish completion
    - rye
    - zellij
- Update asdf tools version
    - vim 9.0.1811
- Update alpha.nvim config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.27]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1792
- Update alpha.nvim config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update LOCALBINs
- Update utils/update.sh

### Removed - 今回で削除された機能について

- Remove some coc extensions for pvim
- Remove coc-prettier from pvim

### Fixed - 不具合修正について

なし

## [v2023.08.25]

### Added - 新機能について

- Add pip_packages commands

### Changed - 既存機能の変更について

- Update alpha-nvim config
- Update lazy-lock.json
- Update deno fish completion
- Update asdf tools version
    - python 3.11.5

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.24]

### Added - 新機能について

- Add asdf-powershell-core
- Add coc-zig

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1787
    - powershell-core 7.3.6
- Update ~/.local/bin/README.md
- Update alpha-nvim config
- Copy config from nvim to pvim

### Removed - 今回で削除された機能について

- Disable alpha-nvim

### Fixed - 不具合修正について

- Fix stylua error
- Fix neovim options
    - Windowsではない時のみpythonのパスを指定する

## [v2023.08.23]

### Added - 新機能について

- Add ~/.local/bin/README.md
- Add wsl-open
    - gitlab.com/4U6U57/wsl-open
    - Version 2.2.2
- Add neovim userfunc

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1783

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.22]

### Added - 新機能について

- Add some coc extensions
    - coc-zig
    - @yaegassy/coc-nginx
    - @yaegassy/coc-mypy
    - coc-explorer
    - coc-marketplace
    - coc-highlight
    - coc-toml
    - coc-html-css-support
    - coc-spell-checker
    - coc-deepl
    - @yaegassy/coc-black-formatter
    - coc-lists
    - coc-pairs
- Add editorconfig command
- Use walk command
    - github.com/antonmedv/walk

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update neovim themes.lua
- Update neovim coc-nvim.lua
- Update ~/.config/nvim/README.md
- Update deno fish completion
- Update asdf tools version
    - chezmoi 2.38.0
    - github-cli 2.33.0
- Update .editorconfig-template

### Removed - 今回で削除された機能について

- [NEED REVERT] coc-prettier is not maintained
    - エタったのか更新されていないので別のを使う
    - Use "@raidou/coc-prettier-v3
- Remove coc-prettier
- Remove coc-zls

### Fixed - 不具合修正について

なし

## [v2023.08.21]

### Added - 新機能について

- Add kensaku.vim
    - lambdalisue/kensaku.vim
    - lambdalisue/kensaku-command.vim
    - lambdalisue/kensaku-search.vim
- Add align.nvim
    - Vonr/align.nvim
- Add new colorscheme
    - catppuccin/nvim
    - shaunsingh/nord.nvim
- Add update_poetry command
- Add commit.verbose git config
- Add XDG Base directory config

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1778

### Removed - 今回で削除された機能について

- Remove ~/.config/nvim/event_learn_support.lua
- Remove Justfile
    - 遅すぎて使い物にならないので削除

### Fixed - 不具合修正について

- Fix script miss

## [v2023.08.20]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1757
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1745
- Update lazy-lock.json
- Update neovim base options
- Update coc-settings.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1736
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1721
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.16]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1719
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.15]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update brew fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.14]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1712

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.13]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - nodejs 18.17.1
    - vim 9.0.1702

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.12]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1696
    - yq 4.35.1
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.09]

### Added - 新機能について

- Add some nvim plugin
    - Rename fzf.lua to fzf-vim.lua
    - Add fzf.lua
    - Add startup.nvim
    - Add image-preview.nvim
    - Add dressing.nvim
    - Add editorconfig.nvim
- Add some vim colorschemes
    - voidekh/kyotonight.vim
    - sainnhe/sonokai
    - loctvl842/monokai-pro.nvim
    - crusoexia/vim-monokai
- Add some neovim colorschemes
    - tiagovla/tokyodark.nvim
    - loctvl842/monokai-pro.nvim
    - crusoexia/vim-monokai
    - sainnhe/sonokai
    - voidekh/kyotonight.vim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
    - vim 9.0.1679
    - dotnet-core 7.0.400

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.08]

### Added - 新機能について

- Add .vim/Makefile
- Add zoxide fish completion

### Changed - 既存機能の変更について

- Update asdf tools version
    - vim 9.0.1678
- Update lazy-lock.json
- Update Linux PowerShell config
- Update .config/nvim/Makefile
- Ignore zip file
- Update update_fish_completions

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.07]

### Added - 新機能について

- Add `.vim/README.md`
- Add Brewfile

### Changed - 既存機能の変更について

- Fix .editorconfig
- Update asdf tools version
- Update lazy-lock.json
- Update vim config
    - Set colorscheme
- Update neovim config
    - Use zbirenbaum/copilot.lua
- Update brew fish completion

### Removed - 今回で削除された機能について

- Remove windows config
    - [dotfiles-windows](https://github.com/mimikun/dotfiles-windows) があるため
- Remove `.vim/colors`

### Fixed - 不具合修正について

- Fix "Azia/Tokyo" to "Asia/Tokyo"
    - タイムゾーンのミスによる時間取得誤りを修正

## [v2023.08.05]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix stylua error

## [v2023.08.04]

### Added - 新機能について

- Add some environments variables in config.fish
    - TZ "Azia/Tokyo"
    - obsidian /path/to/001_DailyNotes
    - XDG_CONFIG_HOME $HOME/.config
    - LOCALBIN $HOME/.local/bin

### Changed - 既存機能の変更について

- Update vup
- Update lazy-lock.json
- Use double quote in config.fish
- Update neovim coc.nvim config
- Update fish completions
    - exa
    - deno

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.03]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update neovim config
- Update vim config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.02]

### Added - 新機能について

- Add lazy-lock.json
- Add ion config
- Add elvish config
- Add vup
- Add update_cargo_packages
- Add neovim plugin: LhKipp/nvim-nu
- Add neovim plugin: ellisonleao/glow.nvim

### Changed - 既存機能の変更について

- Update .config/nvim/README.md
- Update .config/fish/README.md
- Update neovim coc.nvim config
- Update nushell config
- Update .chezmoiignore
- Update utils/clean.sh
- Update utils/update.sh
- Update flyctl fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.08.01]

### Added - 新機能について

- Add `.config/README.md`
- Add `.config/nvim/Makefile`

### Changed - 既存機能の変更について

- Use lazy.nvim
- Chezmoi Ignore `.config/README.md`
- Update brew fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.31]

### Added - 新機能について

- Add lsd config file

### Changed - 既存機能の変更について

- Chezmoi Ignore stylua.toml
- Update asdf tools version
    - chezmoi 2.36.1

### Removed - 今回で削除された機能について

### Fixed - 不具合修正について

## [v2023.07.29]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
    - chezmoi 2.36.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.28]

### Added - 新機能について

- Add procs fish completion
- Add procs config
- Add stylua config

### Changed - 既存機能の変更について

- Update vupueue
- Update update_fish_completions
- Update brew fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.27]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update fish completions
    - brew
    - deno

- neovim sppedup?

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update brew fish completion
- Add neovim color theme: "EdenEast/nightfox.nvim"

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.25]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

なし

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.07.24]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

なし

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.mm.dd]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

なし

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

