# original task define powershell scripts

# global vars
$repo_name = "dotfiles-windows"
$today = Get-Date -UFormat '%Y%m%d'
$patch_file = "$repo_name.$today.patch"
$home_only_file =@(
    '$env:USERPROFILE\utilities\GamingMode.bat'
    '$env:USERPROFILE\utilities\Mining.bat'
    '$env:USERPROFILE\utilities\MiningMode.bat'
    '$env:USERPROFILE\utilities\StopTrex.bat'
    '$env:USERPROFILE\utilities\StopTrex.ps1'
    '$env:USERPROFILE\utilities\dual-gminer-mining.bat'
    '$env:USERPROFILE\utilities\gminer-flux-mining.bat'
    '$env:USERPROFILE\utilities\gminer-mining.bat'
    '$env:USERPROFILE\utilities\lolminer-mining.bat'
    '$env:USERPROFILE\utilities\miniz-flux-mining.bat'
    '$env:USERPROFILE\utilities\t-rex-mining.bat'
)
$work_powershell_profile = "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$home_powershell_profile = "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# utils
## fixencoding
function Invoke-FixEncoding() {
    # ps1ファイルをUTF-8 with BOMに変える
    $home_pwsh_config_path = "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $home_powershell_config_path = "OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $work_pwsh_config_path = "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    $work_powershell_config_path = "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    $taskfile_path = "tasks.ps1"

    $home_pwsh_config_file = Get-Content -Path $home_pwsh_config_path
    $home_powershell_config_file = Get-Content -Path $home_powershell_config_path
    $work_pwsh_config_file = Get-Content -Path $work_pwsh_config_path
    $work_powershell_config_file = Get-Content -Path $work_powershell_config_path
    $taskfile_file = Get-Content -Path $taskfile_path

    Set-Content -Path $home_pwsh_config_path -Value $home_pwsh_config_file -Encoding "utf8BOM"
    Set-Content -Path $home_powershell_config_path -Value $home_powershell_config_file -Encoding "utf8BOM"
    Set-Content -Path $work_pwsh_config_path -Value $work_pwsh_config_file -Encoding "utf8BOM"
    Set-Content -Path $work_powershell_config_path -Value $work_powershell_config_file -Encoding "utf8BOM"
    Set-Content -Path $taskfile_path -Value $taskfile_file -Encoding "utf8BOM"
}

# patch
## patch-branch
function Invoke-CreatePatchBranch() {
    git switch -c patch-$today
}

## switch-master
function Invoke-SwitchMaster() {
    git switch master
}

