#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Register a scheduled task to lock NVIDIA GPU clocks for power saving.

.DESCRIPTION
    This script registers a Windows Task Scheduler task that runs nvidia-smi
    at system startup to lock the GPU clock speed between 180MHz and 3090MHz,
    reducing power consumption.

    Uses the ScheduledTasks PowerShell module (built-in since Windows 8/Server 2012)
    instead of a hardcoded XML export, making it portable across machines and users.

.EXAMPLE
    .\register-nvidia-smi-power-saving.ps1

.NOTES
    Requires Administrator privileges.
    Requires NVIDIA GPU with nvidia-smi.exe installed.
#>

[CmdletBinding(SupportsShouldProcess)]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# --- Constants ---
$TaskName        = 'nvidia-smi power saving'
$NvidiaSmiPath   = 'C:\Windows\System32\nvidia-smi.exe'
$NvidiaSmiArgs   = '-lgc 180,3090'
$TaskDescription = 'Lock GPU clocks to minimum 180MHz and maximum 3090MHz for power saving at system startup.'

# --- Validate nvidia-smi exists ---
if (-not (Test-Path -LiteralPath $NvidiaSmiPath)) {
    Write-Error "nvidia-smi.exe not found at '$NvidiaSmiPath'. Please ensure NVIDIA drivers are installed."
    exit 1
}

# --- Build task components ---

# Action: run nvidia-smi with clock lock arguments
$action = New-ScheduledTaskAction `
    -Execute  $NvidiaSmiPath `
    -Argument $NvidiaSmiArgs

# Trigger: run at every system startup
$trigger = New-ScheduledTaskTrigger -AtStartup

# Principal: run as the current user, elevated, without storing a password (S4U)
# S4U (Service For User) logon type allows the task to run even when the user
# is not interactively logged in, without requiring password storage.
$principal = New-ScheduledTaskPrincipal `
    -UserId   "$env:USERDOMAIN\$env:USERNAME" `
    -LogonType S4U `
    -RunLevel  Highest

# Settings: mirror the original XML settings
$settings = New-ScheduledTaskSettingsSet `
    -MultipleInstances    IgnoreNew `
    -DisallowStartIfOnBatteries `
    -StopIfGoingOnBatteries `
    -AllowHardTerminate `
    -StartWhenAvailable `
    -ExecutionTimeLimit   (New-TimeSpan -Hours 1) `
    -Priority             7

# --- Register the task ---
if ($PSCmdlet.ShouldProcess($TaskName, 'Register-ScheduledTask')) {
    Register-ScheduledTask `
        -TaskName   $TaskName `
        -Action     $action `
        -Trigger    $trigger `
        -Principal  $principal `
        -Settings   $settings `
        -Description $TaskDescription `
        -Force

    Write-Host "Task '$TaskName' registered successfully." -ForegroundColor Green
}
