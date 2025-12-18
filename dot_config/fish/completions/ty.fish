# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_ty_global_optspecs
	string join \n h/help V/version
end

function __fish_ty_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_ty_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_ty_using_subcommand
	set -l cmd (__fish_ty_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c ty -n "__fish_ty_needs_command" -s h -l help -d 'Print help'
complete -c ty -n "__fish_ty_needs_command" -s V -l version -d 'Print version'
complete -c ty -n "__fish_ty_needs_command" -f -a "check" -d 'Check a project for type errors'
complete -c ty -n "__fish_ty_needs_command" -f -a "server" -d 'Start the language server'
complete -c ty -n "__fish_ty_needs_command" -f -a "version" -d 'Display ty\'s version'
complete -c ty -n "__fish_ty_needs_command" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c ty -n "__fish_ty_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ty -n "__fish_ty_using_subcommand check" -l project -d 'Run the command within the given project directory' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l python -d 'Path to your project\'s Python environment or interpreter' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l typeshed -d 'Custom directory to use for stdlib typeshed stubs' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l extra-search-path -d 'Additional path to use as a module-resolution source (can be passed multiple times)' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l python-version -d 'Python version to assume when resolving types' -r -f -a "3.7\t''
3.8\t''
3.9\t''
3.10\t''
3.11\t''
3.12\t''
3.13\t''
3.14\t''"
complete -c ty -n "__fish_ty_using_subcommand check" -l python-platform -d 'Target platform to assume when resolving types' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l error -d 'Treat the given rule as having severity \'error\'. Can be specified multiple times.' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l warn -d 'Treat the given rule as having severity \'warn\'. Can be specified multiple times.' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l ignore -d 'Disables the rule. Can be specified multiple times.' -r
complete -c ty -n "__fish_ty_using_subcommand check" -s c -l config -d 'A TOML `<KEY> = <VALUE>` pair overriding a specific configuration option.' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l config-file -d 'The path to a `ty.toml` file to use for configuration' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l output-format -d 'The format to use for printing diagnostic messages' -r -f -a "full\t'Print diagnostics verbosely, with context and helpful hints (default)'
concise\t'Print diagnostics concisely, one per line'
gitlab\t'Print diagnostics in the JSON format expected by GitLab Code Quality reports'
github\t'Print diagnostics in the format used by GitHub Actions workflow error annotations'"
complete -c ty -n "__fish_ty_using_subcommand check" -l exclude -d 'Glob patterns for files to exclude from type checking' -r
complete -c ty -n "__fish_ty_using_subcommand check" -l color -d 'Control when colored output is used' -r -f -a "auto\t'Display colors if the output goes to an interactive terminal'
always\t'Always display colors'
never\t'Never display colors'"
complete -c ty -n "__fish_ty_using_subcommand check" -s v -l verbose -d 'Use verbose output (or `-vv` and `-vvv` for more verbose output)'
complete -c ty -n "__fish_ty_using_subcommand check" -s q -l quiet -d 'Use quiet output (or `-qq` for silent output)'
complete -c ty -n "__fish_ty_using_subcommand check" -l error-on-warning -d 'Use exit code 1 if there are any warning-level diagnostics'
complete -c ty -n "__fish_ty_using_subcommand check" -l exit-zero -d 'Always use exit code 0, even when there are error-level diagnostics'
complete -c ty -n "__fish_ty_using_subcommand check" -s W -l watch -d 'Watch files for changes and recheck files related to the changed files'
complete -c ty -n "__fish_ty_using_subcommand check" -l respect-ignore-files -d 'Respect file exclusions via `.gitignore` and other standard ignore files. Use `--no-respect-gitignore` to disable'
complete -c ty -n "__fish_ty_using_subcommand check" -l no-respect-ignore-files
complete -c ty -n "__fish_ty_using_subcommand check" -l no-progress -d 'Hide all progress outputs'
complete -c ty -n "__fish_ty_using_subcommand check" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ty -n "__fish_ty_using_subcommand server" -s h -l help -d 'Print help'
complete -c ty -n "__fish_ty_using_subcommand version" -s h -l help -d 'Print help'
complete -c ty -n "__fish_ty_using_subcommand generate-shell-completion" -s h -l help -d 'Print help'
complete -c ty -n "__fish_ty_using_subcommand help; and not __fish_seen_subcommand_from check server version generate-shell-completion help" -f -a "check" -d 'Check a project for type errors'
complete -c ty -n "__fish_ty_using_subcommand help; and not __fish_seen_subcommand_from check server version generate-shell-completion help" -f -a "server" -d 'Start the language server'
complete -c ty -n "__fish_ty_using_subcommand help; and not __fish_seen_subcommand_from check server version generate-shell-completion help" -f -a "version" -d 'Display ty\'s version'
complete -c ty -n "__fish_ty_using_subcommand help; and not __fish_seen_subcommand_from check server version generate-shell-completion help" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c ty -n "__fish_ty_using_subcommand help; and not __fish_seen_subcommand_from check server version generate-shell-completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
