# try-rs integration for PowerShell
function try-rs {
    # Captures the output of the binary (stdout) which is the "cd" or editor command
    # The TUI is rendered on stderr, so it doesn't interfere.
    $command = (try-rs.exe @args)

    if ($command) {
        Invoke-Expression $command
    }
}