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
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "up" -d 'Bring up every server in a profile, resolving each def from the config'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "down" -d 'Release every server in a profile (the inverse of `up`)'
complete -c sharedserver -n "__fish_sharedserver_needs_command" -f -a "config" -d 'Edit or inspect the servers.json config (the self-define surface): register/unregister scoped server defs and tag them into profiles'
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
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l profile -d 'Profile to bring up (typically your host: opencode, claude, pi, ...)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l pid -d 'Client PID this bring-up refs (defaults to parent process - the caller)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l grace-period -d 'Grace period for servers that don\'t set their own (e.g. "5m", "1h")' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l config -d 'Explicit config file, overriding the discovery chain' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l cwd -d 'Directory to resolve the per-project config from (defaults to cwd)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l profile-optional -d 'Treat a missing profile as normal (bring up only universal servers, no warning). Plugins asking for their own host profile pass this'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -l json -d 'Emit a single JSON object (profile, per-server outcome, warnings) and nothing else on stdout — for programmatic callers'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand up" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l profile -d 'Profile to release (must match the `up` that brought it up)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l pid -d 'Client PID whose refs to release (defaults to parent process)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l config -d 'Explicit config file, overriding the discovery chain' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l cwd -d 'Directory to resolve the per-project config from (defaults to cwd)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l profile-optional -d 'Treat a missing profile as normal (no warning); pair with `up`'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -l json -d 'Emit a single JSON object and nothing else on stdout'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand down" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "register" -d 'Register (or overwrite) a scoped server def; optionally tag it into profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "unregister" -d 'Remove a scope\'s server def(s): a specific name, or all of them'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "lookup" -d 'Look up one server: its def and the profiles it belongs to'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "list" -d 'List registered servers and profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "show" -d 'Print the whole config document'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "validate" -d 'Check for dangling profile members and structural issues'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "profile" -d 'Manage profile membership directly'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and not __fish_seen_subcommand_from register unregister lookup list show validate profile help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l scope -d 'Owning scope id (e.g. your plugin or host name)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l profile -d 'Profile(s) to add this server to (repeatable, union)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l grace-period -d 'Grace period, e.g. "30m", "1h"' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l env -d 'Env vars in KEY=VALUE form (repeatable)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l log-file -d 'Log file path for the server\'s stdout/stderr' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l metadata -d 'Optional metadata string' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l config -d 'Config file to edit (default: discovered, else the global one)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l if-absent -d 'Only register if the name doesn\'t already exist (still unions profiles)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -l lazy -d 'Attach-only (no command needed)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from register" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from unregister" -l scope -d 'Owning scope id' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from unregister" -l config -d 'Config file to edit (default: discovered, else the global one)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from unregister" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from lookup" -l config -d 'Config file (default: discovered)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from lookup" -l json -d 'Emit JSON'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from lookup" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from list" -l config -d 'Config file (default: discovered)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from list" -l json -d 'Emit JSON'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from show" -l config -d 'Config file (default: discovered)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from show" -l json -d 'Emit compact JSON'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from validate" -l config -d 'Config file (default: discovered)' -r
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from validate" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from profile" -s h -l help -d 'Print help'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from profile" -f -a "add" -d 'Add server(s) to a profile (union; a server need not exist yet)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from profile" -f -a "remove" -d 'Remove server(s) from a profile (drops the profile if it becomes empty)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from profile" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "register" -d 'Register (or overwrite) a scoped server def; optionally tag it into profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "unregister" -d 'Remove a scope\'s server def(s): a specific name, or all of them'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "lookup" -d 'Look up one server: its def and the profiles it belongs to'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "list" -d 'List registered servers and profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Print the whole config document'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "validate" -d 'Check for dangling profile members and structural issues'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "profile" -d 'Manage profile membership directly'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
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
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "use" -d 'Use a server (start if not running, then attach)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "unuse" -d 'Detach from a server (decrement reference count)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "up" -d 'Bring up every server in a profile, resolving each def from the config'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "down" -d 'Release every server in a profile (the inverse of `up`)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "config" -d 'Edit or inspect the servers.json config (the self-define surface): register/unregister scoped server defs and tag them into profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "list" -d 'List all servers'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "info" -d 'Get detailed server information'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "check" -d 'Check server status'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "completion" -d 'Generate shell completion scripts'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "admin" -d 'Administrative commands for low-level server operations'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and not __fish_seen_subcommand_from use unuse up down config list info check completion admin help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "register" -d 'Register (or overwrite) a scoped server def; optionally tag it into profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "unregister" -d 'Remove a scope\'s server def(s): a specific name, or all of them'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "lookup" -d 'Look up one server: its def and the profiles it belongs to'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "list" -d 'List registered servers and profiles'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Print the whole config document'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "validate" -d 'Check for dangling profile members and structural issues'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "profile" -d 'Manage profile membership directly'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "start" -d 'Start a new server with NO clients (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "stop" -d 'Stop a server: SIGTERM, then wait for the watcher to tear it down'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "incref" -d 'Increment reference count (low-level - use \'sharedserver use\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "decref" -d 'Decrement reference count (low-level - use \'sharedserver unuse\' instead)'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "debug" -d 'Show invocation log for debugging'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "doctor" -d 'Validate server state and clean up inconsistencies'
complete -c sharedserver -n "__fish_sharedserver_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "kill" -d 'Force kill a server and clean up all state'
