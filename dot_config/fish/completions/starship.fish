# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_starship_global_optspecs
	string join \n h/help V/version
end

function __fish_starship_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_starship_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_starship_using_subcommand
	set -l cmd (__fish_starship_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c starship -n "__fish_starship_needs_command" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_needs_command" -s V -l version -d 'Print version'
complete -c starship -n "__fish_starship_needs_command" -f -a "bug-report" -d 'Create a pre-populated GitHub issue with information about your configuration'
complete -c starship -n "__fish_starship_needs_command" -f -a "completions" -d 'Generate starship shell completions for your shell to stdout'
complete -c starship -n "__fish_starship_needs_command" -f -a "config" -d 'Edit the starship configuration'
complete -c starship -n "__fish_starship_needs_command" -f -a "explain" -d 'Explains the currently showing modules'
complete -c starship -n "__fish_starship_needs_command" -f -a "init" -d 'Prints the shell function used to execute starship'
complete -c starship -n "__fish_starship_needs_command" -f -a "module" -d 'Prints a specific prompt module'
complete -c starship -n "__fish_starship_needs_command" -f -a "preset" -d 'Prints a preset config'
complete -c starship -n "__fish_starship_needs_command" -f -a "print-config" -d 'Prints the computed starship configuration'
complete -c starship -n "__fish_starship_needs_command" -f -a "prompt" -d 'Prints the full starship prompt'
complete -c starship -n "__fish_starship_needs_command" -f -a "session" -d 'Generate random session key'
complete -c starship -n "__fish_starship_needs_command" -f -a "time" -d 'Prints time in milliseconds'
complete -c starship -n "__fish_starship_needs_command" -f -a "timings" -d 'Prints timings of all active modules'
complete -c starship -n "__fish_starship_needs_command" -f -a "toggle" -d 'Toggle a given starship module'
complete -c starship -n "__fish_starship_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c starship -n "__fish_starship_using_subcommand bug-report" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand completions" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand config" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand explain" -s s -l status -d 'The status code of the previously run command as an unsigned or signed 32bit integer' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -l pipestatus -d 'Bash, Fish and Zsh support returning codes for each process in a pipeline' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -s w -l terminal-width -d 'The width of the current interactive terminal' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -s p -l path -d 'The path that the prompt should render for' -r -F
complete -c starship -n "__fish_starship_using_subcommand explain" -s P -l logical-path -d 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument' -r -F
complete -c starship -n "__fish_starship_using_subcommand explain" -s d -l cmd-duration -d 'The execution duration of the last command, in milliseconds' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -s k -l keymap -d 'The keymap of fish/zsh/cmd' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -s j -l jobs -d 'The number of currently running jobs' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -l shlvl -d 'The current value of SHLVL, for shells that mis-handle it in $()' -r
complete -c starship -n "__fish_starship_using_subcommand explain" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand init" -l print-full-init
complete -c starship -n "__fish_starship_using_subcommand init" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand module" -s s -l status -d 'The status code of the previously run command as an unsigned or signed 32bit integer' -r
complete -c starship -n "__fish_starship_using_subcommand module" -l pipestatus -d 'Bash, Fish and Zsh support returning codes for each process in a pipeline' -r
complete -c starship -n "__fish_starship_using_subcommand module" -s w -l terminal-width -d 'The width of the current interactive terminal' -r
complete -c starship -n "__fish_starship_using_subcommand module" -s p -l path -d 'The path that the prompt should render for' -r -F
complete -c starship -n "__fish_starship_using_subcommand module" -s P -l logical-path -d 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument' -r -F
complete -c starship -n "__fish_starship_using_subcommand module" -s d -l cmd-duration -d 'The execution duration of the last command, in milliseconds' -r
complete -c starship -n "__fish_starship_using_subcommand module" -s k -l keymap -d 'The keymap of fish/zsh/cmd' -r
complete -c starship -n "__fish_starship_using_subcommand module" -s j -l jobs -d 'The number of currently running jobs' -r
complete -c starship -n "__fish_starship_using_subcommand module" -l shlvl -d 'The current value of SHLVL, for shells that mis-handle it in $()' -r
complete -c starship -n "__fish_starship_using_subcommand module" -s l -l list -d 'List out all supported modules'
complete -c starship -n "__fish_starship_using_subcommand module" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand preset" -s o -l output -d 'Output the preset to a file instead of stdout' -r -F
complete -c starship -n "__fish_starship_using_subcommand preset" -s l -l list -d 'List out all preset names'
complete -c starship -n "__fish_starship_using_subcommand preset" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand print-config" -s d -l default -d 'Print the default instead of the computed config'
complete -c starship -n "__fish_starship_using_subcommand print-config" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand prompt" -l profile -d 'Print the prompt with the specified profile name (instead of the standard left prompt)' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -s s -l status -d 'The status code of the previously run command as an unsigned or signed 32bit integer' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -l pipestatus -d 'Bash, Fish and Zsh support returning codes for each process in a pipeline' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -s w -l terminal-width -d 'The width of the current interactive terminal' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -s p -l path -d 'The path that the prompt should render for' -r -F
complete -c starship -n "__fish_starship_using_subcommand prompt" -s P -l logical-path -d 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument' -r -F
complete -c starship -n "__fish_starship_using_subcommand prompt" -s d -l cmd-duration -d 'The execution duration of the last command, in milliseconds' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -s k -l keymap -d 'The keymap of fish/zsh/cmd' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -s j -l jobs -d 'The number of currently running jobs' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -l shlvl -d 'The current value of SHLVL, for shells that mis-handle it in $()' -r
complete -c starship -n "__fish_starship_using_subcommand prompt" -l right -d 'Print the right prompt (instead of the standard left prompt)'
complete -c starship -n "__fish_starship_using_subcommand prompt" -l continuation -d 'Print the continuation prompt (instead of the standard left prompt)'
complete -c starship -n "__fish_starship_using_subcommand prompt" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand session" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand time" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand timings" -s s -l status -d 'The status code of the previously run command as an unsigned or signed 32bit integer' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -l pipestatus -d 'Bash, Fish and Zsh support returning codes for each process in a pipeline' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -s w -l terminal-width -d 'The width of the current interactive terminal' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -s p -l path -d 'The path that the prompt should render for' -r -F
complete -c starship -n "__fish_starship_using_subcommand timings" -s P -l logical-path -d 'The logical path that the prompt should render for. This path should be a virtual/logical representation of the PATH argument' -r -F
complete -c starship -n "__fish_starship_using_subcommand timings" -s d -l cmd-duration -d 'The execution duration of the last command, in milliseconds' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -s k -l keymap -d 'The keymap of fish/zsh/cmd' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -s j -l jobs -d 'The number of currently running jobs' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -l shlvl -d 'The current value of SHLVL, for shells that mis-handle it in $()' -r
complete -c starship -n "__fish_starship_using_subcommand timings" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand toggle" -s h -l help -d 'Print help'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "bug-report" -d 'Create a pre-populated GitHub issue with information about your configuration'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "completions" -d 'Generate starship shell completions for your shell to stdout'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "config" -d 'Edit the starship configuration'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "explain" -d 'Explains the currently showing modules'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "init" -d 'Prints the shell function used to execute starship'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "module" -d 'Prints a specific prompt module'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "preset" -d 'Prints a preset config'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "print-config" -d 'Prints the computed starship configuration'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "prompt" -d 'Prints the full starship prompt'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "session" -d 'Generate random session key'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "time" -d 'Prints time in milliseconds'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "timings" -d 'Prints timings of all active modules'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "toggle" -d 'Toggle a given starship module'
complete -c starship -n "__fish_starship_using_subcommand help; and not __fish_seen_subcommand_from bug-report completions config explain init module preset print-config prompt session time timings toggle help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
