# Changelog

## [v2024.06.05] [nvim-conf-v3]

### Added - 新機能について

- feat!: add nvim config copy in Invoke-RunAfterChezmoiApply.ps1
- feat!: update neovim configs to v3
- feat(nvim)!: add lockfiles (v3)
- feat(fish)!: add aqua completion

### Changed - 既存機能の変更について

- chore: update chezmoiignore
- chore: rename nvim to nvim-old
- chore(fish): update bun completion
- chore(fish): update pueue completion
- chore(fish): update uv completion
- chore(aqua): bump
- chore(localbin)!: update update_fish_completions
- chore(utils): update update.sh
- chore(nvim-old): update lockfiles

### Removed - 今回で削除された機能について

- chore: remove windows nvim configs
- chore(nvim-old)!: remove tree-sitter-rasi
    - rasi is now supported by neovim.
    - ref: https://github.com/neovim/neovim/commit/07af492f635c51d44d02d8012611cc5e11a4af19

### Fixed - 不具合修正について

- fix(nvim)!: mason

## [v2024.05.31]

### Added - 新機能について

- feat!: add neovide config
- feat(nvim)!: add neovide config
- feat(shells)!: add neovide env-vars

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(utils): update changelog.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.30]

### Added - 新機能について

- feat!: add Invoke-InstallCargoPackage.ps1
- feat!: add Invoke-GenerateCargoPackageList.ps1
- chore(pwsh)!: add wsl_status alias
- chore(pwsh)!: add wsl_shutdown alias

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(fish): update deno completion
- chore(utilities): update some windows utilities
- chore(pkglist): update

### Removed - 今回で削除された機能について

- chore(pwsh)!: wsl_restart is deprecated

### Fixed - 不具合修正について

- fix(shells)!: incorrect env-vars NVIM_DEV_PLUGINS

## [v2024.05.29]

### Added - 新機能について

- feat(cargo)!: add new tools

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(aqua): bump
- feat(utils): git-restore wezterm fish completion in certain environments

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.28]

### Added - 新機能について

- feat(nvim): add tree-sitter update button in alpha

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(fish): update mise completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.26]

### Added - 新機能について

- feat(nvim)!: add new lackluster colorscheme

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(fish): update uv completion
- chore(cookieclicker): update savedata code

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(nvim-mini): use vim.fn.stdpath
- fix(nvim): use vim.fn.stdpath

## [v2024.05.24]

### Added - 新機能について

- feat(nvim)!: add ts-comments.nvim plugin

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore: update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(nvim): ftdetect/djot.lua in Windows
    - Fix #503

## [v2024.05.23]

### Added - 新機能について

- feat(nvim)!: add remote-nvim.nvim plugin
- feat(powershell)!: add bun_upgrade command for windows

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(fish): update fish-lsp completion
- chore(fish): update uv completion
- chore(aqua): bump
- refactor(nvim)!: split obsidian-kensaku.nvim config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.22]

### Added - 新機能について

- feat(nvim)!: add new button in alpha.lua
- feat(nvim)!: add aiscript configs
    - aiscript is misskey's unique language
- feat(nvim)!: add vfiler.vim plugins
- feat(nvim)!: add djot config
- feat(nvim)!: add obsidian-kensaku.vim plugin
- feat(cargo)!: add some tools

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(localbin): update vup
- chore(deno): update deno completion
- chore(fish): update bun completion
- chore(nvim): update lockfiles
- chore(aqua): bump

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(bob): incorrect windows bob config path

## [v2024.05.21]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(aqua): bump

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.20]

### Added - 新機能について

- feat(nvim)!: add obsidian-bridge.nvim
- feat(nvim)!: add cmp-dotenv
- feat(nvim)!: add codeshot.nvim
- chore(bob): use neovim nightly
- feat(wezterm): add new kabegami path

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- refactor(chezmoi)!: use windows_user_name instead of alacritty_wd
- refactor(chezmoi)!: use windows_user_name instead of win_home_path
- chore(localbin): update vup

### Removed - 今回で削除された機能について

- chore(nvim): obsidian-bridge.nvim disable

### Fixed - 不具合修正について

なし

## [v2024.05.19]

### Added - 新機能について

- feat(nvim)!: use bob neovim version manager
    - Fix #483. neovim is no longer managed by mise
- feat(utils): update.sh: add .bob-version

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(localbin): update update_fish_completions
- chore(localbin): update vup
- chore(localbin): update update_mise
- chore(fish): update deno completion
- chore(utils): update update.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.17]

### Added - 新機能について

- feat(fish)!: add ryoppippi/na.fish
- feat(aqua)!: add zf

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(fish): update deno completion
- chore(fish): update mdbook completion
- chore(localbin): update update_fish_completions

### Removed - 今回で削除された機能について

- chore(localbin): remove update_pkgx

### Fixed - 不具合修正について

- WORKAROUND: many nvim plugin is dead in 0.11
- fix(stylua): error

## [v2024.05.16]

### Added - 新機能について

- feat!: add .mimikun-pkglists
    - relocate some files
- feat(wezterm)!: add kabegami.lua
- feat(kabegami)!: add butasan.png
- feat(aqua)!: add pkgx

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(localbin): update some tools

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.15]

### Added - 新機能について

- feat(htop)!: add config
- feat(fish)!: add pastel completion
- feat(aqua)!: add some packages
- feat(aqua)!: add btop
- feat(aqua)!: add gotop
- feat(localbin)!: add update_pastel_fish_completion

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(localbin): update update_fish_completions
- chore(utils): update update.sh
- chore(typos): update config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.14]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(fish): update uv completion
- chore(localbin): update vup
- chore(nvim): update lockfiles
- chore(aqua): bump
- Revert "WORKAROUND: can't install aquaproj/registry-tool"
    - This reverts commit 101d13331e774ba38ad17de3ab577140ac2be257.

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.13]

### Added - 新機能について

- docs(misc): add sysctl.conf
- feat(nvim)!: add hop.nvim plugin
- feat(nvim)!: add modes.nvim plugin

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(nvim): keymap

## [v2024.05.12]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update utils/changelog.sh
    - Remove renovate commit
- chore(commentary): update image
- chore(nvim): update lockfiles
- chore(fish): update deno completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- WORKAROUND: can't install aquaproj/registry-tool
    - Fix #463

## [v2024.05.10]

### Added - 新機能について

- chore(nvim): add fish-lsp configs
- feat(nvim)!: add new wadackel/vim-dogrun colorscheme
- feat(fish)!: add fish-lsp completion

### Changed - 既存機能の変更について

- chore(typos): update config
- chore: update deps
- chore(nvim): update lockfiles
- chore: update STARTUPTIME.md
- chore(localbin): update update_fish_completions
- chore(mise): update global config

### Removed - 今回で削除された機能について

- chore(localbin): remove update_helix_fish_completion

### Fixed - 不具合修正について

なし

## [v2024.05.09]

### Added - 新機能について

- chore(commentary): add Makefile
- feat(nvim)!: add oldworld colorscheme
- feat(nvim-mini)!: add plugin rainbowhxch/accelerated-jk.nvim
- feat(nvim-mini)!: add plugin stevearc/oil.nvim

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore: update STARTUPTIME.md
- chore(fish): update deno completion
- chore(fish): update uv completion
- chore(nvim): rename lambdalisue's plugins
- chore(commentary): update book.toml

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.08]

### Added - 新機能について

