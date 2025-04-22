# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rip_global_optspecs
	string join \n graveyard= d/decompose s/seance u/unbury= i/inspect f/force h/help V/version
end

function __fish_rip_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rip_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rip_using_subcommand
	set -l cmd (__fish_rip_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rip -n "__fish_rip_needs_command" -l graveyard -d 'Directory where deleted files rest' -r -F
complete -c rip -n "__fish_rip_needs_command" -s u -l unbury -d 'Restore the specified files or the last file if none are specified' -r -F
complete -c rip -n "__fish_rip_needs_command" -s d -l decompose -d 'Permanently deletes the graveyard'
complete -c rip -n "__fish_rip_needs_command" -s s -l seance -d 'Prints files that were deleted in the current directory'
complete -c rip -n "__fish_rip_needs_command" -s i -l inspect -d 'Print some info about FILES before burying'
complete -c rip -n "__fish_rip_needs_command" -s f -l force -d 'Non-interactive mode'
complete -c rip -n "__fish_rip_needs_command" -s h -l help -d 'Print help'
complete -c rip -n "__fish_rip_needs_command" -s V -l version -d 'Print version'
complete -c rip -n "__fish_rip_needs_command" -a "completions" -d 'Generate shell completions file'
complete -c rip -n "__fish_rip_needs_command" -a "graveyard" -d 'Print the graveyard path'
complete -c rip -n "__fish_rip_needs_command" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rip -n "__fish_rip_using_subcommand completions" -s h -l help -d 'Print help'
complete -c rip -n "__fish_rip_using_subcommand graveyard" -s s -l seance -d 'Get the graveyard subdirectory of the current directory'
complete -c rip -n "__fish_rip_using_subcommand graveyard" -s h -l help -d 'Print help'
complete -c rip -n "__fish_rip_using_subcommand help; and not __fish_seen_subcommand_from completions graveyard help" -f -a "completions" -d 'Generate shell completions file'
complete -c rip -n "__fish_rip_using_subcommand help; and not __fish_seen_subcommand_from completions graveyard help" -f -a "graveyard" -d 'Print the graveyard path'
complete -c rip -n "__fish_rip_using_subcommand help; and not __fish_seen_subcommand_from completions graveyard help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
