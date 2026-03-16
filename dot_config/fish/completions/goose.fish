# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_goose_global_optspecs
	string join \n h/help V/version
end

function __fish_goose_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_goose_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_goose_using_subcommand
	set -l cmd (__fish_goose_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c goose -n "__fish_goose_needs_command" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_needs_command" -s V -l version -d 'Print version'
complete -c goose -n "__fish_goose_needs_command" -f -a "configure" -d 'Configure goose settings'
complete -c goose -n "__fish_goose_needs_command" -f -a "info" -d 'Display goose information'
complete -c goose -n "__fish_goose_needs_command" -f -a "mcp" -d 'Run one of the mcp servers bundled with goose'
complete -c goose -n "__fish_goose_needs_command" -f -a "acp" -d 'Run goose as an ACP agent server on stdio'
complete -c goose -n "__fish_goose_needs_command" -f -a "session" -d 'Start or resume interactive chat sessions'
complete -c goose -n "__fish_goose_needs_command" -f -a "s" -d 'Start or resume interactive chat sessions'
complete -c goose -n "__fish_goose_needs_command" -f -a "project" -d 'Open the last project directory'
complete -c goose -n "__fish_goose_needs_command" -f -a "p" -d 'Open the last project directory'
complete -c goose -n "__fish_goose_needs_command" -f -a "projects" -d 'List recent project directories'
complete -c goose -n "__fish_goose_needs_command" -f -a "ps" -d 'List recent project directories'
complete -c goose -n "__fish_goose_needs_command" -f -a "run" -d 'Execute commands from an instruction file or stdin'
complete -c goose -n "__fish_goose_needs_command" -f -a "recipe" -d 'Recipe utilities for validation and deeplinking'
complete -c goose -n "__fish_goose_needs_command" -f -a "schedule" -d 'Manage scheduled jobs'
complete -c goose -n "__fish_goose_needs_command" -f -a "sched" -d 'Manage scheduled jobs'
complete -c goose -n "__fish_goose_needs_command" -f -a "gateway" -d 'Manage gateways for external platform integrations'
complete -c goose -n "__fish_goose_needs_command" -f -a "gw" -d 'Manage gateways for external platform integrations'
complete -c goose -n "__fish_goose_needs_command" -f -a "update" -d 'Update the goose CLI version'
complete -c goose -n "__fish_goose_needs_command" -f -a "web" -d 'Experimental: Start a web server with a chat interface'
complete -c goose -n "__fish_goose_needs_command" -f -a "term" -d 'Terminal-integrated goose session'
complete -c goose -n "__fish_goose_needs_command" -f -a "local-models" -d 'Manage local inference models'
complete -c goose -n "__fish_goose_needs_command" -f -a "lm" -d 'Manage local inference models'
complete -c goose -n "__fish_goose_needs_command" -f -a "completion" -d 'Generate the autocompletion script for the specified shell'
complete -c goose -n "__fish_goose_needs_command" -f -a "validate-extensions" -d 'Validate a bundled-extensions.json file'
complete -c goose -n "__fish_goose_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand configure" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand info" -s v -l verbose -d 'Show verbose information including config.yaml'
complete -c goose -n "__fish_goose_using_subcommand info" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand mcp" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand acp" -l with-builtin -d 'Add builtin extensions by name (e.g., \'developer\' or multiple: \'developer,github\')' -r
complete -c goose -n "__fish_goose_using_subcommand acp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l max-tool-repetitions -d 'Maximum number of consecutive identical tool calls allowed' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l max-turns -d 'Maximum number of turns allowed without user input (default: 1000)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l container -d 'Docker container ID to run extensions inside' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-extension -d 'Add stdio extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-streamable-http-extension -d 'Add streamable HTTP extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-builtin -d 'Add builtin extensions by name (e.g., \'developer\' or multiple: \'developer,github\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -s r -l resume -d 'Resume a previous session (last used or specified by --name/--session-id)'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l fork -d 'Fork a previous session (creates new session with copied history)'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l history -d 'Show previous messages when resuming a session'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l debug -d 'Enable debug output mode with full content and no truncation'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -l no-profile -d 'Don\'t load your default extensions, only use CLI-specified extensions'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "list" -d 'List all available sessions'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "remove" -d 'Remove sessions. Runs interactively if no ID, name, or regex is provided.'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "export" -d 'Export a session'
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "diagnostics"
complete -c goose -n "__fish_goose_using_subcommand session; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from list" -s f -l format -d 'Output format (text, json)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from list" -s w -l working_dir -d 'Filter sessions by working directory' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from list" -s l -l limit -d 'Limit the number of results' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from list" -l ascending -d 'Sort by date in ascending order (oldest first)'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from remove" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from remove" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from remove" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from remove" -s r -l regex -d 'Regex for removing matched sessions (optional)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -s o -l output -d 'Output file path (default: stdout)' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -l format -d 'Output format (markdown, json, yaml)' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from diagnostics" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from diagnostics" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from diagnostics" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from diagnostics" -s o -l output -d 'Output path for the diagnostics zip file (optional, defaults to current directory)' -r -F
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from diagnostics" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all available sessions'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove sessions. Runs interactively if no ID, name, or regex is provided.'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "export" -d 'Export a session'
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "diagnostics"
complete -c goose -n "__fish_goose_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l max-tool-repetitions -d 'Maximum number of consecutive identical tool calls allowed' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l max-turns -d 'Maximum number of turns allowed without user input (default: 1000)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l container -d 'Docker container ID to run extensions inside' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-extension -d 'Add stdio extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-streamable-http-extension -d 'Add streamable HTTP extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l with-builtin -d 'Add builtin extensions by name (e.g., \'developer\' or multiple: \'developer,github\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -s r -l resume -d 'Resume a previous session (last used or specified by --name/--session-id)'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l fork -d 'Fork a previous session (creates new session with copied history)'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l history -d 'Show previous messages when resuming a session'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l debug -d 'Enable debug output mode with full content and no truncation'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -l no-profile -d 'Don\'t load your default extensions, only use CLI-specified extensions'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "list" -d 'List all available sessions'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "remove" -d 'Remove sessions. Runs interactively if no ID, name, or regex is provided.'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "export" -d 'Export a session'
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "diagnostics"
complete -c goose -n "__fish_goose_using_subcommand s; and not __fish_seen_subcommand_from list remove export diagnostics help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from list" -s f -l format -d 'Output format (text, json)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from list" -s w -l working_dir -d 'Filter sessions by working directory' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from list" -s l -l limit -d 'Limit the number of results' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from list" -l ascending -d 'Sort by date in ascending order (oldest first)'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from remove" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from remove" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from remove" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from remove" -s r -l regex -d 'Regex for removing matched sessions (optional)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -s o -l output -d 'Output file path (default: stdout)' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -l format -d 'Output format (markdown, json, yaml)' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from diagnostics" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from diagnostics" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from diagnostics" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from diagnostics" -s o -l output -d 'Output path for the diagnostics zip file (optional, defaults to current directory)' -r -F
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from diagnostics" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all available sessions'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove sessions. Runs interactively if no ID, name, or regex is provided.'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from help" -f -a "export" -d 'Export a session'
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from help" -f -a "diagnostics"
complete -c goose -n "__fish_goose_using_subcommand s; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand project" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand p" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand projects" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand ps" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand run" -s i -l instructions -d 'Path to instruction file containing commands. Use - for stdin.' -r
complete -c goose -n "__fish_goose_using_subcommand run" -s t -l text -d 'Input text to provide to goose directly' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l recipe -d 'Recipe name to get recipe file or the full path of the recipe file (use --explain to see recipe details)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l system -d 'Additional system prompt to customize agent behavior' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l params -d 'Dynamic parameters (e.g., --params username=alice --params channel_name=goose-channel)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l sub-recipe -d 'Sub-recipe name or file path (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -s n -l name -d 'Name for the chat session (e.g., \'project-x\')' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l session-id -d 'Session ID (e.g., \'20250921_143022\')' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l path -d 'Legacy: Path for the chat session' -r -F
complete -c goose -n "__fish_goose_using_subcommand run" -l scheduled-job-id -d 'ID of the scheduled job that triggered this execution (internal use)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l max-tool-repetitions -d 'Maximum number of consecutive identical tool calls allowed' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l max-turns -d 'Maximum number of turns allowed without user input (default: 1000)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l container -d 'Docker container ID to run extensions inside' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l with-extension -d 'Add stdio extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l with-streamable-http-extension -d 'Add streamable HTTP extensions (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l with-builtin -d 'Add builtin extensions by name (e.g., \'developer\' or multiple: \'developer,github\')' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l output-format -d 'Output format (text, json, stream-json)' -r -f -a "text\t''
json\t''
stream-json\t''"
complete -c goose -n "__fish_goose_using_subcommand run" -l provider -d 'Specify the LLM provider to use (e.g., \'openai\', \'anthropic\')' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l model -d 'Specify the model to use (e.g., \'gpt-4o\', \'claude-sonnet-4-20250514\')' -r
complete -c goose -n "__fish_goose_using_subcommand run" -l explain -d 'Show the recipe title, description, and parameters'
complete -c goose -n "__fish_goose_using_subcommand run" -l render-recipe -d 'Print the rendered recipe instead of running it.'
complete -c goose -n "__fish_goose_using_subcommand run" -s s -l interactive -d 'Continue in interactive mode after processing initial input'
complete -c goose -n "__fish_goose_using_subcommand run" -l no-session -d 'Run without storing a session file'
complete -c goose -n "__fish_goose_using_subcommand run" -s r -l resume -d 'Resume from a previous run'
complete -c goose -n "__fish_goose_using_subcommand run" -l debug -d 'Enable debug output mode with full content and no truncation'
complete -c goose -n "__fish_goose_using_subcommand run" -l no-profile -d 'Don\'t load your default extensions, only use CLI-specified extensions'
complete -c goose -n "__fish_goose_using_subcommand run" -s q -l quiet -d 'Quiet mode. Suppress non-response output, printing only the model response to stdout'
complete -c goose -n "__fish_goose_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -f -a "validate" -d 'Validate a recipe'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -f -a "deeplink" -d 'Generate a deeplink for a recipe'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -f -a "open" -d 'Open a recipe in Goose Desktop'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -f -a "list" -d 'List available recipes'
complete -c goose -n "__fish_goose_using_subcommand recipe; and not __fish_seen_subcommand_from validate deeplink open list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from validate" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from deeplink" -s p -l param -d 'Recipe parameter in key=value format (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from deeplink" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from open" -s p -l param -d 'Recipe parameter in key=value format (can be specified multiple times)' -r
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from list" -l format -d 'Output format (text, json)' -r
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Show verbose information including recipe descriptions'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from help" -f -a "validate" -d 'Validate a recipe'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from help" -f -a "deeplink" -d 'Generate a deeplink for a recipe'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open a recipe in Goose Desktop'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available recipes'
complete -c goose -n "__fish_goose_using_subcommand recipe; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "add" -d 'Add a new scheduled job'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "list" -d 'List all scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "remove" -d 'Remove a scheduled job by ID'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "sessions" -d 'List sessions created by a specific schedule'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "run-now" -d 'Run a scheduled job immediately'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "services-status" -d '[Deprecated] Check status of scheduler services'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "services-stop" -d '[Deprecated] Stop scheduler services'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "cron-help" -d 'Show cron expression examples and help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from add" -l schedule-id -d 'Unique ID for the recurring scheduled job' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from add" -l cron -d 'Cron expression for the schedule' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from add" -l recipe-source -d 'Recipe source (path to file, or base64 encoded recipe string)' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from remove" -l schedule-id -d 'ID of the scheduled job to remove (removes the recurring schedule)' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from sessions" -l schedule-id -d 'ID of the schedule' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from sessions" -s l -l limit -d 'Maximum number of sessions to return' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from sessions" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from run-now" -l schedule-id -d 'ID of the schedule to run' -r
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from run-now" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from services-status" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from services-stop" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from cron-help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a new scheduled job'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a scheduled job by ID'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "sessions" -d 'List sessions created by a specific schedule'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "run-now" -d 'Run a scheduled job immediately'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "services-status" -d '[Deprecated] Check status of scheduler services'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "services-stop" -d '[Deprecated] Stop scheduler services'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "cron-help" -d 'Show cron expression examples and help'
complete -c goose -n "__fish_goose_using_subcommand schedule; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "add" -d 'Add a new scheduled job'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "list" -d 'List all scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "remove" -d 'Remove a scheduled job by ID'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "sessions" -d 'List sessions created by a specific schedule'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "run-now" -d 'Run a scheduled job immediately'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "services-status" -d '[Deprecated] Check status of scheduler services'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "services-stop" -d '[Deprecated] Stop scheduler services'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "cron-help" -d 'Show cron expression examples and help'
complete -c goose -n "__fish_goose_using_subcommand sched; and not __fish_seen_subcommand_from add list remove sessions run-now services-status services-stop cron-help help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from add" -l schedule-id -d 'Unique ID for the recurring scheduled job' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from add" -l cron -d 'Cron expression for the schedule' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from add" -l recipe-source -d 'Recipe source (path to file, or base64 encoded recipe string)' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from remove" -l schedule-id -d 'ID of the scheduled job to remove (removes the recurring schedule)' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from sessions" -l schedule-id -d 'ID of the schedule' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from sessions" -s l -l limit -d 'Maximum number of sessions to return' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from sessions" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from run-now" -l schedule-id -d 'ID of the schedule to run' -r
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from run-now" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from services-status" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from services-stop" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from cron-help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a new scheduled job'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a scheduled job by ID'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "sessions" -d 'List sessions created by a specific schedule'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "run-now" -d 'Run a scheduled job immediately'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "services-status" -d '[Deprecated] Check status of scheduler services'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "services-stop" -d '[Deprecated] Stop scheduler services'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "cron-help" -d 'Show cron expression examples and help'
complete -c goose -n "__fish_goose_using_subcommand sched; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -f -a "status" -d 'Show gateway status'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -f -a "start" -d 'Start a gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -f -a "stop" -d 'Stop a running gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -f -a "pair" -d 'Generate a pairing code for a gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and not __fish_seen_subcommand_from status start stop pair help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from start" -l bot-token -d 'Bot token for the gateway platform' -r
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from pair" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show gateway status'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start a gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop a running gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from help" -f -a "pair" -d 'Generate a pairing code for a gateway'
complete -c goose -n "__fish_goose_using_subcommand gateway; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -f -a "status" -d 'Show gateway status'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -f -a "start" -d 'Start a gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -f -a "stop" -d 'Stop a running gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -f -a "pair" -d 'Generate a pairing code for a gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and not __fish_seen_subcommand_from status start stop pair help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from start" -l bot-token -d 'Bot token for the gateway platform' -r
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from pair" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show gateway status'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start a gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop a running gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from help" -f -a "pair" -d 'Generate a pairing code for a gateway'
complete -c goose -n "__fish_goose_using_subcommand gw; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand update" -s c -l canary -d 'Update to canary version'
complete -c goose -n "__fish_goose_using_subcommand update" -s r -l reconfigure -d 'Enforce to re-configure goose during update'
complete -c goose -n "__fish_goose_using_subcommand update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand web" -s p -l port -d 'Port to run the web server on' -r
complete -c goose -n "__fish_goose_using_subcommand web" -l host -d 'Host to bind the web server to' -r
complete -c goose -n "__fish_goose_using_subcommand web" -l auth-token -d 'Authentication token to secure the web interface' -r
complete -c goose -n "__fish_goose_using_subcommand web" -l open -d 'Open browser automatically when server starts'
complete -c goose -n "__fish_goose_using_subcommand web" -l no-auth -d 'Skip auth requirement when exposed on the network (unsafe)'
complete -c goose -n "__fish_goose_using_subcommand web" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -f -a "init" -d 'Print shell initialization script'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -f -a "log" -d 'Log a shell command to the session'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -f -a "run" -d 'Run a prompt in the terminal session'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -f -a "info" -d 'Print session info for prompt integration'
complete -c goose -n "__fish_goose_using_subcommand term; and not __fish_seen_subcommand_from init log run info help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from init" -s n -l name -d 'Name for the terminal session' -r
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from init" -l default -d 'Make goose the default handler for unknown commands'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from help" -f -a "init" -d 'Print shell initialization script'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from help" -f -a "log" -d 'Log a shell command to the session'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from help" -f -a "run" -d 'Run a prompt in the terminal session'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from help" -f -a "info" -d 'Print session info for prompt integration'
complete -c goose -n "__fish_goose_using_subcommand term; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -f -a "search" -d 'Search HuggingFace for GGUF models'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -f -a "download" -d 'Download a GGUF model (e.g. bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_M)'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -f -a "list" -d 'List downloaded local models'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -f -a "delete" -d 'Delete a downloaded local model'
complete -c goose -n "__fish_goose_using_subcommand local-models; and not __fish_seen_subcommand_from search download list delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from search" -s l -l limit -d 'Maximum number of results' -r
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from download" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search HuggingFace for GGUF models'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from help" -f -a "download" -d 'Download a GGUF model (e.g. bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_M)'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from help" -f -a "list" -d 'List downloaded local models'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a downloaded local model'
complete -c goose -n "__fish_goose_using_subcommand local-models; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -f -a "search" -d 'Search HuggingFace for GGUF models'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -f -a "download" -d 'Download a GGUF model (e.g. bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_M)'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -f -a "list" -d 'List downloaded local models'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -f -a "delete" -d 'Delete a downloaded local model'
complete -c goose -n "__fish_goose_using_subcommand lm; and not __fish_seen_subcommand_from search download list delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from search" -s l -l limit -d 'Maximum number of results' -r
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from download" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from help" -f -a "search" -d 'Search HuggingFace for GGUF models'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from help" -f -a "download" -d 'Download a GGUF model (e.g. bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_M)'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from help" -f -a "list" -d 'List downloaded local models'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a downloaded local model'
complete -c goose -n "__fish_goose_using_subcommand lm; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand completion" -l bin-name -d 'Provide a custom binary name' -r
complete -c goose -n "__fish_goose_using_subcommand completion" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand validate-extensions" -s h -l help -d 'Print help'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "configure" -d 'Configure goose settings'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "info" -d 'Display goose information'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "mcp" -d 'Run one of the mcp servers bundled with goose'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "acp" -d 'Run goose as an ACP agent server on stdio'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "session" -d 'Start or resume interactive chat sessions'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "project" -d 'Open the last project directory'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "projects" -d 'List recent project directories'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "run" -d 'Execute commands from an instruction file or stdin'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "recipe" -d 'Recipe utilities for validation and deeplinking'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "schedule" -d 'Manage scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "gateway" -d 'Manage gateways for external platform integrations'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "update" -d 'Update the goose CLI version'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "web" -d 'Experimental: Start a web server with a chat interface'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "term" -d 'Terminal-integrated goose session'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "local-models" -d 'Manage local inference models'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "completion" -d 'Generate the autocompletion script for the specified shell'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "validate-extensions" -d 'Validate a bundled-extensions.json file'
complete -c goose -n "__fish_goose_using_subcommand help; and not __fish_seen_subcommand_from configure info mcp acp session project projects run recipe schedule gateway update web term local-models completion validate-extensions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "list" -d 'List all available sessions'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "remove" -d 'Remove sessions. Runs interactively if no ID, name, or regex is provided.'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "export" -d 'Export a session'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "diagnostics"
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from recipe" -f -a "validate" -d 'Validate a recipe'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from recipe" -f -a "deeplink" -d 'Generate a deeplink for a recipe'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from recipe" -f -a "open" -d 'Open a recipe in Goose Desktop'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from recipe" -f -a "list" -d 'List available recipes'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "add" -d 'Add a new scheduled job'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "list" -d 'List all scheduled jobs'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "remove" -d 'Remove a scheduled job by ID'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "sessions" -d 'List sessions created by a specific schedule'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "run-now" -d 'Run a scheduled job immediately'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "services-status" -d '[Deprecated] Check status of scheduler services'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "services-stop" -d '[Deprecated] Stop scheduler services'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from schedule" -f -a "cron-help" -d 'Show cron expression examples and help'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from gateway" -f -a "status" -d 'Show gateway status'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from gateway" -f -a "start" -d 'Start a gateway'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from gateway" -f -a "stop" -d 'Stop a running gateway'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from gateway" -f -a "pair" -d 'Generate a pairing code for a gateway'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from term" -f -a "init" -d 'Print shell initialization script'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from term" -f -a "log" -d 'Log a shell command to the session'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from term" -f -a "run" -d 'Run a prompt in the terminal session'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from term" -f -a "info" -d 'Print session info for prompt integration'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from local-models" -f -a "search" -d 'Search HuggingFace for GGUF models'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from local-models" -f -a "download" -d 'Download a GGUF model (e.g. bartowski/Llama-3.2-1B-Instruct-GGUF:Q4_K_M)'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from local-models" -f -a "list" -d 'List downloaded local models'
complete -c goose -n "__fish_goose_using_subcommand help; and __fish_seen_subcommand_from local-models" -f -a "delete" -d 'Delete a downloaded local model'
