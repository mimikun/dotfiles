# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_codex_global_optspecs
	string join \n c/config= enable= disable= i/image= m/model= oss p/profile= s/sandbox= a/ask-for-approval= full-auto dangerously-bypass-approvals-and-sandbox C/cd= search h/help V/version
end

function __fish_codex_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_codex_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_codex_using_subcommand
	set -l cmd (__fish_codex_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c codex -n "__fish_codex_needs_command" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_needs_command" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_needs_command" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_needs_command" -s i -l image -d 'Optional image(s) to attach to the initial prompt' -r -F
complete -c codex -n "__fish_codex_needs_command" -s m -l model -d 'Model the agent should use' -r
complete -c codex -n "__fish_codex_needs_command" -s p -l profile -d 'Configuration profile from config.toml to specify default options' -r
complete -c codex -n "__fish_codex_needs_command" -s s -l sandbox -d 'Select the sandbox policy to use when executing model-generated shell commands' -r -f -a "read-only\t''
workspace-write\t''
danger-full-access\t''"
complete -c codex -n "__fish_codex_needs_command" -s a -l ask-for-approval -d 'Configure when the model requires human approval before executing a command' -r -f -a "untrusted\t'Only run "trusted" commands (e.g. ls, cat, sed) without asking for user approval. Will escalate to the user if the model proposes a command that is not in the "trusted" set'
on-failure\t'Run all commands without asking for user approval. Only asks for approval if a command fails to execute, in which case it will escalate to the user to ask for un-sandboxed execution'
on-request\t'The model decides when to ask the user for approval'
never\t'Never ask for user approval Execution failures are immediately returned to the model'"
complete -c codex -n "__fish_codex_needs_command" -s C -l cd -d 'Tell the agent to use the specified directory as its working root' -r -F
complete -c codex -n "__fish_codex_needs_command" -l oss -d 'Convenience flag to select the local open source model provider. Equivalent to -c model_provider=oss; verifies a local Ollama server is running'
complete -c codex -n "__fish_codex_needs_command" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (-a on-failure, --sandbox workspace-write)'
complete -c codex -n "__fish_codex_needs_command" -l dangerously-bypass-approvals-and-sandbox -d 'Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed'
complete -c codex -n "__fish_codex_needs_command" -l search -d 'Enable web search (off by default). When enabled, the native Responses `web_search` tool is available to the model (no per‑call approval)'
complete -c codex -n "__fish_codex_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_needs_command" -s V -l version -d 'Print version'
complete -c codex -n "__fish_codex_needs_command" -a "exec" -d 'Run Codex non-interactively'
complete -c codex -n "__fish_codex_needs_command" -a "e" -d 'Run Codex non-interactively'
complete -c codex -n "__fish_codex_needs_command" -a "login" -d 'Manage login'
complete -c codex -n "__fish_codex_needs_command" -a "logout" -d 'Remove stored authentication credentials'
complete -c codex -n "__fish_codex_needs_command" -a "mcp" -d '[experimental] Run Codex as an MCP server and manage MCP servers'
complete -c codex -n "__fish_codex_needs_command" -a "mcp-server" -d '[experimental] Run the Codex MCP server (stdio transport)'
complete -c codex -n "__fish_codex_needs_command" -a "app-server" -d '[experimental] Run the app server'
complete -c codex -n "__fish_codex_needs_command" -a "completion" -d 'Generate shell completion scripts'
complete -c codex -n "__fish_codex_needs_command" -a "sandbox" -d 'Run commands within a Codex-provided sandbox'
complete -c codex -n "__fish_codex_needs_command" -a "debug" -d 'Run commands within a Codex-provided sandbox'
complete -c codex -n "__fish_codex_needs_command" -a "apply" -d 'Apply the latest diff produced by Codex agent as a `git apply` to your local working tree'
complete -c codex -n "__fish_codex_needs_command" -a "a" -d 'Apply the latest diff produced by Codex agent as a `git apply` to your local working tree'
complete -c codex -n "__fish_codex_needs_command" -a "resume" -d 'Resume a previous interactive session (picker by default; use --last to continue the most recent)'
complete -c codex -n "__fish_codex_needs_command" -a "generate-ts" -d 'Internal: generate TypeScript protocol bindings'
complete -c codex -n "__fish_codex_needs_command" -a "cloud" -d '[EXPERIMENTAL] Browse tasks from Codex Cloud and apply changes locally'
complete -c codex -n "__fish_codex_needs_command" -a "responses-api-proxy" -d 'Internal: run the responses API proxy'
complete -c codex -n "__fish_codex_needs_command" -a "features" -d 'Inspect feature flags'
complete -c codex -n "__fish_codex_needs_command" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s i -l image -d 'Optional image(s) to attach to the initial prompt' -r -F
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s m -l model -d 'Model the agent should use' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s s -l sandbox -d 'Select the sandbox policy to use when executing model-generated shell commands' -r -f -a "read-only\t''
workspace-write\t''
danger-full-access\t''"
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s p -l profile -d 'Configuration profile from config.toml to specify default options' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s C -l cd -d 'Tell the agent to use the specified directory as its working root' -r -F
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l output-schema -d 'Path to a JSON Schema file describing the model\'s final response shape' -r -F
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l color -d 'Specifies color settings for use in the output' -r -f -a "always\t''
never\t''
auto\t''"
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s o -l output-last-message -d 'Specifies file where the last message from the agent should be written' -r -F
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l oss
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (-a on-failure, --sandbox workspace-write)'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l dangerously-bypass-approvals-and-sandbox -d 'Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l skip-git-repo-check -d 'Allow running Codex outside a Git repository'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l json -d 'Print events to stdout as JSONL'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -l include-plan-tool -d 'Whether to include the plan tool in the conversation'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -s V -l version -d 'Print version'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -a "resume" -d 'Resume a previous session by id or pick the most recent with --last'
complete -c codex -n "__fish_codex_using_subcommand exec; and not __fish_seen_subcommand_from resume help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from resume" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from resume" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from resume" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from resume" -l last -d 'Resume the most recent recorded session (newest) without specifying an id'
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from resume" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from help" -f -a "resume" -d 'Resume a previous session by id or pick the most recent with --last'
complete -c codex -n "__fish_codex_using_subcommand exec; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s i -l image -d 'Optional image(s) to attach to the initial prompt' -r -F
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s m -l model -d 'Model the agent should use' -r
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s s -l sandbox -d 'Select the sandbox policy to use when executing model-generated shell commands' -r -f -a "read-only\t''
workspace-write\t''
danger-full-access\t''"
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s p -l profile -d 'Configuration profile from config.toml to specify default options' -r
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s C -l cd -d 'Tell the agent to use the specified directory as its working root' -r -F
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l output-schema -d 'Path to a JSON Schema file describing the model\'s final response shape' -r -F
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l color -d 'Specifies color settings for use in the output' -r -f -a "always\t''
never\t''
auto\t''"
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s o -l output-last-message -d 'Specifies file where the last message from the agent should be written' -r -F
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l oss
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (-a on-failure, --sandbox workspace-write)'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l dangerously-bypass-approvals-and-sandbox -d 'Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l skip-git-repo-check -d 'Allow running Codex outside a Git repository'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l json -d 'Print events to stdout as JSONL'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -l include-plan-tool -d 'Whether to include the plan tool in the conversation'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -s V -l version -d 'Print version'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -a "resume" -d 'Resume a previous session by id or pick the most recent with --last'
complete -c codex -n "__fish_codex_using_subcommand e; and not __fish_seen_subcommand_from resume help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from resume" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from resume" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from resume" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from resume" -l last -d 'Resume the most recent recorded session (newest) without specifying an id'
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from resume" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from help" -f -a "resume" -d 'Resume a previous session by id or pick the most recent with --last'
complete -c codex -n "__fish_codex_using_subcommand e; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l api-key -d '(deprecated) Previously accepted the API key directly; now exits with guidance to use --with-api-key' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l experimental_issuer -d 'EXPERIMENTAL: Use custom OAuth issuer base URL (advanced) Override the OAuth issuer base URL (advanced)' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l experimental_client-id -d 'EXPERIMENTAL: Use custom OAuth client ID (advanced)' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l with-api-key -d 'Read the API key from stdin (e.g. `printenv OPENAI_API_KEY | codex login --with-api-key`)'
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -l device-auth
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -f -a "status" -d 'Show login status'
complete -c codex -n "__fish_codex_using_subcommand login; and not __fish_seen_subcommand_from status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from status" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from status" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from status" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show login status'
complete -c codex -n "__fish_codex_using_subcommand login; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand logout" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand logout" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand logout" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand logout" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "list" -d '[experimental] List configured MCP servers'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "get" -d '[experimental] Show details for a configured MCP server'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "add" -d '[experimental] Add a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "remove" -d '[experimental] Remove a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "login" -d '[experimental] Authenticate with a configured MCP server via OAuth. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "logout" -d '[experimental] Remove stored OAuth credentials for a server. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand mcp; and not __fish_seen_subcommand_from list get add remove login logout help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from list" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from list" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from list" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from list" -l json -d 'Output the configured servers as JSON'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from get" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from get" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from get" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from get" -l json -d 'Output the server configuration as JSON'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -l env -d 'Environment variables to set when launching the server. Only valid with stdio servers' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -l url -d 'URL for a streamable HTTP MCP server' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -l bearer-token-env-var -d 'Optional environment variable to read for a bearer token. Only valid with streamable HTTP servers' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from remove" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from remove" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from remove" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from login" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from login" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from login" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from logout" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from logout" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from logout" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "list" -d '[experimental] List configured MCP servers'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "get" -d '[experimental] Show details for a configured MCP server'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "add" -d '[experimental] Add a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "remove" -d '[experimental] Remove a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "login" -d '[experimental] Authenticate with a configured MCP server via OAuth. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "logout" -d '[experimental] Remove stored OAuth credentials for a server. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand mcp; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand mcp-server" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand mcp-server" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp-server" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand mcp-server" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand app-server" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand app-server" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand app-server" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand app-server" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand completion" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand completion" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand completion" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "macos" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "seatbelt" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "linux" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "landlock" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from macos" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from macos" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from macos" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from macos" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from macos" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from seatbelt" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from seatbelt" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from seatbelt" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from seatbelt" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from seatbelt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from linux" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from linux" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from linux" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from linux" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from linux" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from landlock" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from landlock" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from landlock" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from landlock" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from landlock" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "macos" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "linux" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand sandbox; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "macos" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "seatbelt" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "linux" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "landlock" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and not __fish_seen_subcommand_from macos seatbelt linux landlock help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from macos" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from macos" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from macos" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from macos" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from macos" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from seatbelt" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from seatbelt" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from seatbelt" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from seatbelt" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from seatbelt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from linux" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from linux" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from linux" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from linux" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from linux" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from landlock" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from landlock" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from landlock" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from landlock" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (network-disabled sandbox that can write to cwd and TMPDIR)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from landlock" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "macos" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "linux" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand debug; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand apply" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand apply" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand apply" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand apply" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand a" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand a" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand a" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand resume" -s i -l image -d 'Optional image(s) to attach to the initial prompt' -r -F
complete -c codex -n "__fish_codex_using_subcommand resume" -s m -l model -d 'Model the agent should use' -r
complete -c codex -n "__fish_codex_using_subcommand resume" -s p -l profile -d 'Configuration profile from config.toml to specify default options' -r
complete -c codex -n "__fish_codex_using_subcommand resume" -s s -l sandbox -d 'Select the sandbox policy to use when executing model-generated shell commands' -r -f -a "read-only\t''
workspace-write\t''
danger-full-access\t''"
complete -c codex -n "__fish_codex_using_subcommand resume" -s a -l ask-for-approval -d 'Configure when the model requires human approval before executing a command' -r -f -a "untrusted\t'Only run "trusted" commands (e.g. ls, cat, sed) without asking for user approval. Will escalate to the user if the model proposes a command that is not in the "trusted" set'
on-failure\t'Run all commands without asking for user approval. Only asks for approval if a command fails to execute, in which case it will escalate to the user to ask for un-sandboxed execution'
on-request\t'The model decides when to ask the user for approval'
never\t'Never ask for user approval Execution failures are immediately returned to the model'"
complete -c codex -n "__fish_codex_using_subcommand resume" -s C -l cd -d 'Tell the agent to use the specified directory as its working root' -r -F
complete -c codex -n "__fish_codex_using_subcommand resume" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand resume" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand resume" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand resume" -l last -d 'Continue the most recent session without showing the picker'
complete -c codex -n "__fish_codex_using_subcommand resume" -l oss -d 'Convenience flag to select the local open source model provider. Equivalent to -c model_provider=oss; verifies a local Ollama server is running'
complete -c codex -n "__fish_codex_using_subcommand resume" -l full-auto -d 'Convenience alias for low-friction sandboxed automatic execution (-a on-failure, --sandbox workspace-write)'
complete -c codex -n "__fish_codex_using_subcommand resume" -l dangerously-bypass-approvals-and-sandbox -d 'Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed'
complete -c codex -n "__fish_codex_using_subcommand resume" -l search -d 'Enable web search (off by default). When enabled, the native Responses `web_search` tool is available to the model (no per‑call approval)'
complete -c codex -n "__fish_codex_using_subcommand resume" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand resume" -s V -l version -d 'Print version'
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -s o -l out -d 'Output directory where .ts files will be written' -r -F
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -s p -l prettier -d 'Optional path to the Prettier executable to format generated files' -r -F
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand generate-ts" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -s V -l version -d 'Print version'
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -f -a "exec" -d 'Submit a new Codex Cloud task without launching the TUI'
complete -c codex -n "__fish_codex_using_subcommand cloud; and not __fish_seen_subcommand_from exec help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -l env -d 'Target environment identifier (see `codex cloud` to browse)' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -l attempts -d 'Number of assistant attempts (best-of-N)' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "exec" -d 'Submit a new Codex Cloud task without launching the TUI'
complete -c codex -n "__fish_codex_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -l port -d 'Port to listen on. If not set, an ephemeral port is used' -r
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -l server-info -d 'Path to a JSON file to write startup info (single line). Includes {"port": <u16>}' -r -F
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -l http-shutdown -d 'Enable HTTP shutdown endpoint at GET /shutdown'
complete -c codex -n "__fish_codex_using_subcommand responses-api-proxy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List known features with their stage and effective state'
complete -c codex -n "__fish_codex_using_subcommand features; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from list" -s c -l config -d 'Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as JSON. If it fails to parse as JSON, the raw string is used as a literal' -r
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from list" -l enable -d 'Enable a feature (repeatable). Equivalent to `-c features.<name>=true`' -r
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from list" -l disable -d 'Disable a feature (repeatable). Equivalent to `-c features.<name>=false`' -r
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from help" -f -a "list" -d 'List known features with their stage and effective state'
complete -c codex -n "__fish_codex_using_subcommand features; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "exec" -d 'Run Codex non-interactively'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "login" -d 'Manage login'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "logout" -d 'Remove stored authentication credentials'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "mcp" -d '[experimental] Run Codex as an MCP server and manage MCP servers'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "mcp-server" -d '[experimental] Run the Codex MCP server (stdio transport)'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "app-server" -d '[experimental] Run the app server'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "completion" -d 'Generate shell completion scripts'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "sandbox" -d 'Run commands within a Codex-provided sandbox'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "apply" -d 'Apply the latest diff produced by Codex agent as a `git apply` to your local working tree'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "resume" -d 'Resume a previous interactive session (picker by default; use --last to continue the most recent)'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "generate-ts" -d 'Internal: generate TypeScript protocol bindings'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "cloud" -d '[EXPERIMENTAL] Browse tasks from Codex Cloud and apply changes locally'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "responses-api-proxy" -d 'Internal: run the responses API proxy'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "features" -d 'Inspect feature flags'
complete -c codex -n "__fish_codex_using_subcommand help; and not __fish_seen_subcommand_from exec login logout mcp mcp-server app-server completion sandbox apply resume generate-ts cloud responses-api-proxy features help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from exec" -f -a "resume" -d 'Resume a previous session by id or pick the most recent with --last'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from login" -f -a "status" -d 'Show login status'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "list" -d '[experimental] List configured MCP servers'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "get" -d '[experimental] Show details for a configured MCP server'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "add" -d '[experimental] Add a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "remove" -d '[experimental] Remove a global MCP server entry'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "login" -d '[experimental] Authenticate with a configured MCP server via OAuth. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from mcp" -f -a "logout" -d '[experimental] Remove stored OAuth credentials for a server. Requires experimental_use_rmcp_client = true in config.toml'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "macos" -d 'Run a command under Seatbelt (macOS only)'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from sandbox" -f -a "linux" -d 'Run a command under Landlock+seccomp (Linux only)'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "exec" -d 'Submit a new Codex Cloud task without launching the TUI'
complete -c codex -n "__fish_codex_using_subcommand help; and __fish_seen_subcommand_from features" -f -a "list" -d 'List known features with their stage and effective state'
