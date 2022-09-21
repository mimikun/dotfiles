# Windows設定ファイル

## 仕事環境の場合

```shell
cp ./work_dot_wslconfig $WIN_HOME/.wslconfig
```

## 私物環境の場合

```shell
cp ./.hyper.js $WIN_HOME/AppData/Roaming/Hyper/.hyper.js
cp ./home-dot_wslconfig $WIN_HOME/.wslconfig
mkdir $WIN_HOME/utilities
cp ./utilities/* $WIN_HOME/utilities/
```

### `%USERPROFILE%\Documents\WindowsPowerShell\` 以下に配置する

- Microsoft.PowerShell_profile.ps1

### `%USERPROFILE%\Documents\PowerShell\` 以下に配置する

- Microsoft.PowerShell_profile.ps1

