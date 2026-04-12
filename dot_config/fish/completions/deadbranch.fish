# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_deadbranch_global_optspecs
	string join \n h/help V/version
end

function __fish_deadbranch_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_deadbranch_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_deadbranch_using_subcommand
	set -l cmd (__fish_deadbranch_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c deadbranch -n "__fish_deadbranch_needs_command" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "list" -d 'List stale branches'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "clean" -d 'Delete stale branches (merged only by default, use --force for unmerged)'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "config" -d 'Manage configuration'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "backup" -d 'Manage backups'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "stats" -d 'Show repository branch statistics'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "completions" -d 'Generate shell completion scripts'
complete -c deadbranch -n "__fish_deadbranch_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -s d -l days -d 'Only show branches older than N days (default: from config or 30)' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -l local -d 'Only show local branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -l remote -d 'Only show remote branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -l merged -d 'Only show merged branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand list" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -s d -l days -d 'Only delete branches older than N days (default: from config or 30)' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -l merged -d 'Only delete merged branches (this is the default behavior)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -l force -d 'Force delete unmerged branches (dangerous!)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -l dry-run -d 'Show what would be deleted without doing it'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -l local -d 'Only delete local branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -l remote -d 'Only delete remote branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -s y -l yes -d 'Skip confirmation prompts (useful for scripts)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -s i -l interactive -d 'Open interactive TUI for branch selection'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand clean" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -f -a "set" -d 'Set a configuration value'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -f -a "show" -d 'Show current configuration'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -f -a "edit" -d 'Open config file in $EDITOR'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -f -a "reset" -d 'Reset configuration to defaults'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and not __fish_seen_subcommand_from set show edit reset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from show" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from edit" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from reset" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a configuration value'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show current configuration'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Open config file in $EDITOR'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "reset" -d 'Reset configuration to defaults'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -f -a "list" -d 'List available backups'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -f -a "restore" -d 'Restore a branch from backup'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -f -a "stats" -d 'Show backup storage statistics'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -f -a "clean" -d 'Remove old backups, keeping the most recent ones'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and not __fish_seen_subcommand_from list restore stats clean help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from list" -l repo -d 'Show backups for a specific repository by name' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from list" -l current -d 'Only show backups for current repository'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from restore" -l from -d 'Restore from a specific backup file (defaults to most recent)' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from restore" -l as -d 'Restore with a different branch name' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from restore" -l force -d 'Overwrite existing branch if it exists'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from restore" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from stats" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from stats" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -l repo -d 'Clean backups for a specific repository by name' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -l keep -d 'Number of most recent backups to keep (default: 10)' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -l current -d 'Clean backups for current repository'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -l dry-run -d 'Show what would be deleted without doing it'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -s y -l yes -d 'Skip confirmation prompt'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from clean" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available backups'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from help" -f -a "restore" -d 'Restore a branch from backup'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from help" -f -a "stats" -d 'Show backup storage statistics'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from help" -f -a "clean" -d 'Remove old backups, keeping the most recent ones'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand backup; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand stats" -s d -l days -d 'Treat branches older than N days as stale (default: from config or 30)' -r
complete -c deadbranch -n "__fish_deadbranch_using_subcommand stats" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand stats" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand completions" -s h -l help -d 'Print help'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand completions" -s V -l version -d 'Print version'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "list" -d 'List stale branches'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "clean" -d 'Delete stale branches (merged only by default, use --force for unmerged)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "config" -d 'Manage configuration'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "backup" -d 'Manage backups'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "stats" -d 'Show repository branch statistics'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "completions" -d 'Generate shell completion scripts'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and not __fish_seen_subcommand_from list clean config backup stats completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Set a configuration value'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Show current configuration'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "edit" -d 'Open config file in $EDITOR'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "reset" -d 'Reset configuration to defaults'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from backup" -f -a "list" -d 'List available backups'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from backup" -f -a "restore" -d 'Restore a branch from backup'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from backup" -f -a "stats" -d 'Show backup storage statistics'
complete -c deadbranch -n "__fish_deadbranch_using_subcommand help; and __fish_seen_subcommand_from backup" -f -a "clean" -d 'Remove old backups, keeping the most recent ones'
