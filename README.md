# my dotfiles

mimikun's dotfiles.
managed by [chezmoi](https://www.chezmoi.io/).

## Setup

### Linux

```shell
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

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

```shell
chezmoi init --apply --verbose https://github.com/mimikun/dotfiles.git
```

#### `C:\Program Files\Git\etc\bash.bashrc`

末尾にこれを加える

```bash
# System-wide bashrc file
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```

#### `%USERPROFILE%\.config\chezmoi\chezmoi.toml`

```toml
[cd]
    command = "pwsh.exe"

[hooks.apply.pre]
command = "pwsh"
args = ["-c", "& {Invoke-RunBeforeChezmoiApply}"]

[hooks.apply.post]
command = "pwsh"
args = ["-c", "& {Invoke-RunAfterChezmoiApply}"]
```

#### WSLの `/etc/wsl.conf` に配置する

- `wsl.conf`

#### WSLの `/usr/lib/binfmt.d/WSLInterop.conf` に配置する

- `WSLInterop.conf`

### macOS

WIP

## Others

- [Linux neovim config](dot_config/nvim/README.md)
- [Windows neovim config](AppData/Local/nvim/README.md)
- [Windows vim config](vimfiles/README.md)
- [Fish-shell config](dot_config/fish/README.md)
