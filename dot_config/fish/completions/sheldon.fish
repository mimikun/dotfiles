# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_sheldon_global_optspecs
	string join \n q/quiet non-interactive v/verbose color= config-dir= data-dir= config-file= profile= h/help V/version
end

function __fish_sheldon_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_sheldon_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_sheldon_using_subcommand
	set -l cmd (__fish_sheldon_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c sheldon -n "__fish_sheldon_needs_command" -l color -d 'Output coloring' -r -f -a "{auto\t'',always\t'',never\t''}"
complete -c sheldon -n "__fish_sheldon_needs_command" -l config-dir -d 'The configuration directory' -r -F
complete -c sheldon -n "__fish_sheldon_needs_command" -l data-dir -d 'The data directory' -r -F
complete -c sheldon -n "__fish_sheldon_needs_command" -l config-file -d 'The config file' -r -F
complete -c sheldon -n "__fish_sheldon_needs_command" -l profile -d 'The profile used for conditional plugins' -r
complete -c sheldon -n "__fish_sheldon_needs_command" -s q -l quiet -d 'Suppress any informational output'
complete -c sheldon -n "__fish_sheldon_needs_command" -l non-interactive -d 'Suppress any interactive prompts and assume "yes" as the answer'
complete -c sheldon -n "__fish_sheldon_needs_command" -s v -l verbose -d 'Use verbose output'
complete -c sheldon -n "__fish_sheldon_needs_command" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_needs_command" -s V -l version -d 'Print version'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "init" -d 'Initialize a new config file'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "add" -d 'Add a new plugin to the config file'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "edit" -d 'Open up the config file in the default editor'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "remove" -d 'Remove a plugin from the config file'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "lock" -d 'Install the plugins sources and generate the lock file'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "source" -d 'Generate and print out the script'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "completions" -d 'Generate completions for the given shell'
complete -c sheldon -n "__fish_sheldon_needs_command" -f -a "version" -d 'Prints detailed version information'
complete -c sheldon -n "__fish_sheldon_using_subcommand init" -l shell -d 'The type of shell' -r -f -a "{bash\t'',zsh\t''}"
complete -c sheldon -n "__fish_sheldon_using_subcommand init" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l git -d 'Add a clonable Git repository' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l gist -d 'Add a clonable Gist snippet' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l github -d 'Add a clonable GitHub repository' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l remote -d 'Add a downloadable file' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l local -d 'Add a local directory' -r -F
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l proto -d 'The Git protocol for a Gist or GitHub plugin' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l branch -d 'Checkout the tip of a branch' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l rev -d 'Checkout a specific commit' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l tag -d 'Checkout a specific tag' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l dir -d 'Which sub directory to use in this plugin' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l use -d 'Which files to use in this plugin' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l apply -d 'Templates to apply to this plugin' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l profiles -d 'Only use this plugin under one of the given profiles' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -l hooks -d 'Hooks executed during template evaluation' -r
complete -c sheldon -n "__fish_sheldon_using_subcommand add" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand edit" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand remove" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand lock" -l update -d 'Update all plugin sources'
complete -c sheldon -n "__fish_sheldon_using_subcommand lock" -l reinstall -d 'Reinstall all plugin sources'
complete -c sheldon -n "__fish_sheldon_using_subcommand lock" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand source" -l relock -d 'Regenerate the lock file'
complete -c sheldon -n "__fish_sheldon_using_subcommand source" -l update -d 'Update all plugin sources (implies --relock)'
complete -c sheldon -n "__fish_sheldon_using_subcommand source" -l reinstall -d 'Reinstall all plugin sources (implies --relock)'
complete -c sheldon -n "__fish_sheldon_using_subcommand source" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand completions" -l shell -d 'The type of shell' -r -f -a "{bash\t'',elvish\t'',fish\t'',powershell\t'',zsh\t''}"
complete -c sheldon -n "__fish_sheldon_using_subcommand completions" -s h -l help -d 'Print help'
complete -c sheldon -n "__fish_sheldon_using_subcommand version" -s h -l help -d 'Print help'
