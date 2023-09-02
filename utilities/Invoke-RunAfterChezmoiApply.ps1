# Run after chezmoi apply
function Invoke-RunAfterChezmoiApply() {
    Write-Output "post-apply-hook"
}

Invoke-RunAfterChezmoiApply
