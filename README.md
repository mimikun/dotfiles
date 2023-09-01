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

- [neovim config](dot_config/nvim/README.md)
- [paleovim(vim) config](dot_vim/README.md)
- [config](dot_config/README.md)
- [Fish-shell config](dot_config/fish/README.md)
- [~/.local/bin](private_dot_local/bin/README.md)