- feat(nvim)!: add plugin "Wansmer/treesj"
- feat(nvim)!: add plugin "MeanderingProgrammer/markdown.nvim"
- feat(nvim)!: add plugin "RRethy/nvim-treesitter-textsubjects"
- feat(rust-tool)!: add mdbook
- chore: add mdbook completions
- chore(chezmoi): use chezmoi hook script
- docs!: create document by mdbook

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(nvim): replace vim-markdown to nvim-markdown
- chore(fish): update uv completion
- chore(fish): update fd completion
- chore(localbin): update update_fish_completions
- docs!: move image file to assets dir
- docs: update maskfile.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.05.07]

### Added - 新機能について

- feat(nvim)!: add oil-git-status.nvim

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore: update maskfile.md
- chore(aqua)!: update

### Removed - 今回で削除された機能について

- chore: remove winfetch

### Fixed - 不具合修正について

なし

## [v2024.05.06]

### Added - 新機能について

- chore(fastfetch): add config
- feat(nvim)!: add nvim-tree-preview.lua config

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(fish): update fd completion
- chore(fish): update deno completion
- chore(fish): update zellij completion
- chore(fish): update fastfetch completion
- chore(aqua): bump
- chore(localbin): update update_mise
- chore(typos): update config

### Removed - 今回で削除された機能について

- chore: remove neofetch config
    - neofetch is dead.

### Fixed - 不具合修正について

- fix(aqua): nao1215/sqly

## [v2024.04.29]

### Added - 新機能について

- feat(nvim)!: add transparent.nvim
- feat(nvim)!: add auto-save.nvim
- feat(nvim)!: add some colorschemes

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(nvim): write the theme switching plugin in a separate file
- chore(fish): update uv completion
- chore(chezmoi): ignore some files

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.04.26]

### Added - 新機能について

- chore(chezmoi): add update_mise in chezmoi update process
- feat(nvim)!: add ariake.nvim colorscheme
- feat(nushell): add starship config
- feat(ion): add starship config
- feat(elvish): add starship config
- feat(xonsh): add configs
- feat(tcsh): add configs
- feat(clink)!: add clink configs
- feat(i3status-rust)!: add battery info
    - fix #419
- feat(wezterm)!: disable clock when human rights are being violated
    - fix #418

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(localbin): update update_mise

### Removed - 今回で削除された機能について

- chore(chezmoi): remove no longer used tasks.ps1

### Fixed - 不具合修正について

- fix(wezterm): cannot launch cmd.exe
- fix(mise): configs

## [v2024.04.25]

### Added - 新機能について

- chore(mise)!: use mimikun/asdf-vim plugin

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(deps): update
- chore(localbin): update update_mise
- chore(mise): use vim@9.1.0369
- chore(nvim): update lockfiles
- chore(fish): update uv completion
- chore(fish): update flyctl completion
- chore(pvim): update configs

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(windows)!: copy process for pvim config
- fix!: windows chezmoiscripts

## [v2024.04.24]

### Added - 新機能について

- feat(nvim)!: add yazi.nvim plugin
- feat(nvim)!: add indent-blankline.nvim plugin

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(yazi): update configs
- chore(fish): update uv completion
- chore(mise): use vim@9.1.0368

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: markdown_oxide remove in windows

## [v2024.04.23]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(wezterm): use window_decorations "INTEGRATED_BUTTONS|RESIZE"
- chore(wezterm): improved event.lua
- chore(wezterm): improved mousebinds.lua
- chore(mise): use vim@9.1.0366
- chore(nvim): update lockfiles
- chore(fish): update uv completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: stylua error

## [v2024.04.22]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore(mise): use vim@9.1.0363

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.04.21]

### Added - 新機能について

- feat(fish)!: add pnpm completion

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(localbin): update update_pnpm
- chore(localbin): update update_fish_completions
- chore(fish): update uv completion
- chore(fish): update rbw completion
- chore(aqua): bump
- chore(utils): update neovim_readme_generator.lua

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix!: linux chezmoiscripts

## [v2024.04.18]

### Added - 新機能について

- feat(nvim)!: add screenkey.nvim
- feat(nvim)!: add ChatGPT.nvim
- feat(nvim)!: add CopilotChat.nvim
- chore(nvim): add copilot_cmp config in nvim-cmp
- chore(nvim): add lspkind config in nvim-cmp config
- chore(nvim): add some ollama plugins

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update plugin configs
- chore(nvim): use use_ai_assistant instead use_copilot
- chore(mise): use vim@9.1.0346
- chore(localbin): update vup
- chore(nvim): update lockfiles
- chore(fish): update uv completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.04.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(aqua): bump
- chore(pvim): update human rights violating pvim config
- docs(pvim): update README.md
- chore(gitignore): update
- chore(chezmoiignore): update
- chore(mise): use vim 9.1.0342
- chore(zellij)!: update config
- chore(fish)!: update zellij completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.04.16]

### Added - 新機能について

- feat(nvim)!: add telescope-media.nvim in telescope.nvim
- chore(linux): add new linux pvim config

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(localbin): update update_mise
- chore(mise): use vim 9.1.0336
- chore(utilities): update Invoke-RunAfterChezmoiApply.ps1
- chore(chezmoiignore): update
- docs: update README.md
- chore(nvim): update lockfiles
- chore(fish): update uv completion
- chore(fish): update deno completion

### Removed - 今回で削除された機能について

- chore(windows): remove vim configs
- chore(linux): remove vim configs

### Fixed - 不具合修正について

なし

## [v2024.04.15]

### Added - 新機能について

- feat(rust-tool)!: add nsh
- feat(nvim)!: add five-server.nvim plugin

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles

### Removed - 今回で削除された機能について

- chore(nvim)!: remove live-server.nvim plugin

### Fixed - 不具合修正について

なし

## [v2024.04.14]

### Added - 新機能について

- feat(aqua): add purl

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update LOCALBIN commands
- chore: update linux_pip_packages.txt
- chore(nvim): update lockfiles
- chore(fish): update deno completion
- chore(chezmoiscripts): update linux scripts
- chore(chezmoiscripts): update windows scripts

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(chezmoiscripts): download-nerd-fonts-debug-scripts.sh

## [v2024.04.11]

### Added - 新機能について

- feat(nvim)!: add markdown-oxide cmp config

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(fish): update deno completion
- feat!: improved chezmoiignore

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(nvim): mason config error

## [v2024.04.10]

### Added - 新機能について

- chore: add windows chezmoiscripts
- feat(nvim)!: add markdown-oxide lsp

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update linux chezmoiscripts
- chore(fish): update tldr completion
- chore(nvim): update lockfiles
- docs(nvim)!: update README.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.04.09]

### Added - 新機能について

- feat(aqua): add some commands
- feat(nvim): add .tape tree-sitter config
- feat!: add glow config
- chore: add glow completion
- chore(chezmoi): use .chezmoiscripts

### Changed - 既存機能の変更について

- chore(nvim): update lockfiles
- chore: update STARTUPTIME.md
- chore: update update_fish_completions

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: stylua error
- fix(nvim): ghost-text plugin configs
- fix(nvim-notify)!: color to colour

## [v2024.04.08]

### Added - 新機能について

