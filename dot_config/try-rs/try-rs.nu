def --wrapped try-rs [...args] {
    # Capture output. Stderr (TUI) goes directly to terminal.
    let output = (try-rs.exe ...$args)

    if ($output | is-not-empty) {

        # Grabs the path out of stdout returned by the binary and removes the single quotes
        let $path = ($output | split row ' ').1 | str replace --all "\'" ''
        cd $path
    }
}
