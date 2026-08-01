#!/usr/bin/env pwsh
# Lint every PowerShell script in the repository with PSScriptAnalyzer.
# Exits non-zero when any diagnostic is reported, so lint failures break the task.

if (-not (Get-Module -ListAvailable -Name PSScriptAnalyzer)) {
    Write-Output 'PSScriptAnalyzer is not installed.'
    Write-Output 'Install it with: Install-Module -Name PSScriptAnalyzer -Scope CurrentUser'
    exit 1
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$settings = Join-Path $repoRoot 'PSScriptAnalyzerSettings.psd1'

$results = Get-ChildItem -Path $repoRoot -Recurse -File -Filter '*.ps1' |
    Where-Object { $_.FullName -notmatch '[\\/]node_modules[\\/]' } |
    ForEach-Object {
        Invoke-ScriptAnalyzer -Path $_.FullName -Severity Warning -Settings $settings
    }

if ($results) {
    $results |
        Format-Table -AutoSize RuleName, Severity, ScriptName, Line, Message |
        Out-String -Width 200 |
        Write-Output
    exit 1
}

Write-Output 'PSScriptAnalyzer: no issues found.'
