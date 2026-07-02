# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_sharedserver_global_optspecs
    string join \n h/help V/version
end

function __fish_sharedserver_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_sharedserver_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_sharedserver_using_subcommand
    set -l cmd (__fish_sharedserver_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c sharedserver -n "__fish_sharedserver_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -s V -l version -d 'Print version'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "use" -d 'Use a server (start if not running, then attach)'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "unuse" -d 'Detach from a server (decrement reference count)'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "list" -d 'List all servers'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "info" -d 'Get detailed server information'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "check" -d 'Check server status'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "completion" -d 'Generate shell completion scripts'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "admin" -d 'Administrative commands for low-level server operations'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -l grace-period -d 'Grace period before shutdown when refcount reaches 0 (e.g., "5m", "1h", "30s")' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -l metadata -d 'Optional client metadata' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -l pid -d 'Client PID (defaults to parent process - the caller)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -l env -d 'Environment variables in KEY=VALUE format (can be specified multiple times)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -l log-file -d 'Optional log file path for server stdout/stderr' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand use" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand unuse" -l pid -d 'Client PID (defaults to parent process - the caller)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand unuse" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand list" -l json -d 'Output as JSON (for programmatic use)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand list" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand info" -l json -d 'Output as JSON (for programmatic use)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand info" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand check" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand completion" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "start" -d 'Start a new server with NO clients (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "stop" -d 'Stop a server: SIGTERM, then wait for the watcher to tear it down'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "incref" -d 'Increment reference count (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "decref" -d 'Decrement reference count (low-level - use \'sharedserver unuse\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "debug" -d 'Show invocation log for debugging'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "doctor" -d 'Validate server state and clean up inconsistencies'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "kill" -d 'Force kill a server and clean up all state'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and not __fish_seen_subcommand_from start stop incref decref debug doctor kill help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from start" -l grace-period -d 'Grace period before shutdown when refcount reaches 0 (e.g., "5m", "1h", "30s")' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from start" -l env -d 'Environment variables in KEY=VALUE format (can be specified multiple times)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from start" -l log-file -d 'Optional log file path for server stdout/stderr' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from stop" -l timeout -d 'How long to wait for teardown to converge (e.g. "10s", "1m", "500ms")' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from stop" -l force -d 'Escalate to SIGKILL if the server doesn\'t stop within the timeout'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from incref" -l metadata -d 'Optional client metadata' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from incref" -l pid -d 'Client PID this reference represents (required - must be a real, long-lived process; the watcher drops the ref when it dies)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from incref" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from decref" -l pid -d 'Client PID whose reference to release (required)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from decref" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from debug" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from doctor" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from kill" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start a new server with NO clients (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop a server: SIGTERM, then wait for the watcher to tear it down'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "incref" -d 'Increment reference count (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "decref" -d 'Decrement reference count (low-level - use \'sharedserver unuse\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "debug" -d 'Show invocation log for debugging'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "doctor" -d 'Validate server state and clean up inconsistencies'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "kill" -d 'Force kill a server and clean up all state'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "use" -d 'Use a server (start if not running, then attach)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "unuse" -d 'Detach from a server (decrement reference count)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "list" -d 'List all servers'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "info" -d 'Get detailed server information'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "check" -d 'Check server status'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "completion" -d 'Generate shell completion scripts'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "admin" -d 'Administrative commands for low-level server operations'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse list info check completion admin help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "start" -d 'Start a new server with NO clients (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "stop" -d 'Stop a server: SIGTERM, then wait for the watcher to tear it down'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "incref" -d 'Increment reference count (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "decref" -d 'Decrement reference count (low-level - use \'sharedserver unuse\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "debug" -d 'Show invocation log for debugging'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "doctor" -d 'Validate server state and clean up inconsistencies'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "kill" -d 'Force kill a server and clean up all state'