- feat(i3)!: add a super cool power menu
- feat(fish): add ghq completion
- feat(fish): add mimikun/fish-ghq
- feat(nvim)!: add GhostText plugins

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(nvim): update lockfiles
- chore(aqua): bump
- feat(skk-dict)!: skk-dict manage by chezmoi
- chore: mocword.sqlite manage by chezmoi
- chore(nvim): enable image-preview.nvim
- chore(nvim): update nvim-orgmode config
- chore(nvim): skkeleton setup finish

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(nvim): has no background highlight
- fix(nvim-notify): value invalid
    - fix #380

## [v2024.04.05]

### Added - 新機能について

- feat(nvim)!: add some minigame plugins

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update update_fish_completions
- chore(nvim): update lockfiles
- chore(fish): update uv completion
- chore(fish): update gh completion

### Removed - 今回で削除された機能について

- chore(fish)!: remove decors/fish-ghq
- chore(aqua)!: guru removed

### Fixed - 不具合修正について

- fix(nvim): workaround failing install ocaml parser

## [v2024.04.03]

### Added - 新機能について

- feat(rust-tool)!: add mocword
- feat(windows-terminal)!: add configs
- feat(shells)!: set MOCWORD_DATA envs
- feat(neovim)!: add some colorschemes

### Changed - 既存機能の変更について

- chore(neovim): update lockfiles
- chore: update STARTUPTIME.md
- chore(readme): update images
- feat(nyagos)!: improved path_sep
- docs(neovim)!: update README.md
- docs(glossary)!: update

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(typos)!: word 'HD' is correct
- fix(ghcup)!: typo fixed

## [v2024.04.02]

### Added - 新機能について

- feat!: manage sqlite3.dll by chezmoi in windows

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore(fish): update uv completion
- chore(nvim): update lockfiles
- feat(nvim)!: update telescope config
- feat(nvim)!: transparent background when there are human rights

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix(wezterm)!: set background image when human rights are present

## [v2024.04.01]

### Added - 新機能について

- feat!: set background image in wezterm
- feat!: add .kabegami directory
- feat!: add new neovim plugin: dmacro.nvim

### Changed - 既存機能の変更について

- chore: update neovim lockfiles
- chore: update deno fish completion
- chore: update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: neovim plugin config: tree-sitter

## [v2024.03.31]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update neovim lockfiles
- chore: update neovim lockfiles

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Revert "Improved i3 config"
    - This reverts commit 9d70127adb15aa60635c6eeb61c7ea4d5d4b07e6.

## [v2024.03.29]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update neovim lockfiles
- chore: update uv fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: telescope config in windows
- fix: human rights check process
- fix: selene error

## [v2024.03.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update neovim lockfiles
- chore: update deno fish completion
- feat: improved neovim core/global.lua

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: telescope config in windows

## [v2024.03.27]

### Added - 新機能について

- feat!: add uv by aqua
- feat!: add uv fish completion
- feat!: add new neovim plugin: no-neck-pain.nvim

### Changed - 既存機能の変更について

- chore: update neovim lockfiles
- chore: update STARTUPTIME.md
- refactor!: improved colorscheme plugins config
- feat!: update update_fish_completions
- feat!: update neovim plugin config: telescope.nvim
- feat!: improved utils/changelog.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- fix: chezmoi config

## [v2024.03.26]

### Added - 新機能について

- feat: add some neovim plugins in windows
- feat: add developing neovim plugin spec
- feat: add lazydocker by aqua
- feat: add husky
- feat: add commitlint
- feat: add lazydocker by aqua
- feat: add horcrux by aqua

### Changed - 既存機能の変更について

- chore: update STARTUPTIME.md
- chore: update npm deps
- chore: update neovim lockfiles

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.25]

### Added - 新機能について

- Add some new neovim themes
    - b0o/lavi.nvim
    - comfysage/evergarden
    - loganswartz/sunburn.nvim
- Add new neovim plugin: huez.nvim
- Add new neovim plugin: nvim-insx

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.24]

### Added - 新機能について

- Add new rust tool: jnv

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update pueue fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.21]

### Added - 新機能について

- Add new neovim plugin: garbage-day.nvim
- Add new neovim plugin: nvim-asciidoc-preview
- Add new neovim plugin: 15puzzle.nvim
- Add new neovim colorscheme: kurayami.nvim
- Add plugin spec copy file: spec-template.lua

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update STARTUPTIME.md
- Improved i3 config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix utils/changelog.sh

## [v2024.03.20]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim lockfiles

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Run fmt

## [v2024.03.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update i3-wm config
    - add Ctrl+Alt+Delete menu
- Update STARTUPTIME.md
- Update GLOSSARY.md
- Update neovim plugin config: nvim-tree

### Removed - 今回で削除された機能について

- Remove neovim plugin: fern.vim

### Fixed - 不具合修正について

なし

## [v2024.03.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update mise fish completion
- Update neovim_readme_generator.lua
- Update neovim README
- Update neovim plugin config: silicon.nvim
    - rename: silicon.lua to silicon.nvim

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.15]

### Added - 新機能について

- Add new neovim plugin: lazygit.nvim
- Add new tool by aqua: lazygit
- Add new tool by cargo: gitu

### Changed - 既存機能の変更について

- Update deno fish completion
- Update STARTUPTIME.md
- Update neovim lockfiles
- Update neovim plugin config: oil.nvim
- Update neovim plugin config: nvim-tree

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.14]

### Added - 新機能について

- Add new neovim plugin: oil.nvim
- Add new neovim plugin: nvim-tree
- Add jsonc tree-sitter parser

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update nvim-mini configs
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

- Remove nvim-scrollbar.lua.tmpl

### Fixed - 不具合修正について

- Fix neovim plugin config: silicon.lua
    - 0oAstro/silicon.lua was archived

## [v2024.03.12]

### Added - 新機能について

- Set neovim LEADER key

### Changed - 既存機能の変更について

- Update utils/changelog.sh
- Update neovim plugin config: noice.nvim
- Update neovim plugin config: satellite.nvim
    - Fix #297
- Update neovim lockfiles
- Update rustup fish completion
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: null-ls.nvim

## [v2024.03.11]

### Added - 新機能について

- Add type annotation: LazySpec

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update neovim lockfiles
- Update neovim plugin config: migemo-search.vim

### Removed - 今回で削除された機能について

- Remove unused code: alpha.lua

### Fixed - 不具合修正について

- Fix neovim plugin config: vim-ambiwidth
- Fix neovim plugin config: null-ls(none-ls)

## [v2024.03.10]

### Added - 新機能について

- Add morning-routine task to Makefile

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update chezmoi_post_apply_hook command

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix typo: deno fish completion(workaround)

## [v2024.03.09]

### Added - 新機能について

- Add utils/neovim_readme_generator.lua

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update deno fish completion
- Update procs fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.07]

### Added - 新機能について

- Manage nyagos with aqua
- Add utils/neovim_readme_generator.ts

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update neovim lockfiles
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix nyagos error
    - Fix #321
- Fix nushell error
    - Fix #320

## [v2024.03.06]

### Added - 新機能について

- Add actions/stale
- Add gopass fish completion

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update neovim lockfiles
- Update neovim README.md
- Update update_fish_completions command
- Improved utils/changelog.sh

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix bash launch error
- Fix zsh error
- Fix GitHub actions yaml
    - run format

## [v2024.03.05]

### Added - 新機能について

- Add nvim-scrollbar alternative plugins
- Use satellite.nvim
    - remove some plugins

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update neovim lockfiles
- Run stylua format

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix cannot use wslg in work-pc

