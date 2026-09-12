
function __fish_doggo_no_subcommand
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 0
    end
    return 1
end

function __fish_doggo_arg1_is_completions
    # The CLI only recognizes 'completions' as the first argument (os.Args[1]),
    # so a later word named 'completions' is just a query argument.
    set -l cmd (commandline -opc)
    test (count $cmd) -ge 2; and test $cmd[2] = completions
end

# Meta options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'version' -d "Show version of doggo"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'h' -l 'help'    -d "Show list of command-line options"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'config'  -d "Load defaults from a TOML config file" -r

# Query options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'q' -l 'query'      -d "Hostname to query the DNS records for" -x -a "(__fish_print_hostnames)"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 't' -l 'type'       -d "DNS record type by name, number, or TYPE<number>" -x -a "A AAAA CAA CNAME HINFO HTTPS MX NS PTR SOA SRV SVCB TXT"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'n' -l 'nameserver' -d "Address of a specific nameserver to send queries to" -x -a "(__fish_print_hostnames)"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'c' -l 'class'      -d "Network class of the DNS record being queried" -x -a "IN CH HS"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'x' -l 'reverse'    -d "Performs a DNS Lookup for an IPv4 or IPv6 address"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'any'               -d "Query all supported DNS record types"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'A' -l 'authoritative' -d "Automatically query the authoritative nameserver for the domain"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'trace'           -d "Trace the delegation path from the root servers"

# Resolver options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'strategy'  -d "Strategy to query nameservers" -x -a "all random first internal"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'ndots'     -d "Specify ndots parameter" -x
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'search'    -d "Use the search list defined in resolv.conf"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'T' -l 'timeout'   -d "Timeout for the resolver to return a response (e.g., 5s, 400ms, 1m)" -x
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s '4' -l 'ipv4' -d "Use IPv4 only"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s '6' -l 'ipv6' -d "Use IPv6 only"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'http3' -d "Use HTTP/3 for DNS-over-HTTPS nameservers"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'b' -l 'source' -d "Bind queries to a local source IP address" -x

# Query flags
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'aa' -d "Set Authoritative Answer flag"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'ad' -d "Set Authenticated Data flag"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'cd' -d "Set Checking Disabled flag"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'rd' -d "Set Recursion Desired flag"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'z'  -d "Set Z flag (reserved for future use)"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'do' -d "Set DNSSEC OK flag"

# EDNS0 options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'nsid'    -d "Request Name Server Identifier (NSID)"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'cookie'  -d "Request DNS Cookie"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'padding' -d "Request EDNS padding for privacy"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'ede'     -d "Enable EDNS to receive Extended DNS Errors"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'ecs'     -d "EDNS Client Subnet" -x
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'bufsize' -d "EDNS UDP buffer size in bytes" -x

# Output options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -s 'J' -l 'json'  -d "Format the output as JSON"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'short'        -d "Shows only the response section in the output"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'color'        -d "Colored output"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'debug'        -d "Enable debug logging"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'time'         -d "Shows how long the response took from the server"

# TLS options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'tls-hostname'               -d "Hostname for certificate verification" -x -a "(__fish_print_hostnames)"
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'skip-hostname-verification' -d "Skip TLS hostname verification in case of DoT lookups"

# Globalping options
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'gp-from'  -d "Query using Globalping API from a specific location" -x
complete -c doggo -n 'not __fish_doggo_arg1_is_completions' -l 'gp-limit' -d "Limit the number of probes to use from Globalping" -x

# Completions command
complete -c doggo -n '__fish_doggo_no_subcommand' -a completions -d "Generate shell completion scripts"
complete -c doggo -n '__fish_doggo_arg1_is_completions' -x -f -a "bash zsh fish" -d "Shell type"

