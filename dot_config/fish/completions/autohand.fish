# Autohand CLI Fish Completion
# Save to ~/.config/fish/completions/autohand.fish
# Or run: autohand completion fish > ~/.config/fish/completions/autohand.fish

# Disable file completion by default
complete -c autohand -f

# Options
complete -c autohand -l prompt -d 'Run a single instruction'
complete -c autohand -l path -d 'Set workspace path'
complete -c autohand -l yes -d 'Auto-confirm all prompts'
complete -c autohand -l dry-run -d 'Preview without applying changes'
complete -c autohand -l model -d 'Override the LLM model'
complete -c autohand -l config -d 'Path to config file'
complete -c autohand -l temperature -d 'Sampling temperature'
complete -c autohand -l unrestricted -d 'Skip all approval prompts'
complete -c autohand -l restricted -d 'Block all dangerous operations'
complete -c autohand -l help -d 'Show help'
complete -c autohand -l version -d 'Show version'

# Slash commands
complete -c autohand -a '/quit' -d 'Slash command'
complete -c autohand -a '/model' -d 'Slash command'
complete -c autohand -a '/session' -d 'Slash command'
complete -c autohand -a '/sessions' -d 'Slash command'
complete -c autohand -a '/resume' -d 'Slash command'
complete -c autohand -a '/new' -d 'Slash command'
complete -c autohand -a '/undo' -d 'Slash command'
complete -c autohand -a '/memory' -d 'Slash command'
complete -c autohand -a '/init' -d 'Slash command'
complete -c autohand -a '/agents' -d 'Slash command'
complete -c autohand -a '/agents-new' -d 'Slash command'
complete -c autohand -a '/feedback' -d 'Slash command'
complete -c autohand -a '/help' -d 'Slash command'
complete -c autohand -a '/formatters' -d 'Slash command'
complete -c autohand -a '/lint' -d 'Slash command'
complete -c autohand -a '/export' -d 'Slash command'
complete -c autohand -a '/mcp' -d 'Slash command'
complete -c autohand -a '/about' -d 'Slash command'
complete -c autohand -a '/status' -d 'Slash command'
complete -c autohand -a '/hooks' -d 'Slash command'
complete -c autohand -a '/theme' -d 'Slash command'
complete -c autohand -a '/completion' -d 'Slash command'
complete -c autohand -a '/share' -d 'Slash command'
complete -c autohand -a '/plan' -d 'Slash command'
complete -c autohand -a '/search' -d 'Slash command'
complete -c autohand -a '/skills' -d 'Slash command'

# File completion for specific options
complete -c autohand -l path -rF
complete -c autohand -l config -rF

# Enable file mention with @
function __autohand_file_mention
    set -l files (git ls-files 2>/dev/null; or find . -type f -maxdepth 3 2>/dev/null)
    for f in $files
        echo "@$f"
    end
end

complete -c autohand -a '(__autohand_file_mention)' -n '__fish_seen_argument -l prompt'