## [v2024.03.04]

### Added - 新機能について

- Add core/clipboard.lua
- Add banitasu.png

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update eza fish completion
- Update neovim clipboard integration
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.03]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim lockfiles
- Update flameshot config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.03.01]

### Added - 新機能について

- Add zed editor configs
- Add comment
- Add remove_neovim_data command

### Changed - 既存機能の変更について

- Update deno fish completion
- Enable mason and null-ls

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.29]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Rename none-ls to null-ls
- Update neovim plugin config: tree-sitter.lua
- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json
- Update core/settings.lua

### Removed - 今回で削除された機能について

- Disable none-ls(null-ls) plugins
- Remove unused files

### Fixed - 不具合修正について

なし

## [v2024.02.28]

### Added - 新機能について

- Add type annotation

### Changed - 既存機能の変更について

- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json
- Update neofetch config
- Bump aqua tools version
- Code cleanup
- Update neovim plugin configs
- Use lazy.nvim "config = true" feature
- Use lazy.nvim opts feature
- Enable neovim plugin: comment.nvim
- Update docs/THANKS.md

### Removed - 今回で削除された機能について

- Remove neovim plugin: clock.nvim
- Remove neovim colorscheme: crusoexia/vim-monokai

### Fixed - 不具合修正について

- Fix error
- Fix where syntax was not highlighted

## [v2024.02.27]

### Added - 新機能について

- Add docs/THANKS.md
- Add type annotation

### Changed - 既存機能の変更について

- Update neovim plugin config: nvim-cmp
- Update neovim plugin config: fern.lua
- Update neovim plugin config: alpha-nvim
- Update neovim init.lua
- Update neovim utils
- Update neovim options

### Removed - 今回で削除された機能について

- Remove neovim core/human-rights.lua
    - use mimikun/human-rights.nvim

### Fixed - 不具合修正について

なし

## [v2024.02.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update mason-lock.json
- Update dotfyle.json
- Update lazy-lock.json
- Improved utils/create-patch.sh

### Removed - 今回で削除された機能について

- Disable clipboard when no human rights
- Disable neovim plugin: petertriho/nvim-scrollbar
  - WORKAROUND: Crash by ui_comp_raw_line
- Remove neovim plugin: thinca/vim-scouter
- Remove neovim plugin: apple/pkl-neovim
- Remove neovim plugin: dstein64/vim-startuptime
  - using golang version

### Fixed - 不具合修正について

- Fix checkhealth warning

## [v2024.02.25]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix deperacation warning
  - Fix #290

## [v2024.02.23]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update dotfyle.json
- Update mason-lock.json
- Update lazy-lock.json
- Update .chezmoiignore

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: obsidian.nvim

## [v2024.02.22]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json
- Update deno fish completion
- Update selene config

### Removed - 今回で削除された機能について

- Remove NVIM envs

### Fixed - 不具合修正について

- Fix indent error in CHANGELOG.md

## [v2024.02.21]

### Added - 新機能について

- Add new neovim plugin: orgmode
- Add some envs
- Add ShowStdPaths usercommand in neovim
  - enable autocmds.lua

### Changed - 既存機能の変更について

- Update dotfyle.json
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix test error

## [v2024.02.20]

### Added - 新機能について

- Add todo comment: noice.nvim

### Changed - 既存機能の変更について

- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json
- Update neovim config: todo-comments.nvim
  - disable multi line todo comments
- Update starship config
  - and update .typos.toml
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update dotfyle.json
- Update vup command
- Update update_cargo_packages command
- Update pueue_update_cargo_packages command
- Update neovim plugin config: human-rights.nvim
  - dev = true
- Improved neovim lazy.nvim config

### Removed - 今回で削除された機能について

- Remove env-var: MISE_SHORTHANDS_FILE

### Fixed - 不具合修正について

- Fix README.md
- Fix vimdoc-ja #279
- Fixed asdf-powershell-core #2

## [v2024.02.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update dotfyle.json
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.16]

### Added - 新機能について

- Add new neovim plugin: human-rights.nvim
- Add some abbr in fish-shell
- Add docs/GLOSSARY.md
  - Fix #264

### Changed - 既存機能の変更について

- Update mason-lock.json
- Update lazy-lock.json
- Update dotfyle.json
- Update README.md
- Update STARTUPTIME.md
- Update emacs config
- Rename images to docs/images

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.15]

### Added - 新機能について

- Use denops-lazy.nvim
- Add pip fish completion

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update mason-lock.json
- Update lazy-lock.json
- Update deno fish completion
- Update update_mise command
- Improved neovim plugin config: fern.vim
  - Add nvim-tree/nvim-web-devicons , TheLeoP/fern-renderer-web-devicons.nvim
- Improved neovim plugin config: alpha.lua
- Update neovim utils/icons.lua
  - Add and use new icon
- Update neovim core/settings.lua
- Update bat config: use tokyonight theme
  - Add some bat themes

### Removed - 今回で削除された機能について

- Remove unused code

### Fixed - 不具合修正について

- Fix neovim plugin configs: depend denops plugins
  - cond = is_human_rights

## [v2024.02.14]

### Added - 新機能について

- Add changelog task to maskfile.md

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update mise fish completion
- Update i3-wm config
- Improved utils/changelog.sh
  - Add divider line
- Improved utils/update.sh
  - Run format dotfyle.json
- Improved lua_ls config
- Bump aqua.yaml

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.13]

### Added - 新機能について

- Add dependencies: zapling/mason-lock.nvim
- Add new task to maskfile.md
- Add new neovim colorscheme: pastelnight.nvim
- Add new neovim plugin: dotfyle-metadata.nvim
- Add new neovim plugin: 2048.nvim
- Add mattn/bsky command by aqua
- Add neoivm dotfyle.json
- Add neoivm mason-lock.json

### Changed - 既存機能の変更について

- Update zoxide fish completion
- Update STARTUPTIME.md
- Update neovim plugin config: mason.nvim
- Improved neovim plugin config: vimdoc-ja
- Improved neovim core/lazyvim.lua
- Update nyagos configs
  - Fix #57

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.12]

### Added - 新機能について

- Add new rust tool: usage-cli
- Add TODO comments
- Add new fish abbr: ghview

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update mise fish completion
- Update eza fish completion
- Update neovim plugin config: nvim-surround
- Enable neovim editorconfig integration
- Enable neovim plugin: copilot.lua
- Enable neovim plugin: pantran.nvim
- Enable neovim plugin: kensaku-search.vim
- Enable neovim plugin: kensaku-command.vim
- Enable neovim plugin: denops-docker.vim
- Enable neovim plugin: csvlens.nvim
- Use vim.uv.os_homedir()
- Use vim.uv
  - vim.loop is deprecated
- Use `table.concat()` in neovim config
  - Fix #244

### Removed - 今回で削除された機能について

- Remove wsl2-ssh-agent config & command
- Remove unused neovim plugin: confirm-quit.nvim
- Remove unused neovim plugin: dashboard-nvim
- Remove unused neovim plugin: copilot.vim
- Remove unused neovim plugin: gin.vim
- Remove unused neovim plugin: vim-gitgutter
- Remove unused neovim plugin: vim-translator
- Remove unused neovim plugin: fzf.vim
- Remove unused neovim plugin: fzf-lua
- Remove unused neovim plugin: coc.nvim
- Remove unused neovim plugin: scrollbar.nvim
- Remove unused neovim plugin: jaq-nvim
- Remove unused neovim plugin: neogit
- Remove unused neovim plugin: open-github-repo
- Remove unused neovim plugin: readablefold.vim
- Remove unused neovim plugin: startup.nvim
- Remove unused neovim plugin: denops-translate.vim
- Remove unused neovim plugin: neo-tree.nvim
- Remove unused neovim plugin: vim-silicon
- Remove unused neovim plugin: wttr.nvim
- Remove unused neovim plugin: editorconfig.nvim
  - Fix #242

