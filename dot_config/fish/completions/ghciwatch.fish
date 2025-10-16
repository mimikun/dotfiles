complete -c ghciwatch -l command -d 'A shell command which starts a GHCi REPL, e.g. `ghci` or `cabal v2-repl` or similar' -r
complete -c ghciwatch -l error-file -d 'A file to write compilation errors to' -r
complete -c ghciwatch -l completions -d 'Generate shell completions for the given shell' -r -f -a "{bash	'',elvish	'',fish	'',powershell	'',zsh	''}"
complete -c ghciwatch -l test-ghci -d '`ghci` commands to run tests' -r
complete -c ghciwatch -l test-shell -d 'Shell commands to run tests' -r
complete -c ghciwatch -l before-startup-shell -d 'Shell commands to run before startup' -r
complete -c ghciwatch -l after-startup-ghci -d '`ghci` commands to run after startup' -r
complete -c ghciwatch -l after-startup-shell -d 'Shell commands to run after startup' -r
complete -c ghciwatch -l before-reload-ghci -d '`ghci` commands to run before reload' -r
complete -c ghciwatch -l before-reload-shell -d 'Shell commands to run before reload' -r
complete -c ghciwatch -l after-reload-ghci -d '`ghci` commands to run after reload' -r
complete -c ghciwatch -l after-reload-shell -d 'Shell commands to run after reload' -r
complete -c ghciwatch -l before-restart-ghci -d '`ghci` commands to run before restart' -r
complete -c ghciwatch -l before-restart-shell -d 'Shell commands to run before restart' -r
complete -c ghciwatch -l after-restart-ghci -d '`ghci` commands to run after restart' -r
complete -c ghciwatch -l after-restart-shell -d 'Shell commands to run after restart' -r
complete -c ghciwatch -l poll -d 'Use polling with the given interval rather than notification-based file watching' -r
complete -c ghciwatch -l debounce -d 'Debounce file events; wait this duration after receiving an event before attempting to reload' -r
complete -c ghciwatch -l watch -d 'A path to watch for changes' -r
complete -c ghciwatch -l reload-glob -d 'Reload the GHCi session when paths matching this glob change' -r
complete -c ghciwatch -l restart-glob -d 'Restart the GHCi session when paths matching this glob change' -r
complete -c ghciwatch -l log-filter -d 'Log message filter' -r
complete -c ghciwatch -l backtrace -d 'How to display backtraces in error messages' -r -f -a "{0	'Hide backtraces in errors',1	'Display backtraces in errors',full	'Display backtraces with all stack frames in errors'}"
complete -c ghciwatch -l trace-spans -d 'When to log span events, which loosely correspond to tasks being run in the async runtime' -r -f -a "{new	'Log when spans are created',enter	'Log when spans are entered',exit	'Log when spans are exited',close	'Log when spans are dropped',none	'Do not log span events',active	'Log when spans are entered/exited',full	'Log all span events'}"
complete -c ghciwatch -l log-json -d 'Path to write JSON logs to' -r
complete -c ghciwatch -l enable-eval -d 'Evaluate Haskell code in comments'
complete -c ghciwatch -l clear -d 'Clear the screen before reloads and restarts'
complete -c ghciwatch -l no-interrupt-reloads -d 'Don\'t interrupt reloads when files change'
complete -c ghciwatch -l tui -d 'Enable TUI mode (experimental)'
complete -c ghciwatch -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ghciwatch -s V -l version -d 'Print version'
