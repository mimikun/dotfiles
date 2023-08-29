# my dotfiles

mimikun's dotfiles.
managed by [chezmoi](https://www.chezmoi.io/).

## Setup

### Linux, macOS

WIP

#### `~/.config/chezmoi/chezmoi.toml`

```toml
[hooks.apply.pre]
command = "echo"
args = ["pre-apply-hook"]

[hooks.apply.post]
command = "echo"
args = ["post-apply-hook"]
```

### Windows

See: [dotfiles-windows](https://github.com/mimikun/dotfiles-windows)

## Others

- [Neovim config](dot_config/nvim/README.md)
- [Fish-shell config](dot_config/fish/README.md)
