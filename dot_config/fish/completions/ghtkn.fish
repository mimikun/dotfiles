# ghtkn fish shell completion

function __fish_ghtkn_no_subcommand --description 'Test if there has been any subcommand yet'
    for i in (commandline -opc)
        if contains -- $i init git-credential get version help-all help h completion
            return 1
        end
    end
    return 0
end

complete -c ghtkn -n '__fish_ghtkn_no_subcommand' -f -l log-level -r -d 'Log level (debug, info, warn, error)'
complete -c ghtkn -n '__fish_ghtkn_no_subcommand' -f -l config -s c -r -d 'configuration file path'
complete -c ghtkn -n '__fish_ghtkn_no_subcommand' -f -l help -s h -d 'show help'
complete -c ghtkn -n '__fish_ghtkn_no_subcommand' -f -l version -s v -d 'print the version'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'init' -d 'Create ghtkn.yaml if it doesn\'t exist'
complete -c ghtkn -n '__fish_seen_subcommand_from init' -f -l log-level -r -d 'Log level (debug, info, warn, error)'
complete -c ghtkn -n '__fish_seen_subcommand_from init' -f -l config -s c -r -d 'configuration file path'
complete -c ghtkn -n '__fish_seen_subcommand_from init' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from init; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'git-credential' -d 'Git Credential Helper'
complete -c ghtkn -n '__fish_seen_subcommand_from git-credential' -f -l log-level -r -d 'Log level (debug, info, warn, error)'
complete -c ghtkn -n '__fish_seen_subcommand_from git-credential' -f -l config -s c -r -d 'configuration file path'
complete -c ghtkn -n '__fish_seen_subcommand_from git-credential' -f -l min-expiration -s m -r -d 'minimum expiration duration (e.g. 1h, 30m, 30s)'
complete -c ghtkn -n '__fish_seen_subcommand_from git-credential' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from git-credential; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'get' -d 'Output a GitHub App User Access Token to stdout'
complete -c ghtkn -n '__fish_seen_subcommand_from get' -f -l log-level -r -d 'Log level (debug, info, warn, error)'
complete -c ghtkn -n '__fish_seen_subcommand_from get' -f -l config -s c -r -d 'configuration file path'
complete -c ghtkn -n '__fish_seen_subcommand_from get' -f -l format -s f -r -d 'output format (json)'
complete -c ghtkn -n '__fish_seen_subcommand_from get' -f -l min-expiration -s m -r -d 'minimum expiration duration (e.g. 1h, 30m, 30s)'
complete -c ghtkn -n '__fish_seen_subcommand_from get' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from get; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'version' -d 'Show version'
complete -c ghtkn -n '__fish_seen_subcommand_from version' -f -l json -s j -d 'Output version in JSON format'
complete -c ghtkn -n '__fish_seen_subcommand_from version' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from version; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -c ghtkn -n '__fish_seen_subcommand_from help-all' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from help-all; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c ghtkn -n '__fish_ghtkn_no_subcommand' -a 'completion' -d 'Output shell completion script for bash, zsh, fish, or Powershell'
complete -c ghtkn -n '__fish_seen_subcommand_from completion' -f -l help -s h -d 'show help'
complete -x -c ghtkn -n '__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
