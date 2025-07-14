# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pez_global_optspecs
	string join \n h/help V/version
end

function __fish_pez_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pez_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pez_using_subcommand
	set -l cmd (__fish_pez_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pez -n "__fish_pez_needs_command" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_needs_command" -s V -l version -d 'Print version'
complete -c pez -n "__fish_pez_needs_command" -f -a "init" -d 'Initialize pez'
complete -c pez -n "__fish_pez_needs_command" -f -a "install" -d 'Install fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "uninstall" -d 'Uninstall fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "upgrade" -d 'Upgrade installed fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "list" -d 'List installed fish plugins'
complete -c pez -n "__fish_pez_needs_command" -f -a "prune" -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_needs_command" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pez -n "__fish_pez_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pez -n "__fish_pez_using_subcommand init" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand install" -s f -l force -d 'Force install even if the plugin is already installed'
complete -c pez -n "__fish_pez_using_subcommand install" -s p -l prune -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_using_subcommand install" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -s f -l force -d 'Force uninstall even if the plugin data directory does not exist'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand list" -l format -d 'List format' -r -f -a "table\t''"
complete -c pez -n "__fish_pez_using_subcommand list" -l outdated -d 'Show only outdated plugins'
complete -c pez -n "__fish_pez_using_subcommand list" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand prune" -s f -l force -d 'Force prune even if the plugin data directory does not exist'
complete -c pez -n "__fish_pez_using_subcommand prune" -l dry-run -d 'Dry run without actually removing any files'
complete -c pez -n "__fish_pez_using_subcommand prune" -s y -l yes -d 'Confirm all prompts'
complete -c pez -n "__fish_pez_using_subcommand prune" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand completions" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "init" -d 'Initialize pez'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "install" -d 'Install fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "uninstall" -d 'Uninstall fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "upgrade" -d 'Upgrade installed fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "list" -d 'List installed fish plugins'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "prune" -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
