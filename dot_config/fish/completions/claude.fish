# fish completions for the claude CLI (Claude Code).
#
# Generated from claude 2.1.229 on 2026-08-13.
# Do not edit by hand - run `task gen-claude-completion` after `claude update`.

complete -c claude -f

# Helpers ---------------------------------------------------------------

function __fish_claude_agents -d 'Agent names from ~/.claude/agents and ./.claude/agents'
    for dir in ~/.claude/agents .claude/agents
        set -l files $dir/*.md
        test (count $files) -gt 0; or continue
        string replace -r '\\.md$' '' -- (path basename $files)
    end
end

function __fish_claude_plugins -d 'Installed plugins as name@marketplace'
    command -q jq; or return
    set -l f ~/.claude/plugins/installed_plugins.json
    test -f $f; or return
    jq -r '.plugins // {} | keys[]' $f 2>/dev/null
end

function __fish_claude_marketplaces -d 'Configured plugin marketplaces'
    command -q jq; or return
    set -l f ~/.claude/plugins/known_marketplaces.json
    test -f $f; or return
    jq -r 'keys[]' $f 2>/dev/null
end

# Every `complete` below tests the same condition, so the path is resolved once
# per command line and cached instead of once per candidate.
function __fish_claude_resolve -d 'Cache the canonical subcommand path typed so far'
    set -l tokens (commandline -opc)
    set -l key (string join \x1f -- $tokens)
    test "$key" = "$__fish_claude_key"; and return
    set -e tokens[1]
    set -l path ''
    for t in $tokens
        string match -qr '^-' -- $t; and continue
        set -l next (__fish_claude_child "$path" "$t")
        test -n "$next"; and set path "$next"
    end
    set -g __fish_claude_key $key
    set -g __fish_claude_path $path
end

function __fish_claude_at -d 'Test the current subcommand path against the arguments'
    __fish_claude_resolve
    contains -- "$__fish_claude_path" $argv
end

function __fish_claude_child -d 'Resolve a token to a canonical subcommand path'
    switch "$argv[1]"
        case ''
            switch "$argv[2]"
                case 'agents'
                    echo 'agents'
                case 'auth'
                    echo 'auth'
                case 'auto-mode'
                    echo 'auto-mode'
                case 'doctor'
                    echo 'doctor'
                case 'gateway'
                    echo 'gateway'
                case 'import'
                    echo 'import'
                case 'install'
                    echo 'install'
                case 'mcp'
                    echo 'mcp'
                case 'plugin' 'plugins'
                    echo 'plugin'
                case 'project'
                    echo 'project'
                case 'setup-token'
                    echo 'setup-token'
                case 'ultrareview'
                    echo 'ultrareview'
                case 'update' 'upgrade'
                    echo 'update'
            end
        case 'auth'
            switch "$argv[2]"
                case 'login'
                    echo 'auth login'
                case 'logout'
                    echo 'auth logout'
                case 'status'
                    echo 'auth status'
            end
        case 'auto-mode'
            switch "$argv[2]"
                case 'config'
                    echo 'auto-mode config'
                case 'critique'
                    echo 'auto-mode critique'
                case 'defaults'
                    echo 'auto-mode defaults'
                case 'reset'
                    echo 'auto-mode reset'
            end
        case 'mcp'
            switch "$argv[2]"
                case 'add'
                    echo 'mcp add'
                case 'add-from-claude-desktop'
                    echo 'mcp add-from-claude-desktop'
                case 'add-json'
                    echo 'mcp add-json'
                case 'get'
                    echo 'mcp get'
                case 'list'
                    echo 'mcp list'
                case 'login'
                    echo 'mcp login'
                case 'logout'
                    echo 'mcp logout'
                case 'remove'
                    echo 'mcp remove'
                case 'reset-project-choices'
                    echo 'mcp reset-project-choices'
                case 'serve'
                    echo 'mcp serve'
            end
        case 'plugin'
            switch "$argv[2]"
                case 'details'
                    echo 'plugin details'
                case 'disable'
                    echo 'plugin disable'
                case 'enable'
                    echo 'plugin enable'
                case 'eval'
                    echo 'plugin eval'
                case 'init' 'new'
                    echo 'plugin init'
                case 'install' 'i'
                    echo 'plugin install'
                case 'list'
                    echo 'plugin list'
                case 'marketplace'
                    echo 'plugin marketplace'
                case 'prune' 'autoremove'
                    echo 'plugin prune'
                case 'tag'
                    echo 'plugin tag'
                case 'uninstall' 'remove'
                    echo 'plugin uninstall'
                case 'update'
                    echo 'plugin update'
                case 'validate'
                    echo 'plugin validate'
            end
        case 'plugin eval'
            switch "$argv[2]"
                case 'init'
                    echo 'plugin eval init'
            end
        case 'plugin marketplace'
            switch "$argv[2]"
                case 'add'
                    echo 'plugin marketplace add'
                case 'list'
                    echo 'plugin marketplace list'
                case 'remove' 'rm'
                    echo 'plugin marketplace remove'
                case 'update'
                    echo 'plugin marketplace update'
            end
        case 'project'
            switch "$argv[2]"
                case 'purge'
                    echo 'project purge'
            end
    end
end

# claude
complete -c claude -n '__fish_claude_at ""' -a 'agents' -d 'Manage background agents'
complete -c claude -n '__fish_claude_at ""' -a 'auth' -d 'Manage authentication'
complete -c claude -n '__fish_claude_at ""' -a 'auto-mode' -d 'Inspect or reset auto mode classifier configuration'
complete -c claude -n '__fish_claude_at ""' -a 'doctor' -d 'Check the health of your Claude Code installation. Reads settings files in the current di…'
complete -c claude -n '__fish_claude_at ""' -a 'gateway' -d 'Run the enterprise auth/telemetry gateway'
complete -c claude -n '__fish_claude_at ""' -a 'import' -d 'Import config from another AI coding agent into Claude Code'
complete -c claude -n '__fish_claude_at ""' -a 'install' -d 'Install Claude Code native build. Use [target] to specify version (stable, latest, or spe…'
complete -c claude -n '__fish_claude_at ""' -a 'mcp' -d 'Configure and manage MCP servers'
complete -c claude -n '__fish_claude_at ""' -a 'plugin' -d 'Manage Claude Code plugins'
complete -c claude -n '__fish_claude_at ""' -a 'project' -d 'Manage Claude Code project state'
complete -c claude -n '__fish_claude_at ""' -a 'setup-token' -d 'Set up a long-lived authentication token (requires Claude subscription)'
complete -c claude -n '__fish_claude_at ""' -a 'ultrareview' -d 'Run a cloud-hosted multi-agent code review of the current branch (or a PR number / base b…'
complete -c claude -n '__fish_claude_at ""' -a 'update' -d 'Check for updates and install if available'
complete -c claude -n '__fish_claude_at ""' -l add-dir -x -a '(__fish_complete_directories)'
complete -c claude -n '__fish_claude_at ""' -l add-dir -d 'Additional directories to allow tool access to' -x
complete -c claude -n '__fish_claude_at ""' -l agent -x -a '(__fish_claude_agents)'
complete -c claude -n '__fish_claude_at ""' -l agent -d 'Agent for the current session. Overrides the \'agent\' setting.' -x
complete -c claude -n '__fish_claude_at ""' -l agents -d 'JSON object defining custom agents (e.g. \'{"reviewer": {"description": "Reviews code", "p…' -r
complete -c claude -n '__fish_claude_at ""' -l allow-dangerously-skip-permissions -d 'Enable bypassing all permission checks as an option, without it being enabled by default.…'
complete -c claude -n '__fish_claude_at ""' -l allowedTools -l allowed-tools -d 'Comma or space-separated list of tool names to allow (e.g. "Bash(git *) Edit")' -r
complete -c claude -n '__fish_claude_at ""' -l append-system-prompt -d 'Append a system prompt to the default system prompt' -r
complete -c claude -n '__fish_claude_at ""' -l autocompact -d 'Auto-compact window size (auto, or 100k–1M tokens)' -r
complete -c claude -n '__fish_claude_at ""' -l ax-screen-reader -d 'Render screen-reader friendly output (flat text, no decorative borders or animations).'
complete -c claude -n '__fish_claude_at ""' -l bg -l background -d 'Start the session as a background agent and return immediately (manage with `claude agent…'
complete -c claude -n '__fish_claude_at ""' -l bare -d 'Minimal mode: skip hooks, LSP, plugin sync, attribution, auto-memory, background prefetch…'
complete -c claude -n '__fish_claude_at ""' -l betas -d 'Beta headers to include in API requests (API key users only)' -r
complete -c claude -n '__fish_claude_at ""' -l brief -d 'Enable SendUserMessage tool for agent-to-user communication'
complete -c claude -n '__fish_claude_at ""' -l chrome -d 'Enable Claude in Chrome integration'
complete -c claude -n '__fish_claude_at ""' -l cloud -d 'Create a cloud session with the given description, or attach to an existing one by sessio…'
complete -c claude -n '__fish_claude_at ""' -s c -l continue -d 'Continue the most recent conversation in the current directory'
complete -c claude -n '__fish_claude_at ""' -l dangerously-skip-permissions -d 'Bypass all permission checks. Recommended only for sandboxes with no internet access.'
complete -c claude -n '__fish_claude_at ""' -s d -l debug -d 'Enable debug mode with optional category filtering (e.g., "api,hooks" or "!1p,!file")'
complete -c claude -n '__fish_claude_at ""' -l debug-file -d 'Write debug logs to a specific file path (implicitly enables debug mode)' -r -F
complete -c claude -n '__fish_claude_at ""' -l disable-slash-commands -d 'Disable all skills'
complete -c claude -n '__fish_claude_at ""' -l disallowedTools -l disallowed-tools -d 'Comma or space-separated list of tool names to deny (e.g. "Bash(git *) Edit")' -r
complete -c claude -n '__fish_claude_at ""' -l effort -x -a 'low medium high xhigh max'
complete -c claude -n '__fish_claude_at ""' -l effort -d 'Effort level for the current session (low, medium, high, xhigh, max)' -x
complete -c claude -n '__fish_claude_at ""' -l environment -d 'Create a new cloud session that runs on the given self-hosted environment (ccpool_...).' -r
complete -c claude -n '__fish_claude_at ""' -l exclude-dynamic-system-prompt-sections -d 'Move per-machine sections (cwd, env info, memory paths, git status) from the system promp…'
complete -c claude -n '__fish_claude_at ""' -l fallback-model -x -a 'fable opus sonnet haiku claude-fable-5 claude-opus-5 claude-sonnet-5 claude-haiku-4-5-20251001'
complete -c claude -n '__fish_claude_at ""' -l fallback-model -d 'Enable automatic fallback to specified model(s) when the default model is overloaded or n…' -x
complete -c claude -n '__fish_claude_at ""' -l file -d 'File resources to download at startup. Format: file_id:relative_path (e.g., --file file_a…' -r -F
complete -c claude -n '__fish_claude_at ""' -l fork-session -d 'When resuming, create a new session ID instead of reusing the original (use with --resume…'
complete -c claude -n '__fish_claude_at ""' -l forward-subagent-text -d 'Forward subagent text and thinking blocks as assistant/user messages with parent_tool_use…'
complete -c claude -n '__fish_claude_at ""' -l from-pr -d 'Resume a session linked to a PR by PR number/URL, or open interactive picker with optiona…'
complete -c claude -n '__fish_claude_at ""' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at ""' -l ide -d 'Automatically connect to IDE on startup if exactly one valid IDE is available'
complete -c claude -n '__fish_claude_at ""' -l include-hook-events -d 'Include all hook lifecycle events in the output stream (only works with --output-format=s…'
complete -c claude -n '__fish_claude_at ""' -l include-partial-messages -d 'Include partial message chunks as they arrive (only works with --print and --output-forma…'
complete -c claude -n '__fish_claude_at ""' -l input-format -x -a 'text stream-json'
complete -c claude -n '__fish_claude_at ""' -l input-format -d 'Input format (only works with --print): "text" (default), or "stream-json" (realtime stre…' -x
complete -c claude -n '__fish_claude_at ""' -l json-schema -d 'JSON Schema for structured output validation. Example: {"type":"object","properties":{"na…' -r
complete -c claude -n '__fish_claude_at ""' -l max-budget-usd -d 'Maximum dollar amount to spend on API calls (only works with --print)' -r
complete -c claude -n '__fish_claude_at ""' -l mcp-config -d 'Load MCP servers from JSON files or strings (space-separated)' -r -F
complete -c claude -n '__fish_claude_at ""' -l model -x -a 'fable opus sonnet haiku claude-fable-5 claude-opus-5 claude-sonnet-5 claude-haiku-4-5-20251001'
complete -c claude -n '__fish_claude_at ""' -l model -d 'Model for the current session. Provide an alias for the latest model (e.g. \'fable\', \'opus…' -x
complete -c claude -n '__fish_claude_at ""' -s n -l name -d 'Set a display name for this session (shown in the prompt box, /resume picker, and termina…' -r
complete -c claude -n '__fish_claude_at ""' -l no-chrome -d 'Disable Claude in Chrome integration'
complete -c claude -n '__fish_claude_at ""' -l no-session-persistence -d 'Disable session persistence - sessions will not be saved to disk and cannot be resumed (o…'
complete -c claude -n '__fish_claude_at ""' -l output-format -x -a 'text json stream-json'
complete -c claude -n '__fish_claude_at ""' -l output-format -d 'Output format (only works with --print): "text" (default), "json" (single result), or "st…' -x
complete -c claude -n '__fish_claude_at ""' -l permission-mode -x -a 'acceptEdits auto bypassPermissions manual dontAsk plan'
complete -c claude -n '__fish_claude_at ""' -l permission-mode -d 'Permission mode to use for the session (choices: "acceptEdits", "auto", "bypassPermission…' -x
complete -c claude -n '__fish_claude_at ""' -l plugin-dir -x -a '(__fish_complete_directories)'
complete -c claude -n '__fish_claude_at ""' -l plugin-dir -d 'Load a plugin from a directory or .zip for this session only (repeatable: --plugin-dir A…' -x
complete -c claude -n '__fish_claude_at ""' -l plugin-url -d 'Fetch a plugin .zip from a URL for this session only (repeatable: --plugin-url A --plugin…' -r
complete -c claude -n '__fish_claude_at ""' -s p -l print -d 'Print response and exit (useful for pipes). Note: The workspace trust dialog is skipped w…'
complete -c claude -n '__fish_claude_at ""' -l prompt-suggestions -x -a 'true false 1 0 yes no on off'
complete -c claude -n '__fish_claude_at ""' -l prompt-suggestions -d 'Enable prompt suggestions. In print/SDK mode, emits a prompt_suggestion message after eac…' -x
complete -c claude -n '__fish_claude_at ""' -l remote-control -d 'Start an interactive session with Remote Control enabled (optionally named)'
complete -c claude -n '__fish_claude_at ""' -l remote-control-session-name-prefix -d 'Prefix for auto-generated Remote Control session names (default: hostname)' -r
complete -c claude -n '__fish_claude_at ""' -l replay-user-messages -d 'Re-emit user messages from stdin back on stdout for acknowledgment (only works with --inp…'
complete -c claude -n '__fish_claude_at ""' -s r -l resume -d 'Resume a conversation by session ID, or open interactive picker with optional search term'
complete -c claude -n '__fish_claude_at ""' -l safe-mode -d 'Start with all customizations (CLAUDE.md, skills, plugins, hooks, MCP servers, custom com…'
complete -c claude -n '__fish_claude_at ""' -l session-id -d 'Use a specific session ID for the conversation (must be a valid UUID)' -r
complete -c claude -n '__fish_claude_at ""' -l setting-sources -d 'Comma-separated list of setting sources to load (user, project, local).' -r
complete -c claude -n '__fish_claude_at ""' -l settings -d 'Path to a settings JSON file or a JSON string to load additional settings from' -r -F
complete -c claude -n '__fish_claude_at ""' -l strict-mcp-config -d 'Only use MCP servers from --mcp-config, ignoring all other MCP configurations'
complete -c claude -n '__fish_claude_at ""' -l system-prompt -d 'System prompt to use for the session' -r
complete -c claude -n '__fish_claude_at ""' -l teleport -d 'Resume a teleport session, optionally specify session ID'
complete -c claude -n '__fish_claude_at ""' -l tmux -d 'Create a tmux session for the worktree (requires --worktree). Uses iTerm2 native panes wh…'
complete -c claude -n '__fish_claude_at ""' -l tools -d 'Specify the list of available tools from the built-in set. Use "" to disable all tools, "…' -r
complete -c claude -n '__fish_claude_at ""' -l verbose -d 'Override verbose mode setting from config'
complete -c claude -n '__fish_claude_at ""' -s v -l version -d 'Output the version number'
complete -c claude -n '__fish_claude_at ""' -s w -l worktree -d 'Create a new git worktree for this session (optionally specify a name)'

# claude agents
complete -c claude -n '__fish_claude_at "agents"' -l add-dir -x -a '(__fish_complete_directories)'
complete -c claude -n '__fish_claude_at "agents"' -l add-dir -d 'Additional directory to allow tool access to in dispatched sessions (repeatable)' -x
complete -c claude -n '__fish_claude_at "agents"' -l agent -x -a '(__fish_claude_agents)'
complete -c claude -n '__fish_claude_at "agents"' -l agent -d 'Default agent for sessions dispatched from agent view. Overrides the \'agent\' setting.' -x
complete -c claude -n '__fish_claude_at "agents"' -l all -d 'With --json: also include completed background sessions'
complete -c claude -n '__fish_claude_at "agents"' -l allow-dangerously-skip-permissions -d 'Make bypass-permissions mode available to dispatched sessions without defaulting to it'
complete -c claude -n '__fish_claude_at "agents"' -l cwd -x -a '(__fish_complete_directories)'
complete -c claude -n '__fish_claude_at "agents"' -l cwd -d 'Show only background sessions started under <path>' -x
complete -c claude -n '__fish_claude_at "agents"' -l dangerously-skip-permissions -d 'Alias for --permission-mode bypassPermissions'
complete -c claude -n '__fish_claude_at "agents"' -l effort -x -a 'low medium high xhigh max'
complete -c claude -n '__fish_claude_at "agents"' -l effort -d 'Default effort level for sessions dispatched from agent view' -x
complete -c claude -n '__fish_claude_at "agents"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "agents"' -l json -d 'Print active sessions (interactive and background) as a JSON array and exit (for scriptin…'
complete -c claude -n '__fish_claude_at "agents"' -l mcp-config -d 'MCP server configuration to apply to dispatched sessions (repeatable)' -r -F
complete -c claude -n '__fish_claude_at "agents"' -l model -x -a 'fable opus sonnet haiku claude-fable-5 claude-opus-5 claude-sonnet-5 claude-haiku-4-5-20251001'
complete -c claude -n '__fish_claude_at "agents"' -l model -d 'Default model for sessions dispatched from agent view' -x
complete -c claude -n '__fish_claude_at "agents"' -l permission-mode -d 'Default permission mode for sessions dispatched from agent view' -r
complete -c claude -n '__fish_claude_at "agents"' -l plugin-dir -x -a '(__fish_complete_directories)'
complete -c claude -n '__fish_claude_at "agents"' -l plugin-dir -d 'Load plugins from specified directory for the agent view and dispatched sessions (repeata…' -x
complete -c claude -n '__fish_claude_at "agents"' -l setting-sources -d 'Comma-separated list of setting sources to load (user, project, local).' -r
complete -c claude -n '__fish_claude_at "agents"' -l settings -d 'Settings file or JSON string to apply to the agent view and dispatched sessions' -r -F
complete -c claude -n '__fish_claude_at "agents"' -l strict-mcp-config -d 'Only use MCP servers from --mcp-config in dispatched sessions'

# claude auth
complete -c claude -n '__fish_claude_at "auth"' -a 'login' -d 'Sign in to your Anthropic account'
complete -c claude -n '__fish_claude_at "auth"' -a 'logout' -d 'Log out from your Anthropic account'
complete -c claude -n '__fish_claude_at "auth"' -a 'status' -d 'Show authentication status'
complete -c claude -n '__fish_claude_at "auth"' -s h -l help -d 'Display help for command'

# claude auth login
complete -c claude -n '__fish_claude_at "auth login"' -l claudeai -d 'Use Claude subscription (default)'
complete -c claude -n '__fish_claude_at "auth login"' -l console -d 'Use Anthropic Console (API usage billing) instead of Claude subscription'
complete -c claude -n '__fish_claude_at "auth login"' -l email -d 'Pre-populate email address on the login page' -r
complete -c claude -n '__fish_claude_at "auth login"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "auth login"' -l sso -d 'Force SSO login flow'

# claude auth logout
complete -c claude -n '__fish_claude_at "auth logout"' -s h -l help -d 'Display help for command'

# claude auth status
complete -c claude -n '__fish_claude_at "auth status"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "auth status"' -l json -d 'Output as JSON (default)'
complete -c claude -n '__fish_claude_at "auth status"' -l text -d 'Output as human-readable text'

# claude auto-mode
complete -c claude -n '__fish_claude_at "auto-mode"' -a 'config' -d 'Print the effective auto mode config as JSON: your settings where set, defaults otherwise'
complete -c claude -n '__fish_claude_at "auto-mode"' -a 'critique' -d 'Get AI feedback on your custom auto mode rules'
complete -c claude -n '__fish_claude_at "auto-mode"' -a 'defaults' -d 'Print the default auto mode environment, allow, soft_deny, and hard_deny rules as JSON'
complete -c claude -n '__fish_claude_at "auto-mode"' -a 'reset' -d 'Reset auto mode configuration to the shipped defaults by removing the autoMode section fr…'
complete -c claude -n '__fish_claude_at "auto-mode"' -s h -l help -d 'Display help for command'

# claude auto-mode config
complete -c claude -n '__fish_claude_at "auto-mode config"' -s h -l help -d 'Display help for command'

# claude auto-mode critique
complete -c claude -n '__fish_claude_at "auto-mode critique"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "auto-mode critique"' -l model -x -a 'fable opus sonnet haiku claude-fable-5 claude-opus-5 claude-sonnet-5 claude-haiku-4-5-20251001'
complete -c claude -n '__fish_claude_at "auto-mode critique"' -l model -d 'Override which model is used' -x

# claude auto-mode defaults
complete -c claude -n '__fish_claude_at "auto-mode defaults"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "auto-mode defaults"' -l label -d 'Show only rules whose label starts with this prefix (case-insensitive)' -r

# claude auto-mode reset
complete -c claude -n '__fish_claude_at "auto-mode reset"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "auto-mode reset"' -s y -l yes -d 'Skip the confirmation prompt'

# claude doctor
complete -c claude -n '__fish_claude_at "doctor"' -s h -l help -d 'Display help for command'

# claude gateway
complete -c claude -n '__fish_claude_at "gateway"' -l config -d 'Path to gateway YAML config' -r -F
complete -c claude -n '__fish_claude_at "gateway"' -s h -l help -d 'Display help for command'

# claude import
complete -c claude -n '__fish_claude_at "import"' -l dry-run -d 'Show what would be imported without writing anything'
complete -c claude -n '__fish_claude_at "import"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "import"' -l yes -d 'Skip the interactive picker. On headless surfaces, pass --yes=<digest> from the `/import`…'

# claude install
complete -c claude -n '__fish_claude_at "install"' -x -a 'stable latest'
complete -c claude -n '__fish_claude_at "install"' -l force -d 'Force installation even if already installed'
complete -c claude -n '__fish_claude_at "install"' -s h -l help -d 'Display help for command'

# claude mcp
complete -c claude -n '__fish_claude_at "mcp"' -a 'add' -d 'Add an MCP server to Claude Code.'
complete -c claude -n '__fish_claude_at "mcp"' -a 'add-from-claude-desktop' -d 'Import MCP servers from Claude Desktop (Mac and WSL only)'
complete -c claude -n '__fish_claude_at "mcp"' -a 'add-json' -d 'Add an MCP server (stdio or SSE) with a JSON string'
complete -c claude -n '__fish_claude_at "mcp"' -a 'get' -d 'Get details about an MCP server. Unapproved .mcp.json servers are shown as ⏸ Pending appr…'
complete -c claude -n '__fish_claude_at "mcp"' -a 'list' -d 'List configured MCP servers. Unapproved .mcp.json servers are shown as ⏸ Pending approval…'
complete -c claude -n '__fish_claude_at "mcp"' -a 'login' -d 'Authenticate with an MCP server (HTTP, SSE, or claude.ai connector)'
complete -c claude -n '__fish_claude_at "mcp"' -a 'logout' -d 'Clear stored OAuth credentials for an MCP server'
complete -c claude -n '__fish_claude_at "mcp"' -a 'remove' -d 'Remove an MCP server'
complete -c claude -n '__fish_claude_at "mcp"' -a 'reset-project-choices' -d 'Reset all approved and rejected project-scoped (.mcp.json) servers within this project'
complete -c claude -n '__fish_claude_at "mcp"' -a 'serve' -d 'Start the Claude Code MCP server'
complete -c claude -n '__fish_claude_at "mcp"' -s h -l help -d 'Display help for command'

# claude mcp add
complete -c claude -n '__fish_claude_at "mcp add"' -l callback-port -d 'Fixed port for OAuth callback (for servers requiring pre-registered redirect URIs)' -r
complete -c claude -n '__fish_claude_at "mcp add"' -l client-id -d 'OAuth client ID for HTTP/SSE servers' -r
complete -c claude -n '__fish_claude_at "mcp add"' -l client-secret -d 'Prompt for OAuth client secret (or set MCP_CLIENT_SECRET env var)'
complete -c claude -n '__fish_claude_at "mcp add"' -s e -l env -d 'Set environment variables (e.g. -e KEY=value)' -r
complete -c claude -n '__fish_claude_at "mcp add"' -s H -l header -d 'Set WebSocket headers (e.g. -H "X-Api-Key: abc123" -H "X-Custom: value")' -r
complete -c claude -n '__fish_claude_at "mcp add"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp add"' -s s -l scope -d 'Configuration scope (local, user, or project) (default: "local")' -r
complete -c claude -n '__fish_claude_at "mcp add"' -s t -l transport -d 'Transport type (stdio, sse, http). Defaults to stdio if not specified.' -r

# claude mcp add-from-claude-desktop
complete -c claude -n '__fish_claude_at "mcp add-from-claude-desktop"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp add-from-claude-desktop"' -s s -l scope -d 'Configuration scope (local, user, or project) (default: "local")' -r

# claude mcp add-json
complete -c claude -n '__fish_claude_at "mcp add-json"' -l client-secret -d 'Prompt for OAuth client secret (or set MCP_CLIENT_SECRET env var)'
complete -c claude -n '__fish_claude_at "mcp add-json"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp add-json"' -s s -l scope -d 'Configuration scope (local, user, or project) (default: "local")' -r

# claude mcp get
complete -c claude -n '__fish_claude_at "mcp get"' -s h -l help -d 'Display help for command'

# claude mcp list
complete -c claude -n '__fish_claude_at "mcp list"' -s h -l help -d 'Display help for command'

# claude mcp login
complete -c claude -n '__fish_claude_at "mcp login"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp login"' -l no-browser -d 'Print the authorization URL instead of opening a browser (for SSH/headless sessions — pas…'

# claude mcp logout
complete -c claude -n '__fish_claude_at "mcp logout"' -s h -l help -d 'Display help for command'

# claude mcp remove
complete -c claude -n '__fish_claude_at "mcp remove"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp remove"' -s s -l scope -d 'Configuration scope (local, user, or project) - if not specified, removes from whichever…' -r

# claude mcp reset-project-choices
complete -c claude -n '__fish_claude_at "mcp reset-project-choices"' -s h -l help -d 'Display help for command'

# claude mcp serve
complete -c claude -n '__fish_claude_at "mcp serve"' -s d -l debug -d 'Enable debug mode'
complete -c claude -n '__fish_claude_at "mcp serve"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "mcp serve"' -l verbose -d 'Override verbose mode setting from config'

# claude plugin
complete -c claude -n '__fish_claude_at "plugin"' -a 'details' -d 'Show a plugin\'s component inventory and projected token cost'
complete -c claude -n '__fish_claude_at "plugin"' -a 'disable' -d 'Disable an enabled plugin'
complete -c claude -n '__fish_claude_at "plugin"' -a 'enable' -d 'Enable a disabled plugin'
complete -c claude -n '__fish_claude_at "plugin"' -a 'eval' -d 'Run eval cases (evals/**/case.yaml or evals/**/prompt.md + graders/*.md) against a plugin…'
complete -c claude -n '__fish_claude_at "plugin"' -a 'init' -d 'Scaffold a new plugin at ~/.claude/skills/<name>/ (auto-loads next session as <name>@skil…'
complete -c claude -n '__fish_claude_at "plugin"' -a 'install' -d 'Install a plugin from available marketplaces (use plugin@marketplace for specific marketp…'
complete -c claude -n '__fish_claude_at "plugin"' -a 'list' -d 'List installed plugins'
complete -c claude -n '__fish_claude_at "plugin"' -a 'marketplace' -d 'Manage Claude Code marketplaces'
complete -c claude -n '__fish_claude_at "plugin"' -a 'prune' -d 'Remove auto-installed dependencies that are no longer needed'
complete -c claude -n '__fish_claude_at "plugin"' -a 'tag' -d 'Create a {name}--v{version} git tag for a plugin release, validating that plugin.json and…'
complete -c claude -n '__fish_claude_at "plugin"' -a 'uninstall' -d 'Uninstall an installed plugin'
complete -c claude -n '__fish_claude_at "plugin"' -a 'update' -d 'Update a plugin to the latest version (restart required to apply)'
complete -c claude -n '__fish_claude_at "plugin"' -a 'validate' -d 'Validate a plugin or marketplace manifest'
complete -c claude -n '__fish_claude_at "plugin"' -s h -l help -d 'Display help for command'

# claude plugin details
complete -c claude -n '__fish_claude_at "plugin details"' -x -a '(__fish_claude_plugins)'
complete -c claude -n '__fish_claude_at "plugin details"' -s h -l help -d 'Display help for command'

# claude plugin disable
complete -c claude -n '__fish_claude_at "plugin disable"' -x -a '(__fish_claude_plugins)'
complete -c claude -n '__fish_claude_at "plugin disable"' -s a -l all -d 'Disable all enabled plugins'
complete -c claude -n '__fish_claude_at "plugin disable"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin disable"' -s s -l scope -d 'Installation scope: user, project, local (default: auto-detect)' -r

# claude plugin enable
complete -c claude -n '__fish_claude_at "plugin enable"' -x -a '(__fish_claude_plugins)'
complete -c claude -n '__fish_claude_at "plugin enable"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin enable"' -s s -l scope -d 'Installation scope: user, project, local (default: auto-detect)' -r

# claude plugin eval
complete -c claude -n '__fish_claude_at "plugin eval"' -a 'init' -d 'Author an eval suite under evals/ via an interview that sources inputs and designs grader…'
complete -c claude -n '__fish_claude_at "plugin eval"' -l ablation -d 'Run a no-plugin baseline arm and report the score delta (none | with-without; default: wi…' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l allow-tools -d 'Operator grant for gated tools (Bash, Write, Edit, WebFetch, mcp__*). Supports Tool(patte…' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l case -d 'Filter cases by name glob' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin eval"' -l json -d 'Print the full run result (prompts, graders, per-run scores) as JSON to stdout, or write…'
complete -c claude -n '__fish_claude_at "plugin eval"' -l judge-model -d 'Override LLM-grader model (default: haiku)' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l keep-temp -d 'Preserve scaffold dirs for debugging'
complete -c claude -n '__fish_claude_at "plugin eval"' -l max-cost-usd -d 'Optional hard cost ceiling; abort and report partial results if hit (exit 2). Overrun is…' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l model -x -a 'fable opus sonnet haiku claude-fable-5 claude-opus-5 claude-sonnet-5 claude-haiku-4-5-20251001'
complete -c claude -n '__fish_claude_at "plugin eval"' -l model -d 'Override model for all cases' -x
complete -c claude -n '__fish_claude_at "plugin eval"' -l no-publish -d 'Keep the HTML report local only; skip publishing it to claude.ai'
complete -c claude -n '__fish_claude_at "plugin eval"' -l no-scaffold -d 'Explicitly skip scaffold_script'
complete -c claude -n '__fish_claude_at "plugin eval"' -l output-dir -d 'Directory for aggregate-result.json (default: ./evals/results/<timestamp>/)' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l publish-report -d 'Also require publishing the report to claude.ai (already the default when your account su…'
complete -c claude -n '__fish_claude_at "plugin eval"' -l report -d 'Write the self-contained HTML report (scores, prompts, grader verdicts) to <path> instead…' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l runs -d 'Override per-case runs (default: case.runs ?? 3)' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l scaffold -d 'Run each case\'s scaffold_script (runs author-supplied bash as you; off by default — only…'
complete -c claude -n '__fish_claude_at "plugin eval"' -l tag -d 'Filter cases by tag (repeatable)' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l threshold -d 'Exit 1 if any case score is below this threshold (default: 1.0)' -r
complete -c claude -n '__fish_claude_at "plugin eval"' -l verbose -d 'Stream the trace as it runs'

# claude plugin eval init
complete -c claude -n '__fish_claude_at "plugin eval init"' -l bare -d 'Write a blank template (prompt.md + graders/criteria.md) instead of running the interview'
complete -c claude -n '__fish_claude_at "plugin eval init"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin eval init"' -s i -l interactive -d 'Run the authoring interview (already the default in a terminal); requires an interactive…'

# claude plugin init
complete -c claude -n '__fish_claude_at "plugin init"' -l author -d 'Author name (default: git config user.name)' -r
complete -c claude -n '__fish_claude_at "plugin init"' -l author-email -d 'Author email (default: git config user.email)' -r
complete -c claude -n '__fish_claude_at "plugin init"' -l description -d 'Manifest description' -r
complete -c claude -n '__fish_claude_at "plugin init"' -s f -l force -d 'Overwrite an existing .claude-plugin/ at the target'
complete -c claude -n '__fish_claude_at "plugin init"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin init"' -l with -d 'Also scaffold: skills, agents, hooks, mcp, lsp, output-style, channel' -r

# claude plugin install
complete -c claude -n '__fish_claude_at "plugin install"' -l config -d 'Set a userConfig option declared in the plugin\'s manifest (repeatable). Values are valida…' -r -F
complete -c claude -n '__fish_claude_at "plugin install"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin install"' -s s -l scope -d 'Installation scope: user, project, or local (default: "user")' -r
complete -c claude -n '__fish_claude_at "plugin install"' -s y -l yes -d 'For a plugin installed by running a marketplace-declared command: accept the displayed co…'

# claude plugin list
complete -c claude -n '__fish_claude_at "plugin list"' -l available -d 'Include available plugins from marketplaces (requires --json)'
complete -c claude -n '__fish_claude_at "plugin list"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin list"' -l json -d 'Output as JSON'

# claude plugin marketplace
complete -c claude -n '__fish_claude_at "plugin marketplace"' -a 'add' -d 'Add a marketplace from a URL, path, or GitHub repo'
complete -c claude -n '__fish_claude_at "plugin marketplace"' -a 'list' -d 'List all configured marketplaces'
complete -c claude -n '__fish_claude_at "plugin marketplace"' -a 'remove' -d 'Remove a configured marketplace'
complete -c claude -n '__fish_claude_at "plugin marketplace"' -a 'update' -d 'Update marketplace(s) from their source - updates all if no name specified'
complete -c claude -n '__fish_claude_at "plugin marketplace"' -s h -l help -d 'Display help for command'

# claude plugin marketplace add
complete -c claude -n '__fish_claude_at "plugin marketplace add"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin marketplace add"' -l scope -d 'Where to declare the marketplace: user (default), project, or local' -r
complete -c claude -n '__fish_claude_at "plugin marketplace add"' -l sparse -d 'Limit checkout to specific directories via git sparse-checkout (for monorepos). Example:…' -r

# claude plugin marketplace list
complete -c claude -n '__fish_claude_at "plugin marketplace list"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin marketplace list"' -l json -d 'Output as JSON'

# claude plugin marketplace remove
complete -c claude -n '__fish_claude_at "plugin marketplace remove"' -x -a '(__fish_claude_marketplaces)'
complete -c claude -n '__fish_claude_at "plugin marketplace remove"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin marketplace remove"' -l scope -d 'Remove the marketplace declaration from a specific settings scope: user, project, or loca…' -r

# claude plugin marketplace update
complete -c claude -n '__fish_claude_at "plugin marketplace update"' -x -a '(__fish_claude_marketplaces)'
complete -c claude -n '__fish_claude_at "plugin marketplace update"' -s h -l help -d 'Display help for command'

# claude plugin prune
complete -c claude -n '__fish_claude_at "plugin prune"' -l dry-run -d 'List what would be removed without removing'
complete -c claude -n '__fish_claude_at "plugin prune"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin prune"' -s s -l scope -d 'Prune at scope: user, project, or local (default: "user")' -r
complete -c claude -n '__fish_claude_at "plugin prune"' -s y -l yes -d 'Skip the confirmation prompt (required when stdin or stdout is not a TTY)'

# claude plugin tag
complete -c claude -n '__fish_claude_at "plugin tag"' -l dry-run -d 'Print what would be tagged without creating it'
complete -c claude -n '__fish_claude_at "plugin tag"' -s f -l force -d 'Skip the dirty-working-tree and tag-already-exists checks'
complete -c claude -n '__fish_claude_at "plugin tag"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin tag"' -s m -l message -d 'Tag annotation message (use %s for the version)' -r
complete -c claude -n '__fish_claude_at "plugin tag"' -l push -d 'Push the tag to --remote after creating it'
complete -c claude -n '__fish_claude_at "plugin tag"' -l remote -d 'Remote to push to with --push (default: "origin")' -r

# claude plugin uninstall
complete -c claude -n '__fish_claude_at "plugin uninstall"' -x -a '(__fish_claude_plugins)'
complete -c claude -n '__fish_claude_at "plugin uninstall"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin uninstall"' -l keep-data -d 'Preserve the plugin\'s persistent data directory (~/.claude/plugins/data/{id}/)'
complete -c claude -n '__fish_claude_at "plugin uninstall"' -l prune -d 'Also remove auto-installed dependencies that are no longer needed (requires -y in non-int…'
complete -c claude -n '__fish_claude_at "plugin uninstall"' -s s -l scope -d 'Uninstall from scope: user, project, or local (default: "user")' -r
complete -c claude -n '__fish_claude_at "plugin uninstall"' -s y -l yes -d 'Skip the --prune confirmation prompt (required when stdin or stdout is not a TTY)'

# claude plugin update
complete -c claude -n '__fish_claude_at "plugin update"' -x -a '(__fish_claude_plugins)'
complete -c claude -n '__fish_claude_at "plugin update"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin update"' -s s -l scope -d 'Installation scope: user, project, local, managed (default: user)' -r
complete -c claude -n '__fish_claude_at "plugin update"' -s y -l yes -d 'For a plugin installed by running a marketplace-declared command: accept a changed comman…'

# claude plugin validate
complete -c claude -n '__fish_claude_at "plugin validate"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "plugin validate"' -l strict -d 'Treat warnings as errors (exit 1). Use in CI to fail on unrecognized fields, missing meta…'

# claude project
complete -c claude -n '__fish_claude_at "project"' -a 'purge' -d 'Delete all Claude Code state for a project (transcripts, tasks, file history, config entr…'
complete -c claude -n '__fish_claude_at "project"' -s h -l help -d 'Display help for command'

# claude project purge
complete -c claude -n '__fish_claude_at "project purge"' -l all -d 'Purge state for every project (mutually exclusive with [path])'
complete -c claude -n '__fish_claude_at "project purge"' -l dry-run -d 'List what would be deleted without deleting anything'
complete -c claude -n '__fish_claude_at "project purge"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "project purge"' -s i -l interactive -d 'Prompt for each item before deleting'
complete -c claude -n '__fish_claude_at "project purge"' -s y -l yes -d 'Skip confirmation prompt'

# claude setup-token
complete -c claude -n '__fish_claude_at "setup-token"' -s h -l help -d 'Display help for command'

# claude ultrareview
complete -c claude -n '__fish_claude_at "ultrareview"' -s h -l help -d 'Display help for command'
complete -c claude -n '__fish_claude_at "ultrareview"' -l json -d 'Print the raw bugs.json payload instead of formatted findings'
complete -c claude -n '__fish_claude_at "ultrareview"' -l no-post -d 'Do not post the findings to the PR (the default; accepted for parity with the /ultrarevie…'
complete -c claude -n '__fish_claude_at "ultrareview"' -l post -d 'Post the finished review\'s findings to the PR as you (PR targets only; one plain comment,…'
complete -c claude -n '__fish_claude_at "ultrareview"' -l timeout -d 'Maximum minutes to wait for the review to finish (default: 30)' -r

# claude update
complete -c claude -n '__fish_claude_at "update"' -s h -l help -d 'Display help for command'
