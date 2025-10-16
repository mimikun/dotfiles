# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_dotter_global_optspecs
	string join \n g/global-config= l/local-config= cache-file= cache-directory= pre-deploy= post-deploy= pre-undeploy= post-undeploy= d/dry-run v/verbose q/quiet f/force y/noconfirm p/patch diff-context-lines= h/help V/version
end

function __fish_dotter_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_dotter_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_dotter_using_subcommand
	set -l cmd (__fish_dotter_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c dotter -n "__fish_dotter_needs_command" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l cache-file -d 'Location of cache file' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l cache-directory -d 'Directory to cache into' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l pre-deploy -d 'Location of optional pre-deploy hook' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l post-deploy -d 'Location of optional post-deploy hook' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l pre-undeploy -d 'Location of optional pre-undeploy hook' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l post-undeploy -d 'Location of optional post-undeploy hook' -r -F
complete -c dotter -n "__fish_dotter_needs_command" -l diff-context-lines -d 'Amount of lines that are printed before and after a diff hunk' -r
complete -c dotter -n "__fish_dotter_needs_command" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_needs_command" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_needs_command" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_needs_command" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_needs_command" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_needs_command" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_needs_command" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_needs_command" -s V -l version -d 'Print version'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "deploy" -d 'Deploy the files to their respective targets. This is the default subcommand'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "undeploy" -d 'Delete all deployed files from their target locations. Note that this operates on all files that are currently in cache'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "init" -d 'Initialize global.toml with a single package containing all the files in the current directory pointing to a dummy value and a local.toml that selects that package'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "watch" -d 'Run continuously, watching the repository for changes and deploying as soon as they happen. Can be ran with `--dry-run`'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "gen-completions" -d 'Generate shell completions'
complete -c dotter -n "__fish_dotter_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_using_subcommand deploy" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_using_subcommand undeploy" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand init" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand init" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_using_subcommand init" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_using_subcommand watch" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s s -l shell -d 'Set the shell for generating completions [values: bash, elvish, fish, powerShell, zsh]' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -l to -d 'Set the out directory for writing completions file' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s g -l global-config -d 'Location of the global configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s l -l local-config -d 'Location of the local configuration' -r -F
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s d -l dry-run -d 'Dry run - don\'t do anything, only print information. Implies -v at least once'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s v -l verbose -d 'Verbosity level - specify up to 3 times to get more detailed output. Specifying at least once prints the differences between what was before and after Dotter\'s run'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s q -l quiet -d 'Quiet - only print errors'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s f -l force -d 'Force - instead of skipping, overwrite target files if their content is unexpected. Overrides --dry-run'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s y -l noconfirm -d 'Assume "yes" instead of prompting when removing empty directories'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s p -l patch -d 'Take standard input as an additional files/variables patch, added after evaluating `local.toml`. Assumes --noconfirm flag because all of stdin is taken as the patch'
complete -c dotter -n "__fish_dotter_using_subcommand gen-completions" -s h -l help -d 'Print help'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "deploy" -d 'Deploy the files to their respective targets. This is the default subcommand'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "undeploy" -d 'Delete all deployed files from their target locations. Note that this operates on all files that are currently in cache'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "init" -d 'Initialize global.toml with a single package containing all the files in the current directory pointing to a dummy value and a local.toml that selects that package'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "watch" -d 'Run continuously, watching the repository for changes and deploying as soon as they happen. Can be ran with `--dry-run`'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "gen-completions" -d 'Generate shell completions'
complete -c dotter -n "__fish_dotter_using_subcommand help; and not __fish_seen_subcommand_from deploy undeploy init watch gen-completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