## diff-patch
function Invoke-DiffPatch() {
    param(
        [switch]$UseGpg
    )

    $TempMyOutputEncode=[System.Console]::OutputEncoding
    [System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

    if ($UseGpg) {
        Write-Output "THIS IS WIP!"
        #git diff origin/master | Out-File -Encoding default -FilePath $patch_file
    } else {
        git diff origin/master | Out-File -Encoding default -FilePath $patch_file
    }

    [System.Console]::OutputEncoding=$TempMyOutputEncode
}

## clean
function Invoke-FileClean() {
    Remove-Item *.patch
    Remove-Item *.patch.gpg
    Remove-Item *.zip

    if ($env:COMPUTERNAME -eq "TANAKAPC") {
        $home_only_file |
            ForEach-Object {
                if (Test-Path $_) {
                    Remove-Item $_
                }
            }
    }
}

## copy2win-patch
function Invoke-Copy2WinPatch() {
    param(
        [switch]$UseGpg
    )

    $TempMyOutputEncode=[System.Console]::OutputEncoding
    [System.Console]::OutputEncoding=[System.Text.Encoding]::UTF8

    if ($UseGpg) {
        Copy-Item -Path .\*.patch.gpg -Destination $env:USERPROFILE\Downloads
    } else {
        Copy-Item -Path .\*.patch -Destination $env:USERPROFILE\Downloads
    }

    [System.Console]::OutputEncoding=$TempMyOutputEncode
}

## patch
function Invoke-CreatePatch() {
    param(
        [switch]$UseGpg
    )

    Invoke-FileClean
    if ($UseGpg) {
        Invoke-DiffPatch -UseGpg
        Invoke-Copy2WinPatch -UseGpg
    } else {
        Invoke-DiffPatch
        Invoke-Copy2WinPatch
    }
}

## delete-branch
function Invoke-DeletePatchBranch() {
    Invoke-FileClean
    Invoke-SwitchMaster
    git branch --list "patch*" | ForEach-Object{ $_ -replace " ", "" } | ForEach-Object { git branch -D $_ }
}

## update
function Invoke-FileUpdate() {
    Invoke-FileClean
    # Update

    # contour
    chezmoi add $env:USERPROFILE\AppData\Local\contour\contour.yml

    # GitHub CLI config
    chezmoi add "$env:USERPROFILE\AppData\Roaming\GitHub CLI\config.yml"
    chezmoi add "$env:USERPROFILE\AppData\Roaming\GitHub CLI\hosts.yml"

    # Hyper config
    chezmoi add $env:USERPROFILE\AppData\Roaming\Hyper\config.json
    chezmoi add $env:USERPROFILE\AppData\Roaming\Hyper\.hyper.js

    if ($env:COMPUTERNAME -ne "TANAKAPC") {
        # SKKFEP
        chezmoi add $env:USERPROFILE\AppData\Roaming\SKKFEP\skkuser.txt

        # CorvusSKK
        chezmoi add $env:USERPROFILE\AppData\Roaming\CorvusSKK\userdict.txt
    }


    # alacritty
    chezmoi add $env:USERPROFILE\AppData\Roaming\alacritty\alacritty.yml

    # lsd
    chezmoi add $env:USERPROFILE\AppData\Roaming\lsd\config.yaml

    # pueue
    chezmoi add $env:USERPROFILE\AppData\Roaming\pueue\pueue.yml

    # PowerShell config
    if ($env:COMPUTERNAME -ne "TANAKAPC") {
        chezmoi add $env:USERPROFILE\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
        #chezmoi add $env:USERPROFILE\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
    } else {
        #chezmoi add $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
        #chezmoi add $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
    }

    # komorebi files
    chezmoi add $env:USERPROFILE\applications.yaml
    chezmoi add $env:USERPROFILE\komorebi.json

    # whkd config
    chezmoi add $env:USERPROFILE\.config\whkdrc

    # cargo package list
    #chezmoi add $env:USERPROFILE\cargo_packages.txt

    # starship config
    #chezmoi add $env:USERPROFILE\.config\starship.toml

    # wezterm config
    chezmoi add $env:USERPROFILE\.config\wezterm\wezterm.lua

    # gitignore_global
    chezmoi add $env:USERPROFILE\.gitignore_global

    # ssh config
    #chezmoi add $env:USERPROFILE\.ssh\config

    # doskey config
    chezmoi add $env:USERPROFILE\macros.txt

    # utilities
    chezmoi add $env:USERPROFILE\utilities\Reboot.bat
    chezmoi add $env:USERPROFILE\utilities\RebootUbuntu.bat
    chezmoi add $env:USERPROFILE\utilities\Shutdown.bat
    chezmoi add $env:USERPROFILE\utilities\Ter.bat
    chezmoi add $env:USERPROFILE\utilities\capslock2ctrl.reg
    chezmoi add $env:USERPROFILE\utilities\install_cargo_packages.ps1
    chezmoi add $env:USERPROFILE\utilities\port_forwarding.ps1

    if ($env:COMPUTERNAME -ne "TANAKAPC") {
        $home_only_file |
            ForEach-Object {
                if (Test-Path $_) {
                    chezmoi add $_
                }
            }
    }

    Invoke-FixEncoding
}

## sync-conf
function Invoke-SyncConf() {
    param(
        [switch]$Sync
    )
    if (!$Sync) {
        Write-Output "-Sync をつけて実行してください"
        return
    }
    # 家と会社で動作を分ける
    if ($env:COMPUTERNAME -ne "TANAKAPC") {
        # 家の場合
        Write-Output "家の場合の処理"
        Copy-Item -Path $home_powershell_profile -Destination "./OneDrive/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
        Copy-Item -Path $home_powershell_profile -Destination "./Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
        Copy-Item -Path $home_powershell_profile -Destination "./Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
    } else {
        # 会社の場合
        Write-Output "会社の場合の処理"
        Copy-Item -Path $work_powershell_profile -Destination "./Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
        Copy-Item -Path $work_powershell_profile -Destination "./OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
        Copy-Item -Path $work_powershell_profile -Destination "./OneDrive/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
    }
}

## apply-patch
function Invoke-ApplyPatch() {
    Write-Output "Open git-bash"
    Write-Output "Run: patch -p1 < $windl\path_to.patch"
    git-bash
}

## lint
function Invoke-Lint() {
    Invoke-StyluaLint
    Invoke-PwshTest
    Invoke-Textlint
    Invoke-TypoCheck
}

## stylua-lint
function Invoke-StyluaLint() {
    Write-Output "Run stylua check"
    stylua --check .\
}

## pwsh-test
function Invoke-PwshTest() {
    Write-Output "Run PSSA"
    Get-ChildItem -Recurse |
        Where-Object {
            $_.Name -match "\.ps1$" -and
            $_.FullName -notmatch "\\node_modules\\"
        } |
        ForEach-Object {
            Write-Output $_.FullName
            Invoke-ScriptAnalyzer $_.FullName
        }
}

## textlint
function Invoke-Textlint() {
    Write-Output "Run textlint"
    pnpm run lint
}

## typo-check
function Invoke-TypoCheck() {
    Write-Output "Run typo check"
    typos .\
}

## format
function Invoke-CodeFormat() {
    Invoke-StyluaFormat
}

## stylua-format
function Invoke-StyluaFormat() {
    Write-Output "Run stylua format"
    stylua .\
}

# alias
Set-Alias -Name pab -Value Invoke-CreatePatchBranch
Set-Alias -Name clean -Value Invoke-FileClean
Set-Alias -Name update -Value Invoke-FileUpdate
Set-Alias -Name deleb -Value Invoke-DeletePatchBranch
Set-Alias -Name patch -Value Invoke-CreatePatch
Set-Alias -Name cpatch -Value Invoke-CreatePatch
Set-Alias -Name apatch -Value Invoke-ApplyPatch
Set-Alias -Name test -Value Invoke-Lint
Set-Alias -Name fmt -Value Invoke-CodeFormat
Set-Alias -Name syncconf -Value Invoke-SyncConf
