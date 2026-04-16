# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_unifly_global_optspecs
	string join \n p/profile= c/controller= s/site= api-key= host-id= o/output= color= theme= v/verbose q/quiet y/yes totp= no-cache demo k/insecure timeout= h/help V/version
end

function __fish_unifly_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_unifly_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_unifly_using_subcommand
	set -l cmd (__fish_unifly_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c unifly -n "__fish_unifly_needs_command" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_needs_command" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_needs_command" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_needs_command" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_needs_command" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_needs_command" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_needs_command" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_needs_command" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_needs_command" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_needs_command" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_needs_command" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_needs_command" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_needs_command" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_needs_command" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_needs_command" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_needs_command" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_needs_command" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "api" -d 'Send a raw API request (GET or POST) to an arbitrary endpoint'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "acl" -d 'Manage ACL rules'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "admin" -d 'Administrator management'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "alarms" -d 'Manage alarms'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "clients" -d 'Manage connected clients'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "cloud" -d 'Query the Site Manager cloud fleet API'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "config" -d 'Manage CLI configuration and profiles'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "countries" -d 'List available country codes'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "devices" -d 'Manage adopted and pending devices'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "dns" -d 'Manage DNS policies (local DNS records)'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "dpi" -d 'DPI reference data'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "events" -d 'View and stream events'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "firewall" -d 'Manage firewall policies and zones'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "hotspot" -d 'Manage hotspot vouchers'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "nat" -d 'Manage NAT policies (masquerade, source NAT, destination NAT)'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "networks" -d 'Manage networks and VLANs'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "radius" -d 'View RADIUS profiles'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "settings" -d 'View and modify site settings (session API)'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "sites" -d 'Manage sites'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "stats" -d 'Query statistics and reports'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "system" -d 'System operations and info'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "topology" -d 'Show network topology (devices, clients, connections)'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "traffic-lists" -d 'Manage traffic matching lists'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "vpn" -d 'View VPN servers and tunnels, and manage legacy VPN resources'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "wans" -d 'View WAN interfaces'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "wifi" -d 'Manage WiFi broadcasts (SSIDs)'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "tui" -d 'Launch the real-time terminal dashboard'
complete -c unifly -n "__fish_unifly_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s m -l method -d 'HTTP method' -r -f -a "get\t''
post\t''
put\t''
patch\t''
delete\t''"
complete -c unifly -n "__fish_unifly_using_subcommand api" -s d -l data -d 'JSON request body (for POST, PUT, or PATCH)' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand api" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand api" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand api" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand api" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand api" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand api" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "list" -d 'List ACL rules'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "get" -d 'Get an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "create" -d 'Create an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "update" -d 'Update an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "delete" -d 'Delete an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "reorder" -d 'Get or set ACL rule ordering'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and not __fish_seen_subcommand_from list get create update delete reorder help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l name -d 'Rule name' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l rule-type -d 'Rule type: ipv4 or mac' -r -f -a "ipv4\t'IP-based ACL rule (IPv4 with protocol filters)'
mac\t'MAC address-based ACL rule'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l action -d 'Action: allow or block' -r -f -a "allow\t''
block\t''"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l source-zone -d 'Source zone ID (UUID)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l dest-zone -d 'Destination zone ID (UUID)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l protocol -d 'Optional IP protocol filter (e.g. TCP, UDP, ICMP)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l source-port -d 'Optional source port/range (e.g. 80 or 1000-2000)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l destination-port -d 'Optional destination port/range (e.g. 443 or 3000-4000)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s F -l from-file -d 'Create from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l name -d 'Rule name' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l rule-type -d 'Rule type: ipv4 or mac' -r -f -a "ipv4\t'IP-based ACL rule (IPv4 with protocol filters)'
mac\t'MAC address-based ACL rule'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l action -d 'Action: allow or block' -r -f -a "allow\t''
block\t''"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l source-zone -d 'Source zone ID (UUID)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l dest-zone -d 'Destination zone ID (UUID)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l protocol -d 'Optional IP protocol filter (e.g. TCP, UDP, ICMP)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l source-port -d 'Optional source port/range (e.g. 80 or 1000-2000)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l destination-port -d 'Optional destination port/range (e.g. 443 or 3000-4000)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l enabled -d 'Enable or disable the rule' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s F -l from-file -d 'Load full payload from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l set -d 'Set ordering from comma-separated rule IDs' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l get -d 'Get current ordering'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from reorder" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "list" -d 'List ACL rules'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "reorder" -d 'Get or set ACL rule ordering'
complete -c unifly -n "__fish_unifly_using_subcommand acl; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -f -a "list" -d 'List site administrators (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -f -a "invite" -d 'Invite a new administrator (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -f -a "revoke" -d 'Remove administrator access (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -f -a "update" -d 'Update administrator role (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and not __fish_seen_subcommand_from list invite revoke update help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l name -d 'Admin name' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l email -d 'Admin email' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l role -d 'Role: admin or readonly' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from invite" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from revoke" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l role -d 'New role' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "list" -d 'List site administrators (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "invite" -d 'Invite a new administrator (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "revoke" -d 'Remove administrator access (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update administrator role (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand admin; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -f -a "list" -d 'List alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -f -a "archive" -d 'Archive a single alarm (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -f -a "archive-all" -d 'Archive all alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and not __fish_seen_subcommand_from list archive archive-all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l unarchived -d 'Only show unarchived alarms'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from archive-all" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from help" -f -a "list" -d 'List alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from help" -f -a "archive" -d 'Archive a single alarm (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from help" -f -a "archive-all" -d 'Archive all alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand alarms; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "list" -d 'List connected clients'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "find" -d 'Find clients by IP, name, hostname, or MAC (case-insensitive substring match)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "get" -d 'Get connected client details'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "roams" -d 'Show a client\'s roam timeline (connects, disconnects, AP transitions)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "wifi" -d 'Show Wi-Fi experience metrics for a wireless client'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "authorize" -d 'Authorize guest access'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "unauthorize" -d 'Revoke guest access'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "block" -d 'Block a client from connecting (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "unblock" -d 'Unblock a previously blocked client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "kick" -d 'Disconnect/reconnect a wireless client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "forget" -d 'Forget a client from controller history (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "reservations" -d 'List all DHCP reservations (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "set-ip" -d 'Set a fixed IP (DHCP reservation) for a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "remove-ip" -d 'Remove a fixed IP (DHCP reservation) from a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and not __fish_seen_subcommand_from list find get roams wifi authorize unauthorize block unblock kick forget reservations set-ip remove-ip help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from find" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l limit -d 'Maximum number of events to return' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from roams" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from wifi" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l minutes -d 'Authorization duration in minutes' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l data-limit-mb -d 'Data usage limit in MB' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l rx-limit-kbps -d 'Download rate limit in Kbps' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l tx-limit-kbps -d 'Upload rate limit in Kbps' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from authorize" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unauthorize" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from block" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from unblock" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from kick" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from forget" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from reservations" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l ip -d 'IPv4 address to reserve' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l network -d 'Network name or ID (auto-detected from IP if omitted)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from set-ip" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l network -d 'Network name or ID (removes from all networks if omitted)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from remove-ip" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "list" -d 'List connected clients'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "find" -d 'Find clients by IP, name, hostname, or MAC (case-insensitive substring match)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get connected client details'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "roams" -d 'Show a client\'s roam timeline (connects, disconnects, AP transitions)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "wifi" -d 'Show Wi-Fi experience metrics for a wireless client'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "authorize" -d 'Authorize guest access'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "unauthorize" -d 'Revoke guest access'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "block" -d 'Block a client from connecting (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "unblock" -d 'Unblock a previously blocked client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "kick" -d 'Disconnect/reconnect a wireless client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "forget" -d 'Forget a client from controller history (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "reservations" -d 'List all DHCP reservations (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "set-ip" -d 'Set a fixed IP (DHCP reservation) for a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "remove-ip" -d 'Remove a fixed IP (DHCP reservation) from a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand clients; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand completions" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "hosts" -d 'List cloud consoles or show a single console'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "sites" -d 'List sites across all accessible cloud consoles'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "switch" -d 'Update the active cloud profile to target a different controller site'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "devices" -d 'List cloud-managed devices, optionally scoped to one or more hosts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "isp" -d 'View ISP metrics through Site Manager'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "sdwan" -d 'View SD-WAN configurations and deployment status'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and not __fish_seen_subcommand_from hosts sites switch devices isp sdwan help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -f -a "get" -d 'Show a single console'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from hosts" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sites" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from switch" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l host -d 'Restrict device results to one or more cloud hosts' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from devices" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l type -d 'Metric interval (`5m` or `1h`)' -r -f -a "5m\t''
1h\t''"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -f -a "query" -d 'Query ISP metrics for a specific set of sites'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from isp" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -f -a "get" -d 'Show a single SD-WAN configuration'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -f -a "status" -d 'Show deployment status for an SD-WAN configuration'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from sdwan" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "hosts" -d 'List cloud consoles or show a single console'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "sites" -d 'List sites across all accessible cloud consoles'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "switch" -d 'Update the active cloud profile to target a different controller site'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "devices" -d 'List cloud-managed devices, optionally scoped to one or more hosts'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "isp" -d 'View ISP metrics through Site Manager'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "sdwan" -d 'View SD-WAN configurations and deployment status'
complete -c unifly -n "__fish_unifly_using_subcommand cloud; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "init" -d 'Create initial config file with guided setup for a local controller'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "cloud-setup" -d 'Guided setup for a cloud Site Manager profile'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "show" -d 'Display current resolved configuration'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "set" -d 'Set a configuration value'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "profiles" -d 'List configured profiles'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "use" -d 'Set the default profile'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "theme" -d 'Show or set the color theme (shared by CLI and TUI)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "set-password" -d 'Store a password in the system keyring'
complete -c unifly -n "__fish_unifly_using_subcommand config; and not __fish_seen_subcommand_from init cloud-setup show set profiles use theme set-password help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from init" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from cloud-setup" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from show" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from profiles" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from use" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from theme" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l profile -d 'Profile name' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from set-password" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "init" -d 'Create initial config file with guided setup for a local controller'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "cloud-setup" -d 'Guided setup for a cloud Site Manager profile'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Display current resolved configuration'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a configuration value'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "profiles" -d 'List configured profiles'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "use" -d 'Set the default profile'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "theme" -d 'Show or set the color theme (shared by CLI and TUI)'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set-password" -d 'Store a password in the system keyring'
complete -c unifly -n "__fish_unifly_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand countries" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "list" -d 'List adopted devices'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "get" -d 'Get adopted device details'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "adopt" -d 'Adopt a pending device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "remove" -d 'Remove (unadopt) a device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "restart" -d 'Restart a device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "locate" -d 'Toggle locate LED (blink to identify device)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "port-cycle" -d 'Power-cycle a PoE port'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "stats" -d 'Get real-time device statistics'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "pending" -d 'List devices pending adoption'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "upgrade" -d 'Upgrade device firmware (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "provision" -d 'Force re-provision device configuration (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "speedtest" -d 'Run WAN speed test (session API, gateway only)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "tags" -d 'List device tags'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and not __fish_seen_subcommand_from list get adopt remove restart locate port-cycle stats pending upgrade provision speedtest tags help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l ignore-limit -d 'Ignore device limit on the site'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from adopt" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from remove" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from restart" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l on -d 'Turn locate on (default) or off' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from locate" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from port-cycle" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from stats" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from pending" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l url -d 'External firmware URL (optional)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from upgrade" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from provision" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from speedtest" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from tags" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "list" -d 'List adopted devices'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get adopted device details'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "adopt" -d 'Adopt a pending device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove (unadopt) a device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "restart" -d 'Restart a device'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "locate" -d 'Toggle locate LED (blink to identify device)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "port-cycle" -d 'Power-cycle a PoE port'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "stats" -d 'Get real-time device statistics'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "pending" -d 'List devices pending adoption'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade device firmware (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "provision" -d 'Force re-provision device configuration (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "speedtest" -d 'Run WAN speed test (session API, gateway only)'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "tags" -d 'List device tags'
complete -c unifly -n "__fish_unifly_using_subcommand devices; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "list" -d 'List DNS policies'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "get" -d 'Get a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "create" -d 'Create a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "update" -d 'Update a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "delete" -d 'Delete a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and not __fish_seen_subcommand_from list get create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l record-type -d 'Record type' -r -f -a "a\t''
aaaa\t''
cname\t''
mx\t''
txt\t''
srv\t''
forward\t''"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l domain -d 'Domain name' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l value -d 'Target value (IP address, target domain, mail server, etc.)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l ttl -d 'TTL in seconds (0-86400)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l priority -d 'MX priority (MX records only)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s F -l from-file -d 'Create from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s F -l from-file -d 'Load full payload from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "list" -d 'List DNS policies'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand dns; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "apps" -d 'List DPI applications'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "categories" -d 'List DPI categories'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "status" -d 'Show DPI status (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "enable" -d 'Enable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "disable" -d 'Disable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and not __fish_seen_subcommand_from apps categories status enable disable help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from apps" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from categories" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from status" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from enable" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from disable" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "apps" -d 'List DPI applications'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "categories" -d 'List DPI categories'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show DPI status (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "enable" -d 'Enable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "disable" -d 'Disable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand dpi; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -f -a "list" -d 'List recent events (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -f -a "watch" -d 'Stream real-time events via WebSocket (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and not __fish_seen_subcommand_from list watch help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l within -d 'Hours of history to include' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l types -d 'Event types to filter (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from watch" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "list" -d 'List recent events (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "watch" -d 'Stream real-time events via WebSocket (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand events; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -f -a "policies" -d 'Manage firewall policies'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -f -a "zones" -d 'Manage firewall zones'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and not __fish_seen_subcommand_from policies zones help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "list" -d 'List all firewall policies'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "get" -d 'Get a specific firewall policy'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "create" -d 'Create a firewall policy'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "update" -d 'Update a firewall policy'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "patch" -d 'Patch a firewall policy (quick toggle enabled/logging)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "delete" -d 'Delete a firewall policy'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "reorder" -d 'Get or set policy ordering between zones'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "list" -d 'List all firewall zones'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "get" -d 'Get a specific firewall zone'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "create" -d 'Create a custom firewall zone'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "update" -d 'Update a firewall zone'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "delete" -d 'Delete a custom firewall zone'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from zones" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from help" -f -a "policies" -d 'Manage firewall policies'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from help" -f -a "zones" -d 'Manage firewall zones'
complete -c unifly -n "__fish_unifly_using_subcommand firewall; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "list" -d 'List vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "get" -d 'Get voucher details'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "create" -d 'Generate new vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "delete" -d 'Delete a single voucher'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "purge" -d 'Bulk delete vouchers by filter'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and not __fish_seen_subcommand_from list get create delete purge help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results (1-1000)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l name -d 'Voucher name/label' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l count -d 'Number of vouchers to generate' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l minutes -d 'Time limit in minutes' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l guest-limit -d 'Max guests per voucher' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l data-limit-mb -d 'Data usage limit in MB' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l rx-limit-kbps -d 'Download rate limit in Kbps' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l tx-limit-kbps -d 'Upload rate limit in Kbps' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l filter -d 'Filter expression (required)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from purge" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "list" -d 'List vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get voucher details'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "create" -d 'Generate new vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a single voucher'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "purge" -d 'Bulk delete vouchers by filter'
complete -c unifly -n "__fish_unifly_using_subcommand hotspot; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -f -a "policies" -d 'Manage NAT policies'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and not __fish_seen_subcommand_from policies help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "list" -d 'List all NAT policies'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "get" -d 'Get a specific NAT policy'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "create" -d 'Create a NAT policy'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "update" -d 'Update a NAT policy'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "delete" -d 'Delete a NAT policy'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from policies" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from help" -f -a "policies" -d 'Manage NAT policies'
complete -c unifly -n "__fish_unifly_using_subcommand nat; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "list" -d 'List all networks'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "get" -d 'Get network details'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "create" -d 'Create a new network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "update" -d 'Update an existing network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "delete" -d 'Delete a network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "refs" -d 'Show network cross-references (what uses this network)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and not __fish_seen_subcommand_from list get create update delete refs help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l name -d 'Network name' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l management -d 'Management type: gateway, switch, or unmanaged' -r -f -a "gateway\t'Gateway-managed network (full IP/DHCP/NAT)'
switch\t'Switch-managed (L3 switch) network'
unmanaged\t'Unmanaged (VLAN only, no IP management)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l vlan -d 'VLAN ID (1-4009)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l enabled -d 'Enable the network (default: true)' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l ipv4-host -d 'IPv4 host address with prefix (e.g., 192.168.1.1/24)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l dhcp-start -d 'DHCP range start' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l dhcp-stop -d 'DHCP range end' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l dhcp-lease -d 'DHCP lease time in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l dns -d 'DNS server override (can be repeated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l zone -d 'Firewall zone ID to assign' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l internet -d 'Enable internet access (gateway managed only)' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s F -l from-file -d 'Create from JSON file (overrides individual flags)' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l dhcp -d 'Enable DHCP server'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l isolated -d 'Enable network isolation'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s F -l from-file -d 'Load full update payload from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l name -d 'Network name' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l enabled -d 'Enable/disable the network' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l vlan -d 'VLAN ID (1-4009)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l force -d 'Force delete even if referenced'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from refs" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all networks'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get network details'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an existing network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a network'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "refs" -d 'Show network cross-references (what uses this network)'
complete -c unifly -n "__fish_unifly_using_subcommand networks; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -f -a "profiles" -d 'List RADIUS profiles'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and not __fish_seen_subcommand_from profiles help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from profiles" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from help" -f -a "profiles" -d 'List RADIUS profiles'
complete -c unifly -n "__fish_unifly_using_subcommand radius; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -f -a "list" -d 'List all site setting sections (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -f -a "get" -d 'Get a specific setting section by key (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -f -a "set" -d 'Update a field in a setting section (session API). Fields prefixed with `x_` contain credentials and internal secrets'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -f -a "export" -d 'Export all settings as raw JSON (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and not __fish_seen_subcommand_from list get set export help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l data -d 'Merge a JSON object into the section' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from set" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from export" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all site setting sections (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a specific setting section by key (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "set" -d 'Update a field in a setting section (session API). Fields prefixed with `x_` contain credentials and internal secrets'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "export" -d 'Export all settings as raw JSON (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -f -a "list" -d 'List local sites'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -f -a "create" -d 'Create a new site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -f -a "delete" -d 'Delete a site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and not __fish_seen_subcommand_from list create delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l name -d 'Site name (internal reference)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l description -d 'Site description (display name)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from help" -f -a "list" -d 'List local sites'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand sites; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "site" -d 'Site-level statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "device" -d 'Per-device statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "client" -d 'Per-client statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "gateway" -d 'Gateway statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "dpi" -d 'DPI traffic analysis (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and not __fish_seen_subcommand_from site device client gateway dpi help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l interval -d 'Reporting interval' -r -f -a "5m\t''
hourly\t''
daily\t''
monthly\t''"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l start -d 'Start time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l end -d 'End time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l attrs -d 'Attributes to include (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l macs -d 'Filter by MAC addresses (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from site" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l interval -d 'Reporting interval' -r -f -a "5m\t''
hourly\t''
daily\t''
monthly\t''"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l start -d 'Start time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l end -d 'End time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l attrs -d 'Attributes to include (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l macs -d 'Filter by MAC addresses (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from device" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l interval -d 'Reporting interval' -r -f -a "5m\t''
hourly\t''
daily\t''
monthly\t''"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l start -d 'Start time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l end -d 'End time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l attrs -d 'Attributes to include (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l macs -d 'Filter by MAC addresses (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from client" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l interval -d 'Reporting interval' -r -f -a "5m\t''
hourly\t''
daily\t''
monthly\t''"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l start -d 'Start time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l end -d 'End time (ISO 8601 or Unix timestamp)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l attrs -d 'Attributes to include (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l macs -d 'Filter by MAC addresses (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from gateway" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l group-by -d 'Analysis type: by-app or by-cat' -r -f -a "by-app\t''
by-cat\t''"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l macs -d 'Filter by MAC addresses (comma-separated)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from dpi" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "site" -d 'Site-level statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "device" -d 'Per-device statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "client" -d 'Per-client statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "gateway" -d 'Gateway statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "dpi" -d 'DPI traffic analysis (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand stats; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "info" -d 'Application version info (Integration API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "health" -d 'Site health summary (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "sysinfo" -d 'Controller system info (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "backup" -d 'Backup management (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "reboot" -d 'Reboot controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "poweroff" -d 'Power off controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and not __fish_seen_subcommand_from info health sysinfo backup reboot poweroff help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from info" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from health" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from sysinfo" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -f -a "create" -d 'Create a new backup'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -f -a "list" -d 'List existing backups'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -f -a "download" -d 'Download a backup file'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -f -a "delete" -d 'Delete a backup'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from backup" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from reboot" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from poweroff" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "info" -d 'Application version info (Integration API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "health" -d 'Site health summary (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "sysinfo" -d 'Controller system info (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "backup" -d 'Backup management (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "reboot" -d 'Reboot controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "poweroff" -d 'Power off controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand system; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand topology" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "list" -d 'List traffic matching lists'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "get" -d 'Get a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "create" -d 'Create a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "update" -d 'Update a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "delete" -d 'Delete a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and not __fish_seen_subcommand_from list get create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l name -d 'List name' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l list-type -d 'List type' -r -f -a "ports\t'Port list'
ipv4\t'IPv4 address/subnet list'
ipv6\t'IPv6 address/subnet list'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l items -d 'Items (comma-separated ports, IPs, or subnets)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s F -l from-file -d 'Create from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s F -l from-file -d 'Load full payload from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "list" -d 'List traffic matching lists'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand traffic-lists; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "servers" -d 'Manage VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "tunnels" -d 'Manage site-to-site VPN tunnels'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "status" -d 'Show live IPsec tunnel status'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "health" -d 'Show VPN subsystem health'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "site-to-site" -d 'Manage session site-to-site VPNs'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "remote-access" -d 'Manage session remote-access VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "clients" -d 'Manage configured session VPN clients'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "connections" -d 'View and restart session VPN client connections'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "peers" -d 'Manage WireGuard peers on session remote-access servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "magic-site-to-site" -d 'Inspect session magic site-to-site VPN configs'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "settings" -d 'Manage session VPN-related site settings'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and not __fish_seen_subcommand_from servers tunnels status health site-to-site remote-access clients connections peers magic-site-to-site settings help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -f -a "get" -d 'Get full details of a VPN server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from servers" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -f -a "get" -d 'Get full details of a site-to-site VPN tunnel'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from tunnels" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from status" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from health" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "list" -d 'List site-to-site VPN records'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "get" -d 'Get a site-to-site VPN record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "create" -d 'Create a site-to-site VPN from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "update" -d 'Update a site-to-site VPN from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "delete" -d 'Delete a site-to-site VPN record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from site-to-site" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "list" -d 'List remote-access VPN server records'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "get" -d 'Get a remote-access VPN server record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "create" -d 'Create a remote-access VPN server from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "update" -d 'Update a remote-access VPN server from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "suggest-port" -d 'Suggest available OpenVPN ports for a remote-access server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "download-config" -d 'Download an OpenVPN client configuration for a remote-access server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "delete" -d 'Delete a remote-access VPN server record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from remote-access" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "list" -d 'List configured VPN client records'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "get" -d 'Get a configured VPN client record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "create" -d 'Create a configured VPN client from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "update" -d 'Update a configured VPN client from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "delete" -d 'Delete a configured VPN client record'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from clients" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -f -a "list" -d 'List VPN client connections'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -f -a "get" -d 'Get a VPN client connection'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -f -a "restart" -d 'Restart a VPN client connection'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from connections" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "list" -d 'List WireGuard peers, optionally scoped to one server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "get" -d 'Get a WireGuard peer from a remote-access server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "create" -d 'Create a WireGuard peer from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "update" -d 'Update a WireGuard peer from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "delete" -d 'Delete a WireGuard peer from a remote-access server'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "subnets" -d 'List subnets already consumed by WireGuard peers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from peers" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -f -a "list" -d 'List magic site-to-site VPN configs'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -f -a "get" -d 'Get a magic site-to-site VPN config'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from magic-site-to-site" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -f -a "list" -d 'List discovered VPN-related site settings'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -f -a "get" -d 'Get a specific VPN setting'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -f -a "set" -d 'Toggle a VPN setting via session site settings'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -f -a "patch" -d 'Patch a VPN setting from a JSON file'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from settings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "servers" -d 'Manage VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "tunnels" -d 'Manage site-to-site VPN tunnels'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show live IPsec tunnel status'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "health" -d 'Show VPN subsystem health'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "site-to-site" -d 'Manage session site-to-site VPNs'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "remote-access" -d 'Manage session remote-access VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "clients" -d 'Manage configured session VPN clients'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "connections" -d 'View and restart session VPN client connections'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "peers" -d 'Manage WireGuard peers on session remote-access servers'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "magic-site-to-site" -d 'Inspect session magic site-to-site VPN configs'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "settings" -d 'Manage session VPN-related site settings'
complete -c unifly -n "__fish_unifly_using_subcommand vpn; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List WAN interfaces'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from help" -f -a "list" -d 'List WAN interfaces'
complete -c unifly -n "__fish_unifly_using_subcommand wans; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "list" -d 'List WiFi broadcasts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "get" -d 'Get WiFi broadcast details'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "neighbors" -d 'List neighboring / rogue APs detected by your access points'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "channels" -d 'List per-radio regulatory channel availability'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "create" -d 'Create a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "update" -d 'Update a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "delete" -d 'Delete a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and not __fish_seen_subcommand_from list get neighbors channels create update delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s l -l limit -d 'Max results per page (1-200)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l offset -d 'Pagination offset' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s f -l filter -d 'Filter expression (Integration API syntax) Examples: "name.eq(\'MyNetwork\')", "state.in(\'ONLINE\',\'OFFLINE\')"' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s a -l all -d 'Fetch all pages automatically'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from get" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l within -d 'Only show APs seen within this many seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l limit -d 'Maximum number of results to display' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l all -d 'Show all results (no limit)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from neighbors" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from channels" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l name -d 'SSID name' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l broadcast-type -d 'Broadcast type' -r -f -a "standard\t'Full-featured WiFi with band steering, MLO, hotspot'
iot-optimized\t'Simplified IoT-focused WiFi'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l network -d 'Network to associate (UUID or \'native\')' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l security -d 'Security mode' -r -f -a "open\t''
wpa2-personal\t''
wpa3-personal\t''
wpa2-wpa3-personal\t''
wpa2-enterprise\t''
wpa3-enterprise\t''
wpa2-wpa3-enterprise\t''"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l passphrase -d 'WPA passphrase (8-63 characters)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l frequencies -d 'Broadcasting frequencies (2.4, 5, 6 GHz)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s F -l from-file -d 'Create from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l hidden -d 'Hide SSID name'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l band-steering -d 'Enable band steering (standard type only)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l fast-roaming -d 'Enable fast roaming'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s F -l from-file -d 'Load full payload from JSON file' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l name -d 'Update SSID name' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l passphrase -d 'Update passphrase' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l enabled -d 'Enable/disable' -r -f -a "true\t''
false\t''"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from update" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l force -d 'Force delete even if referenced'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "list" -d 'List WiFi broadcasts'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get WiFi broadcast details'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "neighbors" -d 'List neighboring / rogue APs detected by your access points'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "channels" -d 'List per-radio regulatory channel availability'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand wifi; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l log-file -d 'Log file path' -r -F
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s p -l profile -d 'Controller profile to use' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s c -l controller -d 'Controller URL (overrides profile)' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s s -l site -d 'Site name or UUID' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l api-key -d 'Integration API key' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l host-id -d 'Cloud console/host ID (for cloud auth mode)' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s o -l output -d 'Output format' -r -f -a "table\t'Pretty table (default, interactive)'
json\t'Pretty-printed JSON'
json-compact\t'Compact single-line JSON'
yaml\t'YAML'
plain\t'Plain text, one value per line (scripting)'"
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l color -d 'When to use color output' -r -f -a "auto\t'Auto-detect (color if terminal is interactive)'
always\t'Always emit color codes'
never\t'Never emit color codes'"
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l theme -d 'Color theme (e.g., nord, dracula, silkcircuit-neon)' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l totp -d 'TOTP token for MFA-enabled controllers (prefer UNIFI_TOTP env var)' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l timeout -d 'Request timeout in seconds' -r
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s v -l verbose -d 'Increase verbosity (-v, -vv, -vvv)'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s q -l quiet -d 'Suppress non-error output'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s y -l yes -d 'Skip confirmation prompts'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l no-cache -d 'Disable session caching (forces fresh login)'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -l demo -d 'Sanitize PII for demo recordings (uses [demo] config section)'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s k -l insecure -d 'Accept self-signed TLS certificates'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c unifly -n "__fish_unifly_using_subcommand tui" -s V -l version -d 'Print version'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "api" -d 'Send a raw API request (GET or POST) to an arbitrary endpoint'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "acl" -d 'Manage ACL rules'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "admin" -d 'Administrator management'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "alarms" -d 'Manage alarms'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "clients" -d 'Manage connected clients'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "completions" -d 'Generate shell completions'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "cloud" -d 'Query the Site Manager cloud fleet API'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "config" -d 'Manage CLI configuration and profiles'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "countries" -d 'List available country codes'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "devices" -d 'Manage adopted and pending devices'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "dns" -d 'Manage DNS policies (local DNS records)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "dpi" -d 'DPI reference data'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "events" -d 'View and stream events'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "firewall" -d 'Manage firewall policies and zones'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "hotspot" -d 'Manage hotspot vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "nat" -d 'Manage NAT policies (masquerade, source NAT, destination NAT)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "networks" -d 'Manage networks and VLANs'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "radius" -d 'View RADIUS profiles'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "settings" -d 'View and modify site settings (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "sites" -d 'Manage sites'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "stats" -d 'Query statistics and reports'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "system" -d 'System operations and info'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "topology" -d 'Show network topology (devices, clients, connections)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "traffic-lists" -d 'Manage traffic matching lists'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "vpn" -d 'View VPN servers and tunnels, and manage legacy VPN resources'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "wans" -d 'View WAN interfaces'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "wifi" -d 'Manage WiFi broadcasts (SSIDs)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "tui" -d 'Launch the real-time terminal dashboard'
complete -c unifly -n "__fish_unifly_using_subcommand help; and not __fish_seen_subcommand_from api acl admin alarms clients completions cloud config countries devices dns dpi events firewall hotspot nat networks radius settings sites stats system topology traffic-lists vpn wans wifi tui help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "list" -d 'List ACL rules'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "get" -d 'Get an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "create" -d 'Create an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "update" -d 'Update an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "delete" -d 'Delete an ACL rule'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from acl" -f -a "reorder" -d 'Get or set ACL rule ordering'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "list" -d 'List site administrators (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "invite" -d 'Invite a new administrator (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "revoke" -d 'Remove administrator access (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from admin" -f -a "update" -d 'Update administrator role (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from alarms" -f -a "list" -d 'List alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from alarms" -f -a "archive" -d 'Archive a single alarm (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from alarms" -f -a "archive-all" -d 'Archive all alarms (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "list" -d 'List connected clients'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "find" -d 'Find clients by IP, name, hostname, or MAC (case-insensitive substring match)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "get" -d 'Get connected client details'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "roams" -d 'Show a client\'s roam timeline (connects, disconnects, AP transitions)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "wifi" -d 'Show Wi-Fi experience metrics for a wireless client'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "authorize" -d 'Authorize guest access'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "unauthorize" -d 'Revoke guest access'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "block" -d 'Block a client from connecting (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "unblock" -d 'Unblock a previously blocked client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "kick" -d 'Disconnect/reconnect a wireless client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "forget" -d 'Forget a client from controller history (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "reservations" -d 'List all DHCP reservations (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "set-ip" -d 'Set a fixed IP (DHCP reservation) for a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from clients" -f -a "remove-ip" -d 'Remove a fixed IP (DHCP reservation) from a client (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "hosts" -d 'List cloud consoles or show a single console'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "sites" -d 'List sites across all accessible cloud consoles'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "switch" -d 'Update the active cloud profile to target a different controller site'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "devices" -d 'List cloud-managed devices, optionally scoped to one or more hosts'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "isp" -d 'View ISP metrics through Site Manager'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from cloud" -f -a "sdwan" -d 'View SD-WAN configurations and deployment status'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "init" -d 'Create initial config file with guided setup for a local controller'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "cloud-setup" -d 'Guided setup for a cloud Site Manager profile'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Display current resolved configuration'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Set a configuration value'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "profiles" -d 'List configured profiles'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "use" -d 'Set the default profile'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "theme" -d 'Show or set the color theme (shared by CLI and TUI)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set-password" -d 'Store a password in the system keyring'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "list" -d 'List adopted devices'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "get" -d 'Get adopted device details'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "adopt" -d 'Adopt a pending device'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "remove" -d 'Remove (unadopt) a device'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "restart" -d 'Restart a device'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "locate" -d 'Toggle locate LED (blink to identify device)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "port-cycle" -d 'Power-cycle a PoE port'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "stats" -d 'Get real-time device statistics'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "pending" -d 'List devices pending adoption'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "upgrade" -d 'Upgrade device firmware (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "provision" -d 'Force re-provision device configuration (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "speedtest" -d 'Run WAN speed test (session API, gateway only)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from devices" -f -a "tags" -d 'List device tags'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dns" -f -a "list" -d 'List DNS policies'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dns" -f -a "get" -d 'Get a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dns" -f -a "create" -d 'Create a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dns" -f -a "update" -d 'Update a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dns" -f -a "delete" -d 'Delete a DNS policy'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dpi" -f -a "apps" -d 'List DPI applications'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dpi" -f -a "categories" -d 'List DPI categories'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dpi" -f -a "status" -d 'Show DPI status (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dpi" -f -a "enable" -d 'Enable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from dpi" -f -a "disable" -d 'Disable Deep Packet Inspection (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "list" -d 'List recent events (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from events" -f -a "watch" -d 'Stream real-time events via WebSocket (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from firewall" -f -a "policies" -d 'Manage firewall policies'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from firewall" -f -a "zones" -d 'Manage firewall zones'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from hotspot" -f -a "list" -d 'List vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from hotspot" -f -a "get" -d 'Get voucher details'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from hotspot" -f -a "create" -d 'Generate new vouchers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from hotspot" -f -a "delete" -d 'Delete a single voucher'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from hotspot" -f -a "purge" -d 'Bulk delete vouchers by filter'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from nat" -f -a "policies" -d 'Manage NAT policies'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "list" -d 'List all networks'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "get" -d 'Get network details'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "create" -d 'Create a new network'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "update" -d 'Update an existing network'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "delete" -d 'Delete a network'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from networks" -f -a "refs" -d 'Show network cross-references (what uses this network)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from radius" -f -a "profiles" -d 'List RADIUS profiles'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "list" -d 'List all site setting sections (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "get" -d 'Get a specific setting section by key (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "set" -d 'Update a field in a setting section (session API). Fields prefixed with `x_` contain credentials and internal secrets'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "export" -d 'Export all settings as raw JSON (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from sites" -f -a "list" -d 'List local sites'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from sites" -f -a "create" -d 'Create a new site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from sites" -f -a "delete" -d 'Delete a site (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from stats" -f -a "site" -d 'Site-level statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from stats" -f -a "device" -d 'Per-device statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from stats" -f -a "client" -d 'Per-client statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from stats" -f -a "gateway" -d 'Gateway statistics (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from stats" -f -a "dpi" -d 'DPI traffic analysis (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "info" -d 'Application version info (Integration API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "health" -d 'Site health summary (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "sysinfo" -d 'Controller system info (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "backup" -d 'Backup management (session API)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "reboot" -d 'Reboot controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from system" -f -a "poweroff" -d 'Power off controller hardware (session API, UDM only)'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from traffic-lists" -f -a "list" -d 'List traffic matching lists'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from traffic-lists" -f -a "get" -d 'Get a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from traffic-lists" -f -a "create" -d 'Create a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from traffic-lists" -f -a "update" -d 'Update a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from traffic-lists" -f -a "delete" -d 'Delete a traffic matching list'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "servers" -d 'Manage VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "tunnels" -d 'Manage site-to-site VPN tunnels'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "status" -d 'Show live IPsec tunnel status'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "health" -d 'Show VPN subsystem health'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "site-to-site" -d 'Manage session site-to-site VPNs'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "remote-access" -d 'Manage session remote-access VPN servers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "clients" -d 'Manage configured session VPN clients'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "connections" -d 'View and restart session VPN client connections'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "peers" -d 'Manage WireGuard peers on session remote-access servers'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "magic-site-to-site" -d 'Inspect session magic site-to-site VPN configs'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from vpn" -f -a "settings" -d 'Manage session VPN-related site settings'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wans" -f -a "list" -d 'List WAN interfaces'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "list" -d 'List WiFi broadcasts'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "get" -d 'Get WiFi broadcast details'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "neighbors" -d 'List neighboring / rogue APs detected by your access points'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "channels" -d 'List per-radio regulatory channel availability'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "create" -d 'Create a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "update" -d 'Update a WiFi broadcast'
complete -c unifly -n "__fish_unifly_using_subcommand help; and __fish_seen_subcommand_from wifi" -f -a "delete" -d 'Delete a WiFi broadcast'
