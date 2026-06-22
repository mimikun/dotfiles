complete -c ttl -s c -l count -d 'Number of probe rounds (0 = infinite). Each round sends probes to all TTLs' -r
complete -c ttl -s i -l interval -d 'Probe interval in seconds' -r
complete -c ttl -s m -l max-ttl -d 'Maximum TTL (hops)' -r
complete -c ttl -s p -l protocol -d 'Probe protocol (auto, icmp, udp, tcp)' -r
complete -c ttl -l port -d 'Port for UDP/TCP probes' -r
complete -c ttl -l flows -d 'Number of flows for multi-path ECMP detection (1 = classic mode)' -r
complete -c ttl -l src-port -d 'Base source port for flow identification' -r
complete -c ttl -l timeout -d 'Probe timeout in seconds' -r
complete -c ttl -l geoip-db -d 'Path to MaxMind GeoLite2 database file' -r
complete -c ttl -l replay -d 'Replay a saved session' -r
complete -c ttl -l speed -d 'Replay speed multiplier (1.0 = realtime, 10.0 = 10x faster)' -r
complete -c ttl -l diff -d 'Compare two saved sessions: show added/removed hops, path and latency changes' -r
complete -c ttl -l prometheus -d 'Serve Prometheus/OpenMetrics on this address (e.g. :9090 or 127.0.0.1:9090; implies --no-tui)' -r
complete -c ttl -l theme -d 'Color theme (default, kawaii, cyber, dracula, monochrome, matrix, nord, gruvbox, catppuccin, tokyo_night, solarized)' -r
complete -c ttl -l interface -d 'Bind probes to specific network interface (e.g., eth0, wlan0)' -r
complete -c ttl -l dscp -d 'DSCP value for QoS testing (0-63)' -r
complete -c ttl -l size -d 'Probe packet size in bytes (36-9216 for IPv4, 56-9216 for IPv6) Includes IP + protocol headers. Smaller values are clamped to minimum. Supports jumbo frames up to 9216 bytes' -r
complete -c ttl -l rate -d 'Maximum probes per second (0 = unlimited)' -r
complete -c ttl -l source-ip -d 'Source IP address for probes' -r
complete -c ttl -l completions -d 'Generate shell completions and exit' -r -f -a "bash\t''
zsh\t''
fish\t''
powershell\t''"
complete -c ttl -l fixed-port -d 'Use fixed port (disable per-TTL port variation)'
complete -c ttl -s 4 -l ipv4 -d 'Force IPv4'
complete -c ttl -s 6 -l ipv6 -d 'Force IPv6'
complete -c ttl -l resolve-all -d 'Trace all resolved IP addresses for hostnames (round-robin DNS, dual-stack)'
complete -c ttl -l no-dns -d 'Skip reverse DNS lookups'
complete -c ttl -l no-asn -d 'Skip ASN enrichment'
complete -c ttl -l no-geo -d 'Skip geolocation'
complete -c ttl -l no-ix -d 'Skip IX detection (PeeringDB)'
complete -c ttl -l no-tui -d 'Disable TUI (streaming output mode)'
complete -c ttl -l json -d 'Output JSON (batch mode, requires -c)'
complete -c ttl -l csv -d 'Output CSV (batch mode, requires -c)'
complete -c ttl -l report -d 'Report mode (batch, requires -c)'
complete -c ttl -l animate -d 'Animate replay showing probe-by-probe discovery'
complete -c ttl -l stream-json -d 'Stream probe events as line-delimited JSON to stdout (implies --no-tui)'
complete -c ttl -l daemon -d 'Daemon mode: headless, no per-hop output (combine with --prometheus or --stream-json)'
complete -c ttl -l wide -d 'Wide mode: expand columns for wider terminals'
complete -c ttl -l recv-any -d 'Don\'t bind receiver socket to interface (allows asymmetric routing)'
complete -c ttl -l pmtud -d 'Enable Path MTU discovery mode (binary search for max unfragmented size)'
complete -c ttl -l jumbo -d 'Enable jumbo frame detection (9216 byte max) for PMTUD Without this flag, PMTUD uses standard ethernet max (1500 bytes)'
complete -c ttl -s h -l help -d 'Print help'
complete -c ttl -s V -l version -d 'Print version'
