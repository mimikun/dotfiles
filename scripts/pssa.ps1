Get-ChildItem -Recurse |
    Where-Object {
        $_.Name -match "\.ps1$" -and
        $_.FullName -notmatch "\\node_modules\\"
    } |
    ForEach-Object {
        Write-Output $_.FullName
        Invoke-ScriptAnalyzer -Severity Warning $_.FullName
    }
