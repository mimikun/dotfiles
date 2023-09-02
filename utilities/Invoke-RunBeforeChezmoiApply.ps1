# Run before chezmoi apply

function Invoke-RunBeforeChezmoiApply() {
    Write-Output "pre-apply-hook"
    # TODO: set $env:BW_SESSION
}

Invoke-RunBeforeChezmoiApply