### Fixed - 不具合修正について

- Fix neovim config: core/global.lua
- Fix azusa's less command mojibake
  - Fix #240
- Fix neovim plugin config: silicon.lua
  - namespace changed

## [v2024.02.09]

### Added - 新機能について

- Set host_prog in neovim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update neovim plugin config: skkeleton
- Update neovim plugin config: fzf.lua
- Update neovim plugin config: fzf.vim
- Update deno fish completion
- Improved utils/changelog.sh
  - Fix #135
- Improved Invoke-RunAfterChezmoiApply.ps1
  - Fix #223

### Removed - 今回で削除された機能について

- Remove unused code

### Fixed - 不具合修正について

- Run stylua format
- Fix PowerShell config
  - Fix #218
- Workaround for a FXXING SHXT BUG caused by the combination of vimdoc-ja and
  lazy.nvim

## [v2024.02.08]

### Added - 新機能について

- Add new neovim plugin: template.nvim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update mise fish completion
- Update starship config
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.07]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update neovim plugin config: obsidian.nvim
  - Remove deprecated option
- Improved denops depend plugins
- Improved neovim plugin config: kensaku.vim

### Removed - 今回で削除された機能について

- Remove unused neovim plugins

### Fixed - 不具合修正について

なし

## [v2024.02.06]

### Added - 新機能について

- Add new neovim plugin: lspsaga.nvim
- Add keybind C-d to exit in PowerShell
- Add some alias in PowerShell

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Improved neovim plugin config: nvim-lspconfig
- Improved neovim plugin config: telescope.nvim
- Update alacritty config
- Update textlint github workflow
- Update misc
- Don't use clipboard in neovim if you don't have human rights

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.05]

### Added - 新機能について

- Windows: Add some neovim plugins
- Add new neovim plugin: pkl-neovim
- Add new neovim plugin: open-github-repo
- Add new neovim plugin: mason-null-ls

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update .chezmoiexternal
- Update wezterm fish completion
- Update neovim plugin config: mason.nvim

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.02.04]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

- Disable neovim plugin: wttr.nvim

### Fixed - 不具合修正について

- Fix alacritty config

## [v2024.02.02]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update mise fish completion
- Update deno fish completion
- Update .chezmoiignore

### Removed - 今回で削除された機能について

- Remove unused windows files

### Fixed - 不具合修正について

- WIP: Fix neovim keymap error
- Fix neovim plugin config: telescope.nvim
- Fix zellij config
- Fix alacritty config

## [v2024.01.31]

### Added - 新機能について

- Add update_mise command

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update vup command
- Update mise fish completion
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.30]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Improved wezterm config
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix alacritty config

## [v2024.01.29]

### Added - 新機能について

- Add new neovim plugin: wttr.nvim
- Add new neovim plugin: vim-kitty

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update vup command
- Improved neovim clipboard feature
- Enable neovim plugin: none-ls

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update mise fish completion
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.26]

### Added - 新機能について

- Add .chezmoiexternal
- Add new neovim plugin: vim-kitty

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update kitty config
- Update deno fish completion
- Update .prettierignore
- Update Hyper config
- Update README.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix alacritty config
- Fix TerminalOne config

## [v2024.01.25]

### Added - 新機能について

- Add Windows Alacritty configs
- Add new neovim plugin: csvlens.nvim
- Add prettier config

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update deno fish completion
- Update lazy-lock.json
- Update linter and formatter deps
- Update TerminalOne config
- Improved Hyper config
- Improved neovim luarc for windows
- Improved textlint task

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix alacritty config
- Fix PowerShell config

## [v2024.01.24]

### Added - 新機能について

- Add new rust tool: csvlens
- Add TerminalOne config
- Add bitwardenFields template

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update bitwardenFields item_ids
- Update Windows PowerShell config
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

- Remove chezmoi templates whitespaces

### Fixed - 不具合修正について

なし

## [v2024.01.22]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update mise fish completion
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Bump aqua tools version
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.18]

### Added - 新機能について

- Add new rust tool: rbw
- Add rbw fish completion
- Add rbw powershell completion
- Add rbw config

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update zellij configs
- Update alacritty configs
- Update update_fish_completions
- Use rbwFields in tmpl
- Improved pueue config
- chezmoi: Ignore pueue configs in windows

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update update_fish_completions
- i3-wm: Set screen lock keybind

### Removed - 今回で削除された機能について

- Remove TODO.md

### Fixed - 不具合修正について

なし

## [v2024.01.16]

### Added - 新機能について

- Set azusa's Obsidian vault path

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update aqua configs
- Update STARTUPTIME.md
- Update mise configs
- Update mise fish completion
- Move files that cannot be managed with chezmoi to misc dir

### Removed - 今回で削除された機能について

- Remove unused fish completions

### Fixed - 不具合修正について

- Fix alacritty configs

## [v2024.01.15]

### Added - 新機能について

- Add comment to i3-config

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update alacritty fish completion
- Update mise fish completion
- Update neovim plugin config: eskk.vim
- Update alacritty config
- Update typos.toml
- Update starship config
- Run taplo format

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix helix config

## [v2024.01.14]

### Added - 新機能について

- Add Windows game settings

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update mise fish completion
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.13]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.12]

### Added - 新機能について

- Add betterlockscreen config
- Add polybar config
- Add rofi config
- Add flameshot config
- Add DISPLAY env-var in not azusa
- Add julia PATH
- Add new neovim plugin: eskk.vim
- Add new neovim plugin: migemo-search.vim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Bump aqua tools version
- Update .chezmoiignore
- Update utils/update.sh
- Set i3 wallpaper random

### Removed - 今回で削除された機能について

- Remove fish version vup
- Remove vupueue
- Remove powershell version vup

### Fixed - 不具合修正について

- Fix word in neovim plugins

## [v2024.01.11]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update wezterm config
- Update mise config
- Update mise fish completion
- Improved vup command
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: hawtkeys.nvim

## [v2024.01.10]

### Added - 新機能について

- Add new rust tool: sshx
- Add some aqua packages
  - actionlint, clive, ttyd, vhs

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update .chezmoiignore
- Update utils/changelog.sh
- Improved wezterm config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix config.fish

## [v2024.01.09]

### Added - 新機能について

- Add new neovim plugin: hawtkeys.nvim
- Use mise
- Add new neovim themes: evergarden, cyberdream.nvim

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update utils/changelog.sh
- Change wezterm font
- Update neovim themes
- Sort themes
- Update vup(ueue) command
- Update update_fish_completions command
- Update lazy-lock.json

### Removed - 今回で削除された機能について

- Remove asdf

### Fixed - 不具合修正について

- Fix utils/benchmark.sh
- Code cleanup

## [v2024.01.08]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- change i3 wallpaper

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.07]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update ripgrep fish completion
- Update lazy-lock.json
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.06]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.05]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update deno fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.04]

### Added - 新機能について

