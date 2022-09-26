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
- TrexPasswordClass.ps1

### `%USERPROFILE%\Documents\PowerShell\` 以下に配置する

- Microsoft.PowerShell_profile.ps1

#### TrexPasswordClass.ps1

```powershell
class MyClass{
    [string] GetPassword(){
        return "my password here"
    }
}
```

### `%USERPROFILE%\Desktop` 以下に配置する

- Mining.bat

#### Mining.bat

まず以下を実行

```shell
cp ./utilities/gminer-flux-mining.bat $windl/Mining.bat
```

その後、手作業でデスクトップに配置

