# dotfiles

![GitHub tag (with filter)](https://img.shields.io/github/v/tag/mimikun/dotfiles)

![GitHub commit activity total](https://img.shields.io/github/commit-activity/t/mimikun/dotfiles)

![GitHub commit activity of 1 year](https://img.shields.io/github/commit-activity/y/mimikun/dotfiles)
![GitHub commit activity of 1 month](https://img.shields.io/github/commit-activity/m/mimikun/dotfiles)
![GitHub commit activity of 1 week](https://img.shields.io/github/commit-activity/w/mimikun/dotfiles)

![GitHub top language](https://img.shields.io/github/languages/top/mimikun/dotfiles)
![GitHub language count](https://img.shields.io/github/languages/count/mimikun/dotfiles)

![GitHub Workflow Status (textlint)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/textlint.yml?label=textlint)
![GitHub Workflow Status (stylua)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/stylua-lint.yml?label=stylua)
![GitHub Workflow Status (spellcheck)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/spell-check.yml?label=SpellCheck)
![GitHub Workflow Status (PSSA)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/script-analyze.yml?label=PSSA)

![LICENSE](https://img.shields.io/github/license/mimikun/dotfiles)

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/mimikun/dotfiles)
![GitHub repo size](https://img.shields.io/github/repo-size/mimikun/dotfiles)

![GitHub Repo stars](https://img.shields.io/github/stars/mimikun/dotfiles)
![GitHub watchers](https://img.shields.io/github/watchers/mimikun/dotfiles)

[![Total Lines](https://tokei.rs/b1/github/mimikun/dotfiles)](https://github.com/mimikun/dotfiles)

## Overview

mimikun's dotfiles.
managed by [chezmoi](https://www.chezmoi.io/).

## Screenshots

![my neovim dashboard](images/neovim-dashboard.png)

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

#### `C:\Program Files\Git\etc\bash.bashrc`

Append to the end of the file:

```bash
# System-wide bashrc file
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```

#### Place it in `/etc/wsl.conf` of WSL

- `wsl.conf`

#### Place it in `/usr/lib/binfmt.d/WSLInterop.conf` of WSL

- `WSLInterop.conf`

### macOS

WIP

## Others

- [neovim config](dot_config/nvim/README.md)
- [paleovim(vim) config](dot_vim/README.md)
- [config](dot_config/README.md)
- [Fish-shell config](dot_config/fish/README.md)
- [~/.local/bin](private_dot_local/bin/README.md)
- [Changelog](CHANGELOG.md)
- [Startup time Log](STARTUPTIME.md)

## Glossary

- `human rights`
    - e.g. RAM 32GB, Ryzen 9 3900X and 1TB SSD
