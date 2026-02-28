# NVIDIA GPU クロック固定タスク登録スクリプト

システム起動時に `nvidia-smi` を実行し、GPU クロックを固定することで消費電力を削減する
Windows タスクスケジューラのタスクを登録する PowerShell スクリプト。

## 概要

| 項目 | 内容 |
|------|------|
| スクリプト | `register-nvidia-smi-power-saving.ps1` |
| タスク名 | `nvidia-smi power saving` |
| 実行タイミング | システム起動時 |
| 実行コマンド | `nvidia-smi -lgc 180,3090` |

`-lgc 180,3090` は GPU クロックの下限を 180MHz、上限を 3090MHz に固定するオプション。

## 要件

- Windows 8 / Windows Server 2012 以降
- NVIDIA GPU ドライバ（`nvidia-smi.exe` が `C:\Windows\System32\` に存在すること）
- PowerShell（管理者権限）

## 使い方

PowerShell を**管理者権限**で開き、以下を実行する:

```powershell
.\register-nvidia-smi-power-saving.ps1
```

実行確認なしに登録したい場合は `-Confirm:$false` を付ける:

```powershell
.\register-nvidia-smi-power-saving.ps1 -Confirm:$false
```

## 使用コマンドレット

`ScheduledTasks` モジュール（Windows 組み込み）を使用している。

| コマンドレット | 役割 |
|----------------|------|
| `New-ScheduledTaskAction` | 実行するコマンドとオプションを定義 |
| `New-ScheduledTaskTrigger` | 起動タイミング（ブート時）を定義 |
| `New-ScheduledTaskPrincipal` | 実行ユーザーと権限レベルを定義 |
| `New-ScheduledTaskSettingsSet` | タスクの詳細設定を定義 |
| `Register-ScheduledTask` | タスクをスケジューラに登録 |