- Add mise fish completion

### Changed - 既存機能の変更について

- rtx to mise
  - Fix #147
- Update update_fish_completions
- Update lazy-lock.json
- Update asdf tools version
  - vim 9.1.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2024.01.01]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.30]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Bump aqua tools version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.29]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2189
- Update lazy-lock.json
- Set new format in i3status-rust
- Update i3 i3bar config
- Update i3 M-d menu
- Update wezterm fontsize
- Update i3 kabegami

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix syntax in zshrc
- Fix i3 fontsize
- Fix azusa dpi

## [v2023.12.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2188
- Update STARTUPTIME.md
- Improved changelog.sh
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix benchmark.sh
- Fix nyagos config

## [v2023.12.27]

### Added - 新機能について

- Add linux_rubygem_list.txt
- Add .luarc.json to chezmoi root
- Use delta in diff

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - ruby 3.3.0
- Update nyagos configs

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix gitconfig
- Fix chezmoi diff broken
- Fix TODO.md
  - Issue #128 Closed
- Fix rofi config

## [v2023.12.26]

### Added - 新機能について

- Set PAGER env-vars
  - Fix #128

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update neovim plugin config: tree-sitter
- Update rofi config
- Update i3-wm config
- Update rtx fish completion
- Update .editorconfig
- Update .chezmoiignore
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.24]

### Added - 新機能について

- Add .xmodmap
- Add .xinitrc
- Add rofi config
- Add wallpaper setting in i3-wm config

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2185
- Update lazy-lock.json
- Update rtx fish completion
- Update .chezmoiignore
- Update LOCALBINS

### Removed - 今回で削除された機能について

- Remove .config/fcitx5/conf directory

### Fixed - 不具合修正について

- CapsLock to Ctrl in azusa
- Fix README images
- Fix lint error

## [v2023.12.23]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- aqua: Bump version

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.22]

### Added - 新機能について

- Add utils/changelog.sh

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update TODO.md
- Update rtx fish completion
- Update deno fish completion
- Update utils/lint.sh
- Update utils/format.sh
- Improved utils/update.sh
  - Fix #116
- Update asdf tools version
  - vim 9.0.2184
- Improved config.fish
- Update .profile
- Improved bashrc
- Improved zshrc
- Improved powershell config
- Update neovim plugin config: vimdoc-ja
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.21]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update rtx fish completion
- Update TODO.md
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.20]

### Added - 新機能について

- Add utils/install-kabegami.sh
- Add azusa only env-vars
- [azusa] Add autostart app: fcitx5

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2181
- Update lazy-lock.json
- Update STARTUPTIME.md
- Unmanaged fcitx5/profile by chezmoi
- Update utils/update.sh
- Update fd fish completion
- Update .chezmoiignore
- Update editorconfig-template
- Improved config.fish
- Improved powershell config for archlinux

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix config.fish
- Fix GitHub CLI config
- Fix neovim plugin configs

## [v2023.12.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.18]

### Added - 新機能について

- Add fcitx5 config

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2175
- Update wezterm config
- Improve wezterm config for archlinux
- Improve fish config for archlinux
- Improve gh config for archlinux

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.17]

### Added - 新機能について

- Add .Xresources
- Add i3-wm config

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.15]

### Added - 新機能について

- Add neovim plugins: translate plugin

### Changed - 既存機能の変更について

- Update CHANGELOG.md
- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2167
- Update neovim utils: obsidian.lua
- Update neovim plugin config: telescope.nvim
- Update rtx fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.14]

### Added - 新機能について

- Add neovim plugin: nvim-scrollbar
- Add neovim plugin: nvim-hlslens.lua
- Add neovim plugin: none-ls.nvim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update deno fish completion
- Update rtx fish completion
- Update STARTUPTIME.md
- Update helix config
- Update neovim plugin config: lualine.nvim
- Update neovim plugin configs: telescope.nvim
- Use utils/icons.lua
- Disable denops plugin in non-human rights env

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: alpha

## [v2023.12.13]

### Added - 新機能について

- Add neovim autocmd define file
- Add more-options.lua.tmpl
- Add new neovim plugin: SmoothCursor.nvim
- Add new neovim plugin: accelerated-jk.nvim
- Add new neovim plugin: neoscroll.nvim
- Add new neovim plugin: nvim-autopairs
- Add new neovim plugins: ccc.nvim

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update rtx fish completion
- Update asdf tools version
  - vim 9.0.2160
- Rename file
  - neovim: utils/obsidian_helper.lua to utils/obsidian.lua
- Update neovim plugin config: telescope.nvim
- Update neovim plugin config: lualine.nvim
- Update neovim plugin config: treesitter
- Improved neovim config: human_rights.lua

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: obsidian.nvim
- Fix stylua error

## [v2023.12.12]

### Added - 新機能について

- Add an util to check human rights

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update eza fish completion
- Update asdf tools version
  - vim 9.0.2158

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix an issue where parser download would fail in environments without human
  rights.

## [v2023.12.11]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim config: telescope.nvim
- Update neovim config: lualine.nvim
- Update neovim README.md
- Update asdf tools version
  - python 3.12.1
- Update linux_pip_packages.txt
- Update STARTUPTIME.md
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: LuaSnip
- Fix neovim plugin config: mason.nvim

## [v2023.12.10]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- aqua: Update bitwarden CLI
- Update eza fish completion
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.09]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2155
- Update lazy-lock.json
- Update GitHub CLI config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.08]

### Added - 新機能について

- Add some type annotations in neovim lua files
- Add process to exclude LS that cannot be used with Windows

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update rtx fish completion
- Update config.fish
- Update neovim env-vars in bash, powershell and zsh
- Update neovim config: obsidian.nvim
- Update neovim config: gitsigns.nvim
- Update neovim config: mason.nvim
- Improved neovim config: nvim-treesitter
- Improved neovim util: obsidian_helper.lua
- If no human rights, concurrency is 1 in lazy.nvim
- Improved the human rights check process

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Ignore `undefined global vim` warning

## [v2023.12.07]

### Added - 新機能について

- Add neovim plugins: LSP, cmp, snippets
- Add neovim plugin: nvim-lspconfig
- Add neovim plugin: crates.nvim
- Add some envs to zshrc
- Add some envs to bashrc

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update rtx fish completion
- Update rtx config
- Update lazy.nvim concurrency
  - Limit the number of concurrency depending on human rights or OS
- Improved neovim plugin config: coc-nvim
- Disable coc-nvim

### Removed - 今回で削除された機能について

- Remove neovim file: plugins/lsp.lua

### Fixed - 不具合修正について

- Fix WORKSPACE env in PowerShell config

## [v2023.12.06]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2153
- Update rtx config
- Update deno fish completion
- Update lazy-lock.json
- Update rtx fish completion
- Update STARTUPTIME.md
- Update neovim config: obsidian.nvim

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix WORKSPACE env
- Fix maskfile task error

## [v2023.12.05]

### Added - 新機能について

- Add neovim utils: silueto.lua
- Add PHP composer configs

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update neovim config: obsidian.nvim
- Update shell configs
- Update neovim config: core/global.lua
- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2149

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.04]

### Added - 新機能について

- Add neovim utils: obsidian_helper.lua

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update windows_cargo_packages.txt
- Update rtx fish completion
- Update GitHub CLI config
- Update asdf tools version
  - vim 9.0.2146
