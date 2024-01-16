# misc

Files that cannot be managed by chezmoi will be placed here.

## Windows

### `C:\Program Files\Git\etc\bash.bashrc`

Append to the end of the file:

```bash
# System-wide bashrc file
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```

## WSL

### `/etc/wsl.conf`

```bash
cp ./wsl.conf /etc/wsl.conf
```

### `/usr/lib/binfmt.d/WSLInterop.conf`

```bash
cp ./WSLInterop.conf /usr/lib/binfmt.d/WSLInterop.conf
```

## macOS

WIP

