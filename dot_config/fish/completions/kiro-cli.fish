# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_kiro_cli_global_optspecs
	string join \n v/verbose help-all show-legacy-warning agent= h/help V/version
end

function __fish_kiro_cli_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_kiro_cli_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_kiro_cli_using_subcommand
	set -l cmd (__fish_kiro_cli_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -l agent -d 'Launch chat with specified agent' -r
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -l help-all -d 'Print help for all subcommands'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -l show-legacy-warning -d 'Show legacy warning for q command'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -s V -l version -d 'Print version'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "hook" -d 'Hook commands'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "debug" -d 'Debug the app'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "settings" -d 'Customize appearance & behavior'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "setup" -d 'Setup cli components'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "uninstall" -d 'Uninstall Amazon Q'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "update" -d 'Update the Kiro application'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "diagnostic" -d 'Run diagnostic tests'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "init" -d 'Generate the dotfiles for the given shell'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "theme" -d 'Get or set theme'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "issue" -d 'Create a new Github issue'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "login" -d 'Login'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "logout" -d 'Logout'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "whoami" -d 'Prints details about the current user'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "profile" -d 'Show the profile associated with this idc user'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "user" -d 'Manage your account'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "doctor" -d 'Fix and diagnose common issues'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "completion" -d 'Generate CLI completion spec'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "internal" -d 'Internal subcommands'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "launch" -d 'Launch the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "quit" -d 'Quit the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "restart" -d 'Restart the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "integrations" -d 'Manage system integrations'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "translate" -d 'Natural Language to Shell translation'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "telemetry" -d 'Enable/disable telemetry'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "version" -d 'Version'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "dashboard" -d 'Open the dashboard'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "chat" -d 'AI assistant in your terminal'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "mcp" -d 'Model Context Protocol (MCP)'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "inline" -d 'Inline shell completions'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "agent" -d 'Agent root commands'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "acp" -d 'Agent Client Protocol (ACP)'
complete -c kiro-cli -n "__fish_kiro_cli_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "editbuffer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "hide"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "init"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "integration-ready"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "keyboard-focus-changed"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "pre-exec"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "prompt"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "clear-autocomplete-cache"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and not __fish_seen_subcommand_from editbuffer hide init integration-ready keyboard-focus-changed pre-exec prompt ssh clear-autocomplete-cache help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from editbuffer" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from editbuffer" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from hide" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from hide" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from init" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from integration-ready" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from integration-ready" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from keyboard-focus-changed" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from keyboard-focus-changed" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from pre-exec" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from pre-exec" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from prompt" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from prompt" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from ssh" -l prompt
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from ssh" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from ssh" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from clear-autocomplete-cache" -l cli -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from clear-autocomplete-cache" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from clear-autocomplete-cache" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "editbuffer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "hide"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "init"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "integration-ready"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "keyboard-focus-changed"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "pre-exec"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "prompt"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "clear-autocomplete-cache"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand hook; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "app" -d 'Debug the app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "build" -d 'Switch to another branch of a Fig.js app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "autocomplete-window" -d 'Toggle/set autocomplete window debug mode'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "logs" -d 'Show debug logs'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "prompt-accessibility" -d 'Prompt accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "sample" -d 'Sample desktop process'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "accessibility" -d 'Accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "key-tester" -d 'Key Tester'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "diagnostics" -d 'Watches diagnostics'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "query-index" -d 'Queries remote repository for updates given the specified metadata'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "devtools" -d 'Open up the devtools of a specific webview'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "get-index" -d 'Displays remote index'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "list-intellij-variants" -d 'Lists installed IntelliJ variants'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "shell" -d 'Disables sourcing of user shell config and instead uses a minimal shell config'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "fix-permissions" -d 'Update the shell config permissions to have the correct owner and access rights'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "refresh-auth-token"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and not __fish_seen_subcommand_from app build autocomplete-window logs prompt-accessibility sample accessibility key-tester diagnostics query-index devtools get-index list-intellij-variants shell fix-permissions refresh-auth-token help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from app" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from app" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from build" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from build" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from autocomplete-window" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from autocomplete-window" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from logs" -l level -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from logs" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from logs" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from prompt-accessibility" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from prompt-accessibility" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from sample" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from sample" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from accessibility" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from accessibility" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from key-tester" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from key-tester" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from diagnostics" -l rate -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from diagnostics" -l watch
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from diagnostics" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from diagnostics" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s c -l channel -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s t -l target-triple -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s V -l variant -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s e -l version -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s o -l override-threshold -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s f -l file-type -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s r -l enable-rollout
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s i -l is-auto-update
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from query-index" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from devtools" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from devtools" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from get-index" -s d -l debug -d 'Display using debug formatting'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from get-index" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from get-index" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from list-intellij-variants" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from list-intellij-variants" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from shell" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from shell" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from fix-permissions" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from fix-permissions" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from refresh-auth-token" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from refresh-auth-token" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "app" -d 'Debug the app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "build" -d 'Switch to another branch of a Fig.js app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "autocomplete-window" -d 'Toggle/set autocomplete window debug mode'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "logs" -d 'Show debug logs'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "prompt-accessibility" -d 'Prompt accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "sample" -d 'Sample desktop process'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "accessibility" -d 'Accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "key-tester" -d 'Key Tester'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "diagnostics" -d 'Watches diagnostics'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "query-index" -d 'Queries remote repository for updates given the specified metadata'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "devtools" -d 'Open up the devtools of a specific webview'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "get-index" -d 'Displays remote index'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "list-intellij-variants" -d 'Lists installed IntelliJ variants'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "shell" -d 'Disables sourcing of user shell config and instead uses a minimal shell config'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "fix-permissions" -d 'Update the shell config permissions to have the correct owner and access rights'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "refresh-auth-token"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -s f -l format -d 'Format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -s d -l delete -d 'Delete a key (No value needed)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -l global -d 'Set or delete in global settings (default)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -l workspace -d 'Set or delete in workspace settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -a "open" -d 'Open the settings file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -a "list" -d 'List settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -a "all" -d 'List configured settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and not __fish_seen_subcommand_from open list all help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from open" -l global -d 'Open global settings file (default)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from open" -l workspace -d 'Open workspace settings file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from open" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from list" -s f -l format -d 'Format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from list" -l all -d 'Show all available settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from all" -s f -l format -d 'Format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from all" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from all" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open the settings file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "list" -d 'List settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "all" -d 'List configured settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -l dotfiles -d 'Install only the shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -l input-method -d 'Prompt input method installation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -l no-confirm -d 'Don\'t confirm automatic installation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -l force -d 'Force installation of q'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -l global -d 'Install q globally'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand setup" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand uninstall" -s y -l no-confirm -d 'Force uninstall'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand uninstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand uninstall" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand update" -s y -l non-interactive -d 'Don\'t prompt for confirmation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand update" -l relaunch-dashboard -d 'Relaunch into dashboard after update (false will launch in background)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand update" -l rollout -d 'Uses rollout'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand update" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand update" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand diagnostic" -s f -l format -d 'The format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand diagnostic" -l force -d 'Force limited diagnostic output'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand diagnostic" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand diagnostic" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand init" -l rcfile -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand init" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand theme" -l list
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand theme" -l folder
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand theme" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand theme" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand issue" -s f -l force -d 'Force issue creation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand issue" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand issue" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -l license -d 'License type (pro for Identity Center, free for Builder ID, Google and Github)' -r -f -a "free\t'Free license (Builder ID or Social login)'
pro\t'Pro license with Identity Center'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -l identity-provider -d 'Identity provider URL (for Identity Center)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -l region -d 'Region (for Identity Center)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -l use-device-flow -d 'Always use the OAuth device flow for authentication. Useful for instances where browser redirects cannot be handled'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand logout" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand logout" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand whoami" -s f -l format -d 'Output format to use' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand whoami" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand whoami" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand profile" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand profile" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -f -a "login" -d 'Login'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -f -a "logout" -d 'Logout'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -f -a "whoami" -d 'Prints details about the current user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -f -a "profile" -d 'Show the profile associated with this idc user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and not __fish_seen_subcommand_from login logout whoami profile help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -l license -d 'License type (pro for Identity Center, free for Builder ID, Google and Github)' -r -f -a "free\t'Free license (Builder ID or Social login)'
pro\t'Pro license with Identity Center'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -l identity-provider -d 'Identity provider URL (for Identity Center)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -l region -d 'Region (for Identity Center)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -l use-device-flow -d 'Always use the OAuth device flow for authentication. Useful for instances where browser redirects cannot be handled'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from logout" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from whoami" -s f -l format -d 'Output format to use' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from whoami" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from whoami" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from profile" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from profile" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "login" -d 'Login'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Logout'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "whoami" -d 'Prints details about the current user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "profile" -d 'Show the profile associated with this idc user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand doctor" -s a -l all -d 'Run all doctor tests, with no fixes'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand doctor" -s s -l strict -d 'Error on warnings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand doctor" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand doctor" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand completion" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "pre-cmd" -d 'Command that is run during the PreCmd section of the Amazon Q integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "local-state" -d 'Change the local-state file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "callback" -d 'Callback used for the internal pseudoterminal'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "install" -d 'Install the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "uninstall" -d 'Uninstall the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "get-shell"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "hostname"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "should-figterm-launch" -d 'Detects if Figterm should be launched'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "event"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "sockets-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "stream-from-socket"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "figterm-socket-path"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "ipc"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "uninstall-for-all-users"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "remove-data-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "uuidgen"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "ibus-bootstrap"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "detect-sandbox" -d 'Checks for sandboxing'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "open-uninstall-page"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "ssh-local-command" -d 'Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "prompt-ssh" -d '\\[Deprecated\\] Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "dump-state"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "finish-update" -d 'Currently only used by macOS after finishing an update. The old binary calls `FinishUpdate` on the new binary at the end of updating'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "generate-ssh" -d 'Generates an SSH configuration file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "inline-shell-completion"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "inline-shell-completion-accept"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "multiplexer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and not __fish_seen_subcommand_from pre-cmd local-state callback install uninstall get-shell hostname should-figterm-launch event sockets-dir stream-from-socket figterm-socket-path ipc uninstall-for-all-users remove-data-dir uuidgen ibus-bootstrap detect-sandbox open-uninstall-page ssh-local-command prompt-ssh dump-state finish-update generate-ssh inline-shell-completion inline-shell-completion-accept multiplexer help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from pre-cmd" -l alias -d '(Deprecated) Alias content passed via argv. Avoid using this due to audit logging of argv' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from pre-cmd" -l alias-stdin -d 'Read alias content from stdin (preferred). This avoids putting sensitive aliases in argv'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from pre-cmd" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from pre-cmd" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -s f -l format -d 'Format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -s d -l delete -d 'Delete the state'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -a "init" -d 'Reload the state listener'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -a "all" -d 'List all the settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from local-state" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from callback" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from callback" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -l dotfiles -d 'Install only the shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -l input-method -d 'Prompt input method installation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -l no-confirm -d 'Don\'t confirm automatic installation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -l force -d 'Force installation of q'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -l global -d 'Install q globally'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -l dotfiles -d 'Uninstall only the shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -l input-method -d 'Uninstall only the input method'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -l binary -d 'Uninstall only the binary'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -l ssh -d 'Uninstall only the ssh integration'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from get-shell" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from get-shell" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from hostname" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from hostname" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from should-figterm-launch" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from should-figterm-launch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from event" -l name -d 'Name of the event' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from event" -l payload -d 'Payload of the event as a JSON string' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from event" -l apps -d 'Apps to send the event to' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from event" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from event" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from sockets-dir" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from sockets-dir" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from stream-from-socket" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from stream-from-socket" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from figterm-socket-path" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from figterm-socket-path" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -l figterm -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -l json -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -l app
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -l recv
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ipc" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall-for-all-users" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uninstall-for-all-users" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from remove-data-dir" -l force
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from remove-data-dir" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from remove-data-dir" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uuidgen" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from uuidgen" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ibus-bootstrap" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ibus-bootstrap" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from detect-sandbox" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from detect-sandbox" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from open-uninstall-page" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from open-uninstall-page" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ssh-local-command" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from ssh-local-command" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from prompt-ssh" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from prompt-ssh" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from dump-state" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from dump-state" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from finish-update" -l delete-bundle -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from finish-update" -l relaunch-dashboard
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from finish-update" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from finish-update" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from generate-ssh" -l remote-host -d 'The remote host' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from generate-ssh" -l remote-port -d 'The remote port' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from generate-ssh" -l remote-username -d 'The remote username' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from generate-ssh" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from generate-ssh" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion" -l buffer -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion-accept" -l buffer -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion-accept" -l suggestion -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion-accept" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from inline-shell-completion-accept" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from multiplexer" -l port -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from multiplexer" -l websocket
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from multiplexer" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from multiplexer" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "pre-cmd" -d 'Command that is run during the PreCmd section of the Amazon Q integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "local-state" -d 'Change the local-state file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "callback" -d 'Callback used for the internal pseudoterminal'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstall the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "get-shell"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "hostname"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "should-figterm-launch" -d 'Detects if Figterm should be launched'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "event"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "sockets-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "stream-from-socket"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "figterm-socket-path"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "ipc"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "uninstall-for-all-users"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "remove-data-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "uuidgen"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "ibus-bootstrap"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "detect-sandbox" -d 'Checks for sandboxing'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "open-uninstall-page"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "ssh-local-command" -d 'Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "prompt-ssh" -d '\\[Deprecated\\] Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "dump-state"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "finish-update" -d 'Currently only used by macOS after finishing an update. The old binary calls `FinishUpdate` on the new binary at the end of updating'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "generate-ssh" -d 'Generates an SSH configuration file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "inline-shell-completion"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "inline-shell-completion-accept"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "multiplexer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand internal; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand launch" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand launch" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand quit" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand quit" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand restart" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand restart" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -f -a "install"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -f -a "uninstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -f -a "reinstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and not __fish_seen_subcommand_from install uninstall reinstall status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -s s -l silent -d 'Suppress status messages'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "dotfiles"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "input-method"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "vscode"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "intellij-plugin"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "autostart-entry"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "gnome-shell-extension"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "kiro-command-router"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "all"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from install" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -s s -l silent -d 'Suppress status messages'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "dotfiles"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "input-method"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "vscode"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "intellij-plugin"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "autostart-entry"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "gnome-shell-extension"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "kiro-command-router"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "all"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from uninstall" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -s s -l silent -d 'Suppress status messages'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "dotfiles"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "input-method"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "vscode"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "intellij-plugin"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "autostart-entry"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "gnome-shell-extension"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "kiro-command-router"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "all"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from reinstall" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -s f -l format -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "dotfiles"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "input-method"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "vscode"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "intellij-plugin"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "autostart-entry"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "gnome-shell-extension"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "kiro-command-router"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "all"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from status" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "install"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "uninstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "reinstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand integrations; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand translate" -s n -l n -d 'Number of completions to generate (must be <=5)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand translate" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand translate" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -f -a "enable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -f -a "disable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and not __fish_seen_subcommand_from enable disable status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from enable" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from disable" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from status" -s f -l format -d 'Format of the output' -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from status" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from help" -f -a "enable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from help" -f -a "disable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from help" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand telemetry; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand version" -l changelog -d 'Show the changelog (use --changelog=all for all versions, or --changelog=x.x.x for a specific version)' -r
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand version" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand version" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand dashboard" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand dashboard" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand chat" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand mcp" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "enable" -d 'Enables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "disable" -d 'Disables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "status" -d 'Shows the status of inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "set-customization" -d 'Select a customization if you have any available'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "show-customizations" -d 'Show the available customizations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and not __fish_seen_subcommand_from enable disable status set-customization show-customizations help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from enable" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from disable" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from status" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from set-customization" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from set-customization" -s h -l help -d 'Print help'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from show-customizations" -s f -l format -r -f -a "plain\t'Outputs the results as markdown'
json\t'Outputs the results as JSON'
json-pretty\t'Outputs the results as pretty print JSON'"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from show-customizations" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from show-customizations" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "enable" -d 'Enables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "disable" -d 'Disables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "status" -d 'Shows the status of inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "set-customization" -d 'Select a customization if you have any available'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "show-customizations" -d 'Show the available customizations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand inline; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand agent" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand acp" -s v -l verbose -d 'Increase logging verbosity'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "hook" -d 'Hook commands'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "debug" -d 'Debug the app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "settings" -d 'Customize appearance & behavior'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "setup" -d 'Setup cli components'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "uninstall" -d 'Uninstall Amazon Q'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "update" -d 'Update the Kiro application'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "diagnostic" -d 'Run diagnostic tests'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "init" -d 'Generate the dotfiles for the given shell'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "theme" -d 'Get or set theme'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "issue" -d 'Create a new Github issue'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "login" -d 'Login'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "logout" -d 'Logout'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "whoami" -d 'Prints details about the current user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "profile" -d 'Show the profile associated with this idc user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "user" -d 'Manage your account'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "doctor" -d 'Fix and diagnose common issues'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "completion" -d 'Generate CLI completion spec'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "internal" -d 'Internal subcommands'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "launch" -d 'Launch the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "quit" -d 'Quit the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "restart" -d 'Restart the desktop app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "integrations" -d 'Manage system integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "translate" -d 'Natural Language to Shell translation'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "telemetry" -d 'Enable/disable telemetry'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "version" -d 'Version'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "dashboard" -d 'Open the dashboard'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "chat" -d 'AI assistant in your terminal'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "mcp" -d 'Model Context Protocol (MCP)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "inline" -d 'Inline shell completions'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "agent" -d 'Agent root commands'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "acp" -d 'Agent Client Protocol (ACP)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and not __fish_seen_subcommand_from hook debug settings setup uninstall update diagnostic init theme issue login logout whoami profile user doctor completion internal launch quit restart integrations translate telemetry version dashboard chat mcp inline agent acp help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "editbuffer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "hide"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "init"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "integration-ready"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "keyboard-focus-changed"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "pre-exec"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "prompt"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "ssh"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from hook" -f -a "clear-autocomplete-cache"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "app" -d 'Debug the app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "build" -d 'Switch to another branch of a Fig.js app'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "autocomplete-window" -d 'Toggle/set autocomplete window debug mode'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "logs" -d 'Show debug logs'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "prompt-accessibility" -d 'Prompt accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "sample" -d 'Sample desktop process'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "accessibility" -d 'Accessibility'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "key-tester" -d 'Key Tester'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "diagnostics" -d 'Watches diagnostics'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "query-index" -d 'Queries remote repository for updates given the specified metadata'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "devtools" -d 'Open up the devtools of a specific webview'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "get-index" -d 'Displays remote index'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "list-intellij-variants" -d 'Lists installed IntelliJ variants'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "shell" -d 'Disables sourcing of user shell config and instead uses a minimal shell config'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "fix-permissions" -d 'Update the shell config permissions to have the correct owner and access rights'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from debug" -f -a "refresh-auth-token"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "open" -d 'Open the settings file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "list" -d 'List settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "all" -d 'List configured settings'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "login" -d 'Login'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "logout" -d 'Logout'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "whoami" -d 'Prints details about the current user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "profile" -d 'Show the profile associated with this idc user'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "pre-cmd" -d 'Command that is run during the PreCmd section of the Amazon Q integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "local-state" -d 'Change the local-state file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "callback" -d 'Callback used for the internal pseudoterminal'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "install" -d 'Install the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "uninstall" -d 'Uninstall the Amazon Q cli'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "get-shell"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "hostname"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "should-figterm-launch" -d 'Detects if Figterm should be launched'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "event"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "sockets-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "stream-from-socket"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "figterm-socket-path"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "ipc"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "uninstall-for-all-users"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "remove-data-dir"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "uuidgen"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "ibus-bootstrap"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "detect-sandbox" -d 'Checks for sandboxing'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "open-uninstall-page"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "ssh-local-command" -d 'Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "prompt-ssh" -d '\\[Deprecated\\] Displays prompt to install remote shell integrations'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "dump-state"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "finish-update" -d 'Currently only used by macOS after finishing an update. The old binary calls `FinishUpdate` on the new binary at the end of updating'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "generate-ssh" -d 'Generates an SSH configuration file'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "inline-shell-completion"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "inline-shell-completion-accept"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from internal" -f -a "multiplexer"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "install"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "uninstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "reinstall"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from integrations" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from telemetry" -f -a "enable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from telemetry" -f -a "disable"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from telemetry" -f -a "status"
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from inline" -f -a "enable" -d 'Enables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from inline" -f -a "disable" -d 'Disables inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from inline" -f -a "status" -d 'Shows the status of inline'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from inline" -f -a "set-customization" -d 'Select a customization if you have any available'
complete -c kiro-cli -n "__fish_kiro_cli_using_subcommand help; and __fish_seen_subcommand_from inline" -f -a "show-customizations" -d 'Show the available customizations'

