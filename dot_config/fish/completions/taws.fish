# Fish completion for taws

# Disable file completion by default
complete -c taws -f

# Dynamic profile completion
complete -c taws -n "__fish_seen_subcommand_from -p --profile" -xa "(taws list-profiles 2>/dev/null)"
complete -c taws -s p -l profile -d 'AWS profile to use' -xa "(taws list-profiles 2>/dev/null)"

# Dynamic region completion  
complete -c taws -n "__fish_seen_subcommand_from -r --region" -xa "(taws list-regions 2>/dev/null)"
complete -c taws -s r -l region -d 'AWS region to use' -xa "(taws list-regions 2>/dev/null)"

# Log level completion
complete -c taws -l log-level -d 'Log level for debugging' -xa "off error warn info debug trace"

# Other options
complete -c taws -l readonly -d 'Run in read-only mode'
complete -c taws -l endpoint-url -d 'Custom AWS endpoint URL'
complete -c taws -s h -l help -d 'Print help'
complete -c taws -s V -l version -d 'Print version'

# Subcommands
complete -c taws -n "__fish_use_subcommand" -a "completion" -d 'Generate shell completion scripts'
complete -c taws -n "__fish_use_subcommand" -a "help" -d 'Print help for subcommand(s)'

# Completion subcommand
complete -c taws -n "__fish_seen_subcommand_from completion" -xa "bash zsh fish powershell elvish"
