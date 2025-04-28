# dotfiles

![GitHub tag (with filter)](https://img.shields.io/github/v/tag/mimikun/dotfiles)

![GitHub commit activity of 1 week](https://img.shields.io/github/commit-activity/w/mimikun/dotfiles)

![GitHub Workflow Status (textlint)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/textlint.yml?label=textlint)
![GitHub Workflow Status (stylua)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/stylua-lint.yml?label=stylua)
![GitHub Workflow Status (spellcheck)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/spell-check.yml?label=SpellCheck)
![GitHub Workflow Status (PSSA)](https://img.shields.io/github/actions/workflow/status/mimikun/dotfiles/script-analyze.yml?label=PSSA)

[![DeepWiki](https://img.shields.io/badge/DeepWiki-mimikun%2Fdotfiles-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAyCAYAAAAnWDnqAAAAAXNSR0IArs4c6QAAA05JREFUaEPtmUtyEzEQhtWTQyQLHNak2AB7ZnyXZMEjXMGeK/AIi+QuHrMnbChYY7MIh8g01fJoopFb0uhhEqqcbWTp06/uv1saEDv4O3n3dV60RfP947Mm9/SQc0ICFQgzfc4CYZoTPAswgSJCCUJUnAAoRHOAUOcATwbmVLWdGoH//PB8mnKqScAhsD0kYP3j/Yt5LPQe2KvcXmGvRHcDnpxfL2zOYJ1mFwrryWTz0advv1Ut4CJgf5uhDuDj5eUcAUoahrdY/56ebRWeraTjMt/00Sh3UDtjgHtQNHwcRGOC98BJEAEymycmYcWwOprTgcB6VZ5JK5TAJ+fXGLBm3FDAmn6oPPjR4rKCAoJCal2eAiQp2x0vxTPB3ALO2CRkwmDy5WohzBDwSEFKRwPbknEggCPB/imwrycgxX2NzoMCHhPkDwqYMr9tRcP5qNrMZHkVnOjRMWwLCcr8ohBVb1OMjxLwGCvjTikrsBOiA6fNyCrm8V1rP93iVPpwaE+gO0SsWmPiXB+jikdf6SizrT5qKasx5j8ABbHpFTx+vFXp9EnYQmLx02h1QTTrl6eDqxLnGjporxl3NL3agEvXdT0WmEost648sQOYAeJS9Q7bfUVoMGnjo4AZdUMQku50McDcMWcBPvr0SzbTAFDfvJqwLzgxwATnCgnp4wDl6Aa+Ax283gghmj+vj7feE2KBBRMW3FzOpLOADl0Isb5587h/U4gGvkt5v60Z1VLG8BhYjbzRwyQZemwAd6cCR5/XFWLYZRIMpX39AR0tjaGGiGzLVyhse5C9RKC6ai42ppWPKiBagOvaYk8lO7DajerabOZP46Lby5wKjw1HCRx7p9sVMOWGzb/vA1hwiWc6jm3MvQDTogQkiqIhJV0nBQBTU+3okKCFDy9WwferkHjtxib7t3xIUQtHxnIwtx4mpg26/HfwVNVDb4oI9RHmx5WGelRVlrtiw43zboCLaxv46AZeB3IlTkwouebTr1y2NjSpHz68WNFjHvupy3q8TFn3Hos2IAk4Ju5dCo8B3wP7VPr/FGaKiG+T+v+TQqIrOqMTL1VdWV1DdmcbO8KXBz6esmYWYKPwDL5b5FA1a0hwapHiom0r/cKaoqr+27/XcrS5UwSMbQAAAABJRU5ErkJggg==)](https://deepwiki.com/mimikun/dotfiles)

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
