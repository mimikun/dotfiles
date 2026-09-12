# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_jg_global_optspecs
	string join \n g/glob= files l/files-with-matches i/ignore-case compact r/raw-output count depth porcelain n/no-display F/fixed-string m/max-count= with-path no-path q/quiet f/format= o/output= h/help V/version
end

function __fish_jg_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_jg_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_jg_using_subcommand
	set -l cmd (__fish_jg_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c jg -n "__fish_jg_needs_command" -s g -l glob -d 'Include or exclude files and directories for searching that match the given glob' -r
complete -c jg -n "__fish_jg_needs_command" -s m -l max-count -d 'Stop searching after NUM matches per input file' -r
complete -c jg -n "__fish_jg_needs_command" -s f -l format -d 'Input format (auto-detects from file extension if omitted)' -r -f -a "auto\t'Detects from filetype, else defaults to JSON'
json\t'JSON format'
jsonl\t'JSONL format'
yaml\t'YAML format'
toml\t'TOML format'
cbor\t'CBOR format'
msgpack\t'`MessagePack` format'"
complete -c jg -n "__fish_jg_needs_command" -s o -l output -d 'Output format (auto-detects from file extension if omitted)' -r -f -a "auto\t'Detects from filetype, else defaults to JSON'
json\t'JSON format'
jsonl\t'JSONL format'
yaml\t'YAML format'
toml\t'TOML format'
cbor\t'CBOR format'
msgpack\t'`MessagePack` format'"
complete -c jg -n "__fish_jg_needs_command" -l files -d 'Prints the files that will be searched'
complete -c jg -n "__fish_jg_needs_command" -s l -l files-with-matches -d 'Print only the names of files containing at least one match (like `grep -l`)'
complete -c jg -n "__fish_jg_needs_command" -s i -l ignore-case -d 'Case insensitive search'
complete -c jg -n "__fish_jg_needs_command" -l compact -d 'Do not pretty-print JSON output (ignored for non-JSON output formats)'
complete -c jg -n "__fish_jg_needs_command" -s r -l raw-output -d 'Print matched strings without JSON quotes or escaping (like `jq -r`)'
complete -c jg -n "__fish_jg_needs_command" -l count -d 'Display count of number of matches'
complete -c jg -n "__fish_jg_needs_command" -l depth -d 'Display depth of the input document'
complete -c jg -n "__fish_jg_needs_command" -l porcelain -d 'Machine-readable output: strip labels and colors, print one JSON value per line (implies --compact)'
complete -c jg -n "__fish_jg_needs_command" -s n -l no-display -d 'Do not display matched JSON values'
complete -c jg -n "__fish_jg_needs_command" -s F -l fixed-string -d 'Treat the query as a literal field name and search at any depth'
complete -c jg -n "__fish_jg_needs_command" -l with-path -d 'Always print the path header, even when output is piped'
complete -c jg -n "__fish_jg_needs_command" -l no-path -d 'Never print the path header, even in a terminal'
complete -c jg -n "__fish_jg_needs_command" -s q -l quiet -d 'Quiet: write nothing to stdout; communicate via the exit status only (errors still print to stderr)'
complete -c jg -n "__fish_jg_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jg -n "__fish_jg_needs_command" -s V -l version -d 'Print version'
complete -c jg -n "__fish_jg_needs_command" -a "generate" -d 'Generate additional documentation and/or completions'
complete -c jg -n "__fish_jg_using_subcommand generate; and not __fish_seen_subcommand_from shell man" -s h -l help -d 'Print help'
complete -c jg -n "__fish_jg_using_subcommand generate; and not __fish_seen_subcommand_from shell man" -f -a "shell" -d 'Generate shell completions for the given shell to stdout'
complete -c jg -n "__fish_jg_using_subcommand generate; and not __fish_seen_subcommand_from shell man" -f -a "man" -d 'Generate a man page for jg to output directory if specified, else the current directory'
complete -c jg -n "__fish_jg_using_subcommand generate; and __fish_seen_subcommand_from shell" -s h -l help -d 'Print help'
complete -c jg -n "__fish_jg_using_subcommand generate; and __fish_seen_subcommand_from man" -s o -l output-dir -d 'The output directory to write the man pages' -r -F
complete -c jg -n "__fish_jg_using_subcommand generate; and __fish_seen_subcommand_from man" -s h -l help -d 'Print help'
