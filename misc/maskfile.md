# misc

## windows


```bash
echo "NOT SUPPORT THIS OS"
```

```powershell
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value '# System-wide bashrc file'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value 'if [ -f ~/.bashrc ]; then'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value '    source ~/.bashrc'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value 'fi'
```

## wsl

```bash
sudo cp ./wsl.conf /etc/wsl.conf
sudo cp ./WSLInterop.conf /usr/lib/binfmt.d/WSLInterop.conf
```

```powershell
Write-Output "NOT SUPPORT THIS OS"
```

## macos

```bash
echo "WIP"
```

```powershell
Write-Output "NOT SUPPORT THIS OS"
```
