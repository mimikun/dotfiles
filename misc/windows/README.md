# windows

## `C:\Program Files\Git\etc\bash.bashrc`

Append to the end of the file:

```bash
# System-wide bashrc file
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
```

## copy

```powershell
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value '# System-wide bashrc file'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value 'if [ -f ~/.bashrc ]; then'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value '    source ~/.bashrc'
Add-Content -Path "C:\Program Files\Git\etc\bash.bashrc" -Value 'fi'
```
