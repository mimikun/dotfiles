# dotfiles

![GitHub tag (with filter)](https://img.shields.io/github/v/tag/mimikun/dotfiles)

![GitHub commit activity of 1 week](https://img.shields.io/github/commit-activity/w/mimikun/dotfiles)

![GitHub Workflow Status (textlint)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/textlint.yml?label=textlint)
![GitHub Workflow Status (stylua)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/stylua-lint.yml?label=stylua)
![GitHub Workflow Status (spellcheck)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/spell-check.yml?label=SpellCheck)
![GitHub Workflow Status (PSSA)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/script-analyze.yml?label=PSSA)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/mimikun/dotfiles)

## Overview

mimikun's dotfiles. managed by [chezmoi](https://www.chezmoi.io/).

## Screenshots

![my terminal](assets/images/terminal.png)
![my neovim dashboard](assets/images/neovim-dashboard.png)

## Setup

### Linux

```shell
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

### Windows

```shell
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

### macOS

WIP (I have not mac now)

## Others

- [Changelog](CHANGELOG.md)
- [Startup time Log](STARTUPTIME.md)
- [various configs](dot_config/README.md)
- [Fish-shell config](dot_config/fish/README.md)
- [neovim config](dot_config/nvim/README.md)
- paleovim(vim) config
  - [.vim](dot_vim/README.md)
  - [.config/vim](dot_config/vim/README.md)
- [Game settings](game_settings/README.md)
- [Files that cannot be managed with chezmoi](misc/README.md)
- [~/.local/bin](private_dot_local/bin/README.md)

## Glossary

- [Glossary](docs/src/glossary.md)

![Alt](https://repobeats.axiom.co/api/embed/b273effbcaf8fb062bc44b4a00b7b64b5ec1beba.svg "Repobeats analytics image")