- Update neovim config: obsidian.nvim
- Update neovim utils: func.lua
- Improved PowerShell config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix stylua error
- Fix Windows PowerShell config copy error
- Fix utilities/Invoke-RunBeforeChezmoiApply.ps1

## [v2023.12.03]

### Added - 新機能について

- Add aqua-renovate-config
- Add new rust tool: hysp

### Changed - 既存機能の変更について

- chore(deps): update dependency aquaproj/aqua-registry to v4.95.0
- chore(deps): update dependency textlint-rule-preset-ja-technical-writing to v9
- chore(deps): update dependency tdewolff/minify to v2.20.9
- chore(deps): update dependency aquaproj/aqua-renovate-config to v1.13.0
- Update .typos.toml
- Update bun fish completion
- Update lazy-lock.json
- Update Linux PowerShell config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.02]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2143
- aqua: Bump version
- Update lazy-lock.json
- Update JohnnyMorganz/stylua-action action to v3
- chore(deps): update dependency textlint-rule-preset-ja-technical-writing to v8
- Update actions/setup-node action to v4
- Update crate-ci/typos action to v1.16.23

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.12.01]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Improved process of using chezmoi templates (Windows)
- Improved process of using chezmoi templates
- Update GitHub CLI config
- Use Join-Path in PowerShell config
- Update nyagos config
- Update neovim config: obsidian.nvim
- aqua: Bump version
- Update human rights judgment process in wezterm
- Improved human rights judgment process in neovim
- Update deno fish completion
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2138
- Update textlint deps
- Rename renovate.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fixed AQUA_POLICY_CONFIG env

## [v2023.11.30]

### Added - 新機能について

- Set ZSH_CACHE_DIR
- Add aqua PATH
- Add renovate.json

### Changed - 既存機能の変更について

- Update utils/update.sh
- Update lazy-lock.json
- Update rtx config
- Manage what was managed with gup with aqua
  - gomi
  - misskey-cli
- Disable bw-zsh-plugin
- Update aqua configs
- Update .config/README.md

### Removed - 今回で削除された機能について

- Remove direnv config

### Fixed - 不具合修正について

- Fixed runme fish completion typo

## [v2023.11.29]

### Added - 新機能について

- Add new rust tool: trashy
- Add new abbr

### Changed - 既存機能の変更について

- Disable aqua security policy
  - It's just idiot to care about security.
- Update chezmoi by aqua
- Manage what was managed with gup and asdf with aqua
- Update asdf tools version
  - vim 9.0.2136
- Update zellij fish completion
- Update runme fish completion
- Update pueue fish completion
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

- Remove asdf-direnv config from config.fish
- Remove some asdf plugins

### Fixed - 不具合修正について

- Fixed pueue completion typo

## [v2023.11.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2134
  - github-cli 2.39.2
- Update neovim-dashboard.png
- Update ripgrep fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.27]

### Added - 新機能について

- Add ripgrep powershell completion

### Changed - 既存機能の変更について

- Update .typos.toml
- Update STARTUPTIME.md
- Update lazy-lock.json
- Update asdf tools version
  - chezmoi 2.42.0
- Update update_fish_completions command
- Update ripgrep fish completion
- Update vupueue command

### Removed - 今回で削除された機能について

- Remove update_ripgrep_fish_completion command

### Fixed - 不具合修正について

なし

## [v2023.11.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - nodejs 20.10.0
  - yq 4.40.3
  - vim 9.0.2130
- Update lazy-lock.json
- Update eza fish completion
- Update deno fish completion

### Removed - 今回で削除された機能について

- Remove asdf-yarn plugin

### Fixed - 不具合修正について

なし

## [v2023.11.22]

### Added - 新機能について

- Add maskfile.md

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update textlint deps
- Update asdf tools version
  - vim 9.0.2120

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.21]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - yarn 1.22.21
- Update lazy-lock.json
- Update yq fish completion
- Update runme fish completion
- Update STARTUPTIME.md
- Update .typos.toml

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.20]

### Added - 新機能について

- Add sheldon env-vars
  - SHELDON_CONFIG_DIR
  - SHELDON_DATA_DIR
- Add zsh plugin: zeno.zsh

### Changed - 既存機能の変更について

- Update runme fish completion
- Update yq fish completion
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update .typos.toml
- Relocated sheldon configs
- Disable inshellisense in bash and zsh
- Update linux_pip_packages.txt

### Removed - 今回で削除された機能について

- Remove fish plugin: oh-my-fish/plugin-thefuck

### Fixed - 不具合修正について

なし

## [v2023.11.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - yq 4.40.2
- Update yq fish completion
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix .typos.toml

## [v2023.11.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Rename typos.toml
- Update lazy-lock.json
- Update deno fish completion
- Update asdf tools version
  - vim 9.0.2112
  - powershell-core 7.4.0
  - fzf 0.44.1

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix fish error
- Fix typos

## [v2023.11.16]

### Added - 新機能について

- Add aqua local registry.yaml
- Add aqua policy.yaml

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Move aqua.yaml to `XDG_CONFIG_HOME/aqua`
- Update config.fish
- Update aqua envs in config.fish
- Update asdf envs in config.fish
- Use `XDG_CACHE_HOME` in config.fish
- Use `XDG_DATA_HOME` in config.fish
- Use `XDG_CONFIG_HOME` in config.fish
- Use `FISH_CONFIG_DIR` in config.fish
- Use `STARSHIP_CONFIG_DIR` in config.fish

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.15]

### Added - 新機能について

- Add aqua.yaml

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update rtx fish completion
- Update chezmoi fish completion
- Update asdf tools version
  - dotnet-core 8.0.100
  - github-cli 2.39.1
  - vim 9.0.2105

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: vimdoc-ja

## [v2023.11.14]

### Added - 新機能について

- Add some fish abbr

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update nkf fish completion
- Update vup(ueue)
- Update neovim config: coc-nvim
- Update zellij fish completion
- Update eza fish completion
- Update lazy-lock.json
- Update typos.toml
- Update asdf tools version
  - fzf 0.44.0
  - chezmoi 2.41.0
  - github-cli 2.39.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix selene warning

## [v2023.11.13]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2103

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.12]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2101
- Update deno fish completion
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.10]

### Added - 新機能について

- Add new command: update_brew

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update vup(ueue)

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.09]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update neovim config: coc-nvim
- Update rtx fish completion
- Update eza fish completion
- Update asdf tools version
  - vim 9.0.2095
- Improved version detection in Windows PowerShell config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.08]

### Added - 新機能について

- Add new env: `NVIM_*`
- Add new fish abbr: pueue

### Changed - 既存機能の変更について

- Update asdf tools version
  - yq 4.40.1
- Update rtx fish completion
- Update zellij fish completion
- Update STARTUPTIME.md
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.07]

### Added - 新機能について

- Use abbr in fish
- Use inshellisense
- Add new command: bit
  - github.com/chriswalz/bit

### Changed - 既存機能の変更について

- Update flyctl fish completion
- Update typos.toml
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update TODO.md
  - Fixed #60
- Update neovim config: obsidian.nvim
- Improved version detection in Linux PowerShell
- Improved version detection in Windows PowerShell

### Removed - 今回で削除された機能について

- Remove unused comment in config.fish

### Fixed - 不具合修正について

なし

## [v2023.11.06]

### Added - 新機能について

- Add more neovim options
  - Fix #30
- Add new command: update_pkgx

### Changed - 既存機能の変更について

