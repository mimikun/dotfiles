# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_purple_global_optspecs
	string join \n c/connect= l/list config= demo completions= theme= verbose h/help V/version
end

function __fish_purple_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_purple_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_purple_using_subcommand
	set -l cmd (__fish_purple_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c purple -n "__fish_purple_needs_command" -s c -l connect -d 'Connect directly to a host by alias (skip the TUI)' -r
complete -c purple -n "__fish_purple_needs_command" -l config -d 'Path to SSH config file' -r
complete -c purple -n "__fish_purple_needs_command" -l completions -d 'Generate shell completions' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c purple -n "__fish_purple_needs_command" -l theme -d 'Override theme for this session' -r
complete -c purple -n "__fish_purple_needs_command" -s l -l list -d 'List all configured hosts'
complete -c purple -n "__fish_purple_needs_command" -l demo -d 'Launch with demo data (no real config needed)'
complete -c purple -n "__fish_purple_needs_command" -l verbose -d 'Enable verbose logging (debug level)'
complete -c purple -n "__fish_purple_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c purple -n "__fish_purple_needs_command" -s V -l version -d 'Print version'
complete -c purple -n "__fish_purple_needs_command" -a "add" -d 'Quick-add a host: purple add user@host:port --alias myserver'
complete -c purple -n "__fish_purple_needs_command" -a "import" -d 'Import hosts from a file or known_hosts'
complete -c purple -n "__fish_purple_needs_command" -a "sync" -d 'Sync hosts from cloud providers (DigitalOcean, Vultr, Linode, Hetzner, UpCloud, Proxmox VE, AWS EC2, Scaleway, GCP, Azure, Tailscale, Oracle Cloud, OVHcloud, Leaseweb, i3D.net, TransIP)'
complete -c purple -n "__fish_purple_needs_command" -a "provider" -d 'Manage cloud provider configurations'
complete -c purple -n "__fish_purple_needs_command" -a "tunnel" -d 'Manage SSH tunnels'
complete -c purple -n "__fish_purple_needs_command" -a "password" -d 'Manage passwords in the OS keychain for SSH hosts'
complete -c purple -n "__fish_purple_needs_command" -a "snippet" -d 'Manage command snippets for quick execution on hosts'
complete -c purple -n "__fish_purple_needs_command" -a "update" -d 'Update purple to the latest version'
complete -c purple -n "__fish_purple_needs_command" -a "mcp" -d 'Start MCP server (Model Context Protocol) for AI agent integration'
complete -c purple -n "__fish_purple_needs_command" -a "theme" -d 'Manage color themes'
complete -c purple -n "__fish_purple_needs_command" -a "vault" -d 'HashiCorp Vault SSH secrets engine operations (signed SSH certificates)'
complete -c purple -n "__fish_purple_needs_command" -a "logs" -d 'View or manage log file'
complete -c purple -n "__fish_purple_needs_command" -a "whats-new" -d 'Print release notes since a prior version'
complete -c purple -n "__fish_purple_needs_command" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand add" -s a -l alias -d 'Alias for the host (default: derived from hostname)' -r
complete -c purple -n "__fish_purple_using_subcommand add" -s k -l key -d 'Path to identity file (SSH key)' -r
complete -c purple -n "__fish_purple_using_subcommand add" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand import" -s g -l group -d 'Group label for imported hosts' -r
complete -c purple -n "__fish_purple_using_subcommand import" -l known-hosts -d 'Import from ~/.ssh/known_hosts instead'
complete -c purple -n "__fish_purple_using_subcommand import" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand sync" -l dry-run -d 'Preview changes without modifying config'
complete -c purple -n "__fish_purple_using_subcommand sync" -l remove -d 'Remove hosts that no longer exist on the provider'
complete -c purple -n "__fish_purple_using_subcommand sync" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand provider; and not __fish_seen_subcommand_from add list remove help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand provider; and not __fish_seen_subcommand_from add list remove help" -f -a "add" -d 'Add or update a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand provider; and not __fish_seen_subcommand_from add list remove help" -f -a "list" -d 'List configured providers'
complete -c purple -n "__fish_purple_using_subcommand provider; and not __fish_seen_subcommand_from add list remove help" -f -a "remove" -d 'Remove a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand provider; and not __fish_seen_subcommand_from add list remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l token -d 'API token (or set PURPLE_TOKEN env var, or use --token-stdin)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l prefix -d 'Alias prefix (default: provider short label)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l user -d 'Default SSH user (default: root)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l key -d 'Default identity file' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l url -d 'Base URL for self-hosted providers (required for Proxmox)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l profile -d 'AWS credential profile from ~/.aws/credentials' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l regions -d 'Comma-separated regions, zones or subscription IDs (e.g. us-east-1,eu-west-1 for AWS, fr-par-1,nl-ams-1 for Scaleway, us-central1-a for GCP zones or subscription UUIDs for Azure)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l project -d 'GCP project ID' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l compartment -d 'OCI compartment OCID (Oracle)' -r
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l token-stdin -d 'Read token from stdin (e.g. from a password manager)'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l no-verify-tls -d 'Skip TLS certificate verification (for self-signed certs)'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l verify-tls -d 'Explicitly enable TLS certificate verification (overrides stored setting)'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l auto-sync -d 'Enable automatic sync on startup'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -l no-auto-sync -d 'Disable automatic sync on startup'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add or update a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from help" -f -a "list" -d 'List configured providers'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand provider; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -f -a "list" -d 'List configured tunnels'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -f -a "add" -d 'Add a tunnel to a host'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -f -a "remove" -d 'Remove a tunnel from a host'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -f -a "start" -d 'Start a tunnel (foreground, Ctrl+C to stop)'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and not __fish_seen_subcommand_from list add remove start help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from help" -f -a "list" -d 'List configured tunnels'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a tunnel to a host'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a tunnel from a host'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start a tunnel (foreground, Ctrl+C to stop)'
complete -c purple -n "__fish_purple_using_subcommand tunnel; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand password; and not __fish_seen_subcommand_from set remove help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand password; and not __fish_seen_subcommand_from set remove help" -f -a "set" -d 'Store a password in the OS keychain for a host'
complete -c purple -n "__fish_purple_using_subcommand password; and not __fish_seen_subcommand_from set remove help" -f -a "remove" -d 'Remove a password from the OS keychain'
complete -c purple -n "__fish_purple_using_subcommand password; and not __fish_seen_subcommand_from set remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand password; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand password; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "set" -d 'Store a password in the OS keychain for a host'
complete -c purple -n "__fish_purple_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a password from the OS keychain'
complete -c purple -n "__fish_purple_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -f -a "list" -d 'List all saved snippets'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -f -a "add" -d 'Add a new snippet'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -f -a "remove" -d 'Remove a snippet'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -f -a "run" -d 'Run a snippet on one or more hosts'
complete -c purple -n "__fish_purple_using_subcommand snippet; and not __fish_seen_subcommand_from list add remove run help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from add" -l description -d 'Short description' -r
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from run" -l tag -d 'Run on all hosts matching this tag' -r
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from run" -l all -d 'Run on all hosts'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from run" -l parallel -d 'Run on hosts concurrently'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all saved snippets'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a new snippet'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a snippet'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from help" -f -a "run" -d 'Run a snippet on one or more hosts'
complete -c purple -n "__fish_purple_using_subcommand snippet; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand update" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand mcp" -l audit-log -d 'Custom path for the MCP audit log (default: ~/.purple/mcp-audit.log). Ignored when --no-audit is set' -r
complete -c purple -n "__fish_purple_using_subcommand mcp" -l read-only -d 'Restrict tools to read-only operations. Denies run_command and container_action, and removes them from tools/list. Recommended when exposing purple to autonomous agents'
complete -c purple -n "__fish_purple_using_subcommand mcp" -l no-audit -d 'Disable the MCP audit log. By default every tool call is appended to ~/.purple/mcp-audit.log as JSON Lines'
complete -c purple -n "__fish_purple_using_subcommand mcp" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand theme; and not __fish_seen_subcommand_from list set help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand theme; and not __fish_seen_subcommand_from list set help" -f -a "list" -d 'List available themes'
complete -c purple -n "__fish_purple_using_subcommand theme; and not __fish_seen_subcommand_from list set help" -f -a "set" -d 'Set the active theme'
complete -c purple -n "__fish_purple_using_subcommand theme; and not __fish_seen_subcommand_from list set help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand theme; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand theme; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand theme; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available themes'
complete -c purple -n "__fish_purple_using_subcommand theme; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set the active theme'
complete -c purple -n "__fish_purple_using_subcommand theme; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand vault; and not __fish_seen_subcommand_from sign help" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand vault; and not __fish_seen_subcommand_from sign help" -f -a "sign" -d 'Sign an SSH certificate for a host (or --all) via the Vault SSH secrets engine'
complete -c purple -n "__fish_purple_using_subcommand vault; and not __fish_seen_subcommand_from sign help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand vault; and __fish_seen_subcommand_from sign" -l vault-addr -d 'Override VAULT_ADDR for this invocation only. Highest precedence: flag > per-host comment > provider default > shell env' -r
complete -c purple -n "__fish_purple_using_subcommand vault; and __fish_seen_subcommand_from sign" -l all -d 'Sign all hosts with a Vault SSH role configured'
complete -c purple -n "__fish_purple_using_subcommand vault; and __fish_seen_subcommand_from sign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c purple -n "__fish_purple_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "sign" -d 'Sign an SSH certificate for a host (or --all) via the Vault SSH secrets engine'
complete -c purple -n "__fish_purple_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand logs" -l tail -d 'Follow log output in real time'
complete -c purple -n "__fish_purple_using_subcommand logs" -l clear -d 'Delete the log file'
complete -c purple -n "__fish_purple_using_subcommand logs" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand whats-new" -l since -d 'Only include entries newer than this version (e.g. 2.40.0)' -r
complete -c purple -n "__fish_purple_using_subcommand whats-new" -s h -l help -d 'Print help'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "add" -d 'Quick-add a host: purple add user@host:port --alias myserver'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "import" -d 'Import hosts from a file or known_hosts'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "sync" -d 'Sync hosts from cloud providers (DigitalOcean, Vultr, Linode, Hetzner, UpCloud, Proxmox VE, AWS EC2, Scaleway, GCP, Azure, Tailscale, Oracle Cloud, OVHcloud, Leaseweb, i3D.net, TransIP)'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "provider" -d 'Manage cloud provider configurations'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "tunnel" -d 'Manage SSH tunnels'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "password" -d 'Manage passwords in the OS keychain for SSH hosts'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "snippet" -d 'Manage command snippets for quick execution on hosts'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "update" -d 'Update purple to the latest version'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "mcp" -d 'Start MCP server (Model Context Protocol) for AI agent integration'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "theme" -d 'Manage color themes'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "vault" -d 'HashiCorp Vault SSH secrets engine operations (signed SSH certificates)'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "logs" -d 'View or manage log file'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "whats-new" -d 'Print release notes since a prior version'
complete -c purple -n "__fish_purple_using_subcommand help; and not __fish_seen_subcommand_from add import sync provider tunnel password snippet update mcp theme vault logs whats-new help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from provider" -f -a "add" -d 'Add or update a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from provider" -f -a "list" -d 'List configured providers'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from provider" -f -a "remove" -d 'Remove a provider configuration'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from tunnel" -f -a "list" -d 'List configured tunnels'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from tunnel" -f -a "add" -d 'Add a tunnel to a host'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from tunnel" -f -a "remove" -d 'Remove a tunnel from a host'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from tunnel" -f -a "start" -d 'Start a tunnel (foreground, Ctrl+C to stop)'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from password" -f -a "set" -d 'Store a password in the OS keychain for a host'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from password" -f -a "remove" -d 'Remove a password from the OS keychain'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from snippet" -f -a "list" -d 'List all saved snippets'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from snippet" -f -a "add" -d 'Add a new snippet'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from snippet" -f -a "remove" -d 'Remove a snippet'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from snippet" -f -a "run" -d 'Run a snippet on one or more hosts'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from theme" -f -a "list" -d 'List available themes'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from theme" -f -a "set" -d 'Set the active theme'
complete -c purple -n "__fish_purple_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "sign" -d 'Sign an SSH certificate for a host (or --all) via the Vault SSH secrets engine'
