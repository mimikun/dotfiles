# dotfiles

![GitHub tag (with filter)](https://img.shields.io/github/v/tag/mimikun/dotfiles)

![GitHub commit activity of 1 week](https://img.shields.io/github/commit-activity/w/mimikun/dotfiles)

![GitHub Workflow Status (textlint)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/textlint.yml?label=textlint)
![GitHub Workflow Status (stylua)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/stylua-lint.yml?label=stylua)
![GitHub Workflow Status (spellcheck)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/spell-check.yml?label=SpellCheck)
![GitHub Workflow Status (PSSA)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/script-analyze.yml?label=PSSA)

## Overview

mimikun's dotfiles. managed by [chezmoi](https://www.chezmoi.io/).

## Screenshots

![my neovim dashboard](docs/images/neovim-dashboard.png)
![my neovim editor](docs/images/neovim-editor.png)

## Setup

### Linux

```shell
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

#### SKK JISYOs

File size is too large and cannot be managed by chezmoi.

Must be downloaded manually. (2023.09.19 now)

```shell
make install-skk-jisyo
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
- [paleovim(vim) config](dot_vim/README.md)
- [Game settings](game_settings/README.md)
- [Files that cannot be managed with chezmoi](misc/README.md)
- [~/.local/bin](private_dot_local/bin/README.md)

## Glossary

- [Glossary](docs/GLOSSARY.md)
