complete -c sheldon -n "__fish_use_subcommand" -l color -d 'Output coloring: always, auto, or never' -r
complete -c sheldon -n "__fish_use_subcommand" -l config-dir -d 'The configuration directory' -r -F
complete -c sheldon -n "__fish_use_subcommand" -l data-dir -d 'The data directory' -r -F
complete -c sheldon -n "__fish_use_subcommand" -l config-file -d 'The config file' -r -F
complete -c sheldon -n "__fish_use_subcommand" -l profile -d 'The profile used for conditional plugins' -r
complete -c sheldon -n "__fish_use_subcommand" -s q -l quiet -d 'Suppress any informational output'
complete -c sheldon -n "__fish_use_subcommand" -l non-interactive -d 'Suppress any interactive prompts and assume "yes" as the answer'
complete -c sheldon -n "__fish_use_subcommand" -s v -l verbose -d 'Use verbose output'
complete -c sheldon -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c sheldon -n "__fish_use_subcommand" -f -a "init" -d 'Initialize a new config file'
complete -c sheldon -n "__fish_use_subcommand" -f -a "add" -d 'Add a new plugin to the config file'
complete -c sheldon -n "__fish_use_subcommand" -f -a "edit" -d 'Open up the config file in the default editor'
complete -c sheldon -n "__fish_use_subcommand" -f -a "remove" -d 'Remove a plugin from the config file'
complete -c sheldon -n "__fish_use_subcommand" -f -a "lock" -d 'Install the plugins sources and generate the lock file'
complete -c sheldon -n "__fish_use_subcommand" -f -a "source" -d 'Generate and print out the script'
complete -c sheldon -n "__fish_use_subcommand" -f -a "completions" -d 'Generate completions for the given shell'
complete -c sheldon -n "__fish_use_subcommand" -f -a "version" -d 'Prints detailed version information'
complete -c sheldon -n "__fish_seen_subcommand_from init" -l shell -d 'The type of shell, accepted values are: bash, fish, zsh' -r
complete -c sheldon -n "__fish_seen_subcommand_from init" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from add" -l git -d 'Add a clonable Git repository' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l gist -d 'Add a clonable Gist snippet' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l github -d 'Add a clonable GitHub repository' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l remote -d 'Add a downloadable file' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l local -d 'Add a local directory' -r -F
complete -c sheldon -n "__fish_seen_subcommand_from add" -l proto -d 'The Git protocol for a Gist or GitHub plugin' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l branch -d 'Checkout the tip of a branch' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l rev -d 'Checkout a specific commit' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l tag -d 'Checkout a specific tag' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l dir -d 'Which sub directory to use in this plugin' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l use -d 'Which files to use in this plugin' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l apply -d 'Templates to apply to this plugin' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l profiles -d 'Only use this plugin under one of the given profiles' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -l hooks -d 'Hooks executed during template evaluation' -r
complete -c sheldon -n "__fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from lock" -l update -d 'Update all plugin sources'
complete -c sheldon -n "__fish_seen_subcommand_from lock" -l reinstall -d 'Reinstall all plugin sources'
complete -c sheldon -n "__fish_seen_subcommand_from lock" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from source" -l relock -d 'Regenerate the lock file'
complete -c sheldon -n "__fish_seen_subcommand_from source" -l update -d 'Update all plugin sources (implies --relock)'
complete -c sheldon -n "__fish_seen_subcommand_from source" -l reinstall -d 'Reinstall all plugin sources (implies --relock)'
complete -c sheldon -n "__fish_seen_subcommand_from source" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from completions" -l shell -d 'The type of shell, accepted values are: bash, zsh' -r
complete -c sheldon -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_seen_subcommand_from version" -s h -l help -d 'Print help'