- Update linux_pip_packages.txt
- Update vup(ueue)
- Update TODO.md
- Update STARTUPTIME.md
- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2092
  - python 3.12.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix typo error

## [v2023.11.05]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2091

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.04]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2090

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.11.03]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2087
- Update lazy-lock.json
- Update typos.toml

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

    - Fix typo

## [v2023.11.02]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update deno fish completion
- Improved paleovim config
  - Fix #28
- Update .wslconfig
- Update wsl.conf
- Update STARTUPTIME.md
- Update lazy-lock.json
- Update .config/nvim/Makefile
- Update asdf tools version
  - github-cli 2.38.0
  - bitwarden 2023.10.0
- Update .vim/Makefile

### Removed - 今回で削除された機能について

- Remove unused files

### Fixed - 不具合修正について

なし

## [v2023.11.01]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.31]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.30]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim plugin config: vimdoc-ja.lua
- Update lazy-lock.json
- Update asdf tools version
  - nodejs 20.9.0
  - vim 9.0.2081
  - chezmoi 2.40.4

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2077

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.27]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2073
  - powershell-core 7.3.9
- Improved Windows PowerShell config
  - Fix #58
- Improved Linux PowerShell config
  - Fix #52

### Removed - 今回で削除された機能について

- Windows: Remove lazy-lock.json

### Fixed - 不具合修正について

なし

## [v2023.10.26]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update eza fish completion
- Update wezterm config
- Update asdf tools version
  - vim 9.0.2067
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.25]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - dotnet-core 7.0.403
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.24]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update asdf tools version
  - nodejs 20.8.1
  - vim 9.0.2063
- Update brew fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.23]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim plugin config: vimdoc-ja.lua
  - Use `vim-jp/vimdoc-ja` repo
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.22]

### Added - 新機能について

- Add new rust tool: yazi-fm

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2059
- Update some fish completions
  - fd
  - pueue
  - rtx
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.21]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update gup config
  - Add wsl2-ssh-agent
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.20]

### Added - 新機能について

- Add neovim file: userfunc.lua
- Use wsl2-ssh-agent
  - Delete keychain config

### Changed - 既存機能の変更について

- Update neovim option: `relativenumber = true`
- Update asdf tools version
  - vim 9.0.2056
- Update lazy-lock.json
- Update eza fish completion
- Update STARTUPTIME.md
- Update Windows PowerShell config

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.19]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update Linux PowerShell config
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.18]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2048
  - github-cli 2.37.0
- Update nyagos config
- Update vup(ueue)

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.17]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update brew fish completion
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2040

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.16]

### Added - 新機能について

- Add new make task: show help
- Add some golang tools
  - checkmake
  - editorconfig-checker
  - make2help

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update TODO.md
- Update asdf tools version
  - nodejs 18.18.2
  - vim 9.0.203
- Update vup(ueue)

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix utils/benchmark.sh

## [v2023.10.15]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2032
  - fzf 0.43.0
- Update lazy-lock.json
- Update eza fish completion
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix PSSA errors
- Fix lualine bug

## [v2023.10.13]

### Added - 新機能について

- Add nyagos config
- Add more nyagos config
- Add winfetch config
- Add GlazeWM config

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update deno fish completion
- Update wezterm launch_menu config
- Update asdf tools version
  - chezmoi 2.40.3
  - nodejs 18.18.1

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.12]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update eza fish completion
- Update bat fish completion
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.2018
  - bitwarden 2023.9.1

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.11]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Improved lua/core/options.lua
- Improved lua/core/global.lua
- Improved lua/core/lazyvim.lua
- Improved lua/core/init.lua
- Update Windows neovim config
- Update STARTUPTIME.md
- Update lazy-lock.json
- Update asdf tools version
  - dotnet-core 7.0.402
  - powershell-core 7.3.8

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix yank bug Fix #56

## [v2023.10.10]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Improved neovim config
- Update asdf tools version
  - vim 9.0.2009
  - chezmoi 2.40.2
- Update lazy-lock.json
- Update STARTUPTIME.md
- Update update_asdf_neovim

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.09]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.2004

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix SpellCheck fails

## [v2023.10.08]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update asdf tools version
  - vim 9.0.2001

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.07]

### Added - 新機能について

- Add aqua PATH
- Add new neovim plugins: LSP related plugins

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update STARTUPTIME.md
- Update asdf tools version
  - vim 9.0.1999
  - python 3.11.6

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix neovim plugin config: vimdoc-ja
- Fix neovim config: themes.lua

## [v2023.10.06]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

なし

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.05]

### Added - 新機能について

- Add selene Lua Linter

### Changed - 既存機能の変更について

- Update STARTUPTIME.md
- Update lazy-lock.json
- Update utils/benchmark.sh
- Update typos.toml
- Update neovim plugin config: alpha-nvim
  - Add open Mason window shortcut button
- Update Linux wezterm config
  - Use nerdfont in Battery icon
- Update neovim plugin configs: themes
- Update neovim plugin config: themery.nvim
- Update hyperfine fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.04]

### Added - 新機能について

- Add new neovim plugin: mkdir.nvim
- Add new neovim plugin: pandoc.nvim
- Add new neovim plugin: confirm-quit.nvim
- Add new neovim plugin: surround-ui.nvim

### Changed - 既存機能の変更について

- Update TODO.md
- Update lazy-lock.json
- Update typos.toml
- Update rye fish completion
- Update asdf tools version
  - python 3.12.0

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.03]

### Added - 新機能について

- Add new neovim plugin: typos.nvim
- Add new neovim plugin: live-server.nvim
- Add new neovim plugin: clock.nvim
- Add new rust tool: colorgen-nvim

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.1976
  - github-cli 2.36.0
- Update TODO.md
- Update lazy-lock.json
- Update STARTUPTIME.md

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

- Fix mastodon-nvim.lua

## [v2023.10.02]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update TODO.md
- Update ~/.config/nvim/README.md
- Update asdf tools version
  - vim 9.0.1968
- Update lazy-lock.json
- Update eza fish completion

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.10.01]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.30]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update asdf tools version
  - vim 9.0.1959
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.29]

### Added - 新機能について

- Add windows_cargo_packages.txt

### Changed - 既存機能の変更について

- Update lazy-lock.json
- Update README.md
- Update asdf tools version
  - vim 9.0.1950

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

## [v2023.09.28]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

- Update neovim plugin config: obsidian.nvim
- Update asdf tools version
  - vim 9.0.1946
- Update fish completions
  - deno
  - runme
- Update lazy-lock.json

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし

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
  - <https://github.com/RoryNesbitt/dotfyle-cli>
- Add some neovim plugins
  - vim-skk/skkeleton
  - willelz/skk-tutorial.vim
- Add new neovim colorschemes
  - <https://github.com/kyoh86/momiji>
  - <https://github.com/sainnhe/edge>
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
  - <https://github.com/rbtnn/vim-ambiwidth>

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
  - <https://github.com/ogham/exa/issues/1243>
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
- Copy of `OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` to
  the other 3 setting files
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
  - Fix:
    [nvimのダッシュボードが表示されない(alpha.nvim) Issue #33](https://github.com/mimikun/dotfiles/issues/33)

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

## [v2024.mm.dd]

### Added - 新機能について

なし

### Changed - 既存機能の変更について

なし

### Removed - 今回で削除された機能について

なし

### Fixed - 不具合修正について

なし
