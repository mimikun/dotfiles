# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pez_global_optspecs
	string join \n v/verbose jobs= h/help V/version
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

complete -c pez -n "__fish_pez_needs_command" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_needs_command" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_needs_command" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_needs_command" -s V -l version -d 'Print version'
complete -c pez -n "__fish_pez_needs_command" -f -a "init" -d 'Initialize pez'
complete -c pez -n "__fish_pez_needs_command" -f -a "install" -d 'Install fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "uninstall" -d 'Uninstall fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "upgrade" -d 'Upgrade installed fish plugin(s)'
complete -c pez -n "__fish_pez_needs_command" -f -a "list" -d 'List installed fish plugins'
complete -c pez -n "__fish_pez_needs_command" -f -a "prune" -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_needs_command" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pez -n "__fish_pez_needs_command" -f -a "activate" -d 'Output shell activation code'
complete -c pez -n "__fish_pez_needs_command" -f -a "doctor" -d 'Diagnose common setup issues'
complete -c pez -n "__fish_pez_needs_command" -f -a "migrate" -d 'Migrate from fisher (reads fish_plugins)'
complete -c pez -n "__fish_pez_needs_command" -f -a "files" -d 'List installed files for plugins'
complete -c pez -n "__fish_pez_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pez -n "__fish_pez_using_subcommand init" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand init" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand init" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand install" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand install" -s f -l force -d 'Force install even if the plugin is already installed'
complete -c pez -n "__fish_pez_using_subcommand install" -s p -l prune -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_using_subcommand install" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand install" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand uninstall" -s f -l force -d 'Force uninstall even if the plugin data directory does not exist'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -l stdin -d 'Read plugin repos from stdin (one per line)'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand upgrade" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand upgrade" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand upgrade" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand list" -l format -d 'List format' -r -f -a "plain\t''
table\t''
json\t''"
complete -c pez -n "__fish_pez_using_subcommand list" -l filter -d 'Filter plugins by source kind' -r -f -a "all\t''
local\t''
remote\t''"
complete -c pez -n "__fish_pez_using_subcommand list" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand list" -l outdated -d 'Show only outdated plugins'
complete -c pez -n "__fish_pez_using_subcommand list" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand list" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand prune" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand prune" -s f -l force -d 'Force prune even if the plugin data directory does not exist'
complete -c pez -n "__fish_pez_using_subcommand prune" -l dry-run -d 'Dry run without actually removing any files'
complete -c pez -n "__fish_pez_using_subcommand prune" -s y -l yes -d 'Confirm all prompts'
complete -c pez -n "__fish_pez_using_subcommand prune" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand prune" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand completions" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand completions" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand completions" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand activate" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand activate" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand activate" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand doctor" -l format -d 'Output format' -r -f -a "json\t''"
complete -c pez -n "__fish_pez_using_subcommand doctor" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand doctor" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand doctor" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand migrate" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand migrate" -l dry-run -d 'Do not write files; print planned changes'
complete -c pez -n "__fish_pez_using_subcommand migrate" -l force -d 'Overwrite existing pez.toml plugin list instead of merging'
complete -c pez -n "__fish_pez_using_subcommand migrate" -l install -d 'Immediately install migrated plugins'
complete -c pez -n "__fish_pez_using_subcommand migrate" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand migrate" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand files" -l dir -d 'Filter by destination directory (conf.d or all)' -r -f -a "conf.d\t''
all\t''"
complete -c pez -n "__fish_pez_using_subcommand files" -l format -d 'Output format (paths or json)' -r -f -a "paths\t''
json\t''"
complete -c pez -n "__fish_pez_using_subcommand files" -l from -d 'Derive target plugins by parsing argv for a subcommand (install/update/upgrade/uninstall/remove)' -r -f -a "install\t''
update\t''
upgrade\t''
uninstall\t''
remove\t''"
complete -c pez -n "__fish_pez_using_subcommand files" -l jobs -d 'Override job concurrency for explicit install clones, upgrade, uninstall, and prune (default: 4 when unset)' -r
complete -c pez -n "__fish_pez_using_subcommand files" -l all -d 'List files for all installed plugins'
complete -c pez -n "__fish_pez_using_subcommand files" -s v -l verbose -d 'Increase output verbosity (-v for info, -vv for debug)'
complete -c pez -n "__fish_pez_using_subcommand files" -s h -l help -d 'Print help'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "init" -d 'Initialize pez'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "install" -d 'Install fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "uninstall" -d 'Uninstall fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "upgrade" -d 'Upgrade installed fish plugin(s)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "list" -d 'List installed fish plugins'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "prune" -d 'Prune uninstalled plugins'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "activate" -d 'Output shell activation code'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "doctor" -d 'Diagnose common setup issues'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "migrate" -d 'Migrate from fisher (reads fish_plugins)'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "files" -d 'List installed files for plugins'
complete -c pez -n "__fish_pez_using_subcommand help; and not __fish_seen_subcommand_from init install uninstall upgrade list prune completions activate doctor migrate files help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
# Dynamic completions for installed plugins
function __pez_installed_plugins
    command pez list --format plain 2>/dev/null
end

complete -c pez -n '__fish_seen_subcommand_from uninstall upgrade' -f -a '(__pez_installed_plugins)'
