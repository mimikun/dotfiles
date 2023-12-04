# Run before chezmoi apply

function Invoke-RunBeforeChezmoiApply() {
    Write-Output "pre-apply-hook"
    # TODO:
    # set $env:BW_SESSION
    # Copy config file from Linux
}

Invoke-RunBeforeChezmoiApply
