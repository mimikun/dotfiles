# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rvpm_global_optspecs
	string join \n h/help V/version
end

function __fish_rvpm_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rvpm_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rvpm_using_subcommand
	set -l cmd (__fish_rvpm_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rvpm -n "__fish_rvpm_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_needs_command" -s V -l version -d 'Print version'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "sync" -d 'Clone/pull plugins and regenerate loader.lua'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "generate" -d 'Regenerate loader.lua only (no git)'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "clean" -d 'Delete plugin directories no longer referenced by config.toml'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "add" -d 'Add a plugin and sync'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "tune" -d 'Tune an existing plugin\'s config with the AI backend'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "edit" -d 'Edit per-plugin or global hook files in $EDITOR'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "set" -d 'Tweak a plugin\'s options interactively'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "update" -d 'Update (git pull) installed plugins'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "remove" -d 'Remove a plugin and delete its directory'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "list" -d 'Show plugin list (TUI by default, plain text with --no-tui)'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "config" -d 'Open config.toml in $EDITOR'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "init" -d 'Print or write the init.lua loader snippet'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "browse" -d 'Browse and install Neovim plugins from GitHub'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "doctor" -d 'Diagnose rvpm\'s config, state, and environment'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "profile" -d 'Profile Neovim startup time per plugin'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "log" -d 'Show recent sync/update/add changes'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "completion" -d 'Print a shell completion script to stdout (#114)'
complete -c rvpm -n "__fish_rvpm_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l rebuild -d 'Run each plugin\'s `build` command even when git HEAD did not move. By default `sync` skips build for plugins whose pull was a no-op, which makes "nothing changed" syncs much faster. Use this when you need to rerun e.g. `:TSUpdate` or a manual rebuild step' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l prune -d 'Delete unused plugin directories after syncing'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l frozen -d 'Error out if any non-dev plugin is missing from rvpm.lock (strict reproducibility for CI / fresh machines)'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l no-lock -d 'Ignore rvpm.lock entirely: pull latest and do not write the lockfile'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l refresh -d 'Force-refresh every plugin\'s git state regardless of the fetch cache (`options.fetch_interval`). Useful before checking for held-back plugins when you want a guaranteed fresh remote read'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -l no-refresh -d 'Skip git fetch for every plugin regardless of the fetch cache (offline mode). Plugins whose local HEAD already matches the effective rev complete instantly; others fall through to a local checkout that errors if the commit isn\'t already available'
complete -c rvpm -n "__fish_rvpm_using_subcommand sync" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand generate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand clean" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l name -d 'Friendly name (optional)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l lazy -d 'Set lazy flag' -r -f -a "true\t''
false\t''"
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l on-cmd -d 'Set on_cmd. Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l on-ft -d 'Set on_ft. Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l on-map -d 'Set on_map. Comma-separated or JSON array/object' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l on-event -d 'Set on_event. Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l rev -d 'Set rev (branch/tag/commit)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l ai -d 'AI backend for this `add`. Replaces the static-scan + auto-lazy path: the chosen CLI (`claude` / `gemini` / `codex`) reads the plugin\'s README + your config and proposes the full `[[plugins]]` block plus any per-plugin hook files. Overrides `options.ai` for this call' -r -f -a "off\t'Use the static scan + auto_lazy flow (default)'
claude\t'Spawn the `claude` CLI as a subprocess'
gemini\t'Spawn the `gemini` CLI as a subprocess'
codex\t'Spawn the `codex` CLI as a subprocess'"
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l auto-lazy -d 'Accept auto-scanned on_cmd / on_map without prompting. Overrides `options.auto_lazy` for this call (== "always"). Useful for non-TTY scripts that want lazy-by-default'
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l no-lazy -d 'Skip the auto-scan entirely for this invocation. Overrides `options.auto_lazy` for this call (== "never"). This does not override explicit `--lazy` / `--on-*` flags — if the plugin is lazy via those, it stays lazy'
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -l no-ai -d 'Force the static-scan path even if `options.ai` is set in config'
complete -c rvpm -n "__fish_rvpm_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand tune" -l ai -d 'AI backend for this `tune`. Overrides `options.ai` for this call' -r -f -a "off\t'Use the static scan + auto_lazy flow (default)'
claude\t'Spawn the `claude` CLI as a subprocess'
gemini\t'Spawn the `gemini` CLI as a subprocess'
codex\t'Spawn the `codex` CLI as a subprocess'"
complete -c rvpm -n "__fish_rvpm_using_subcommand tune" -l no-ai -d 'Force-disable AI for this call. `tune` is AI-only, so this effectively errors out — provided for symmetry with `add`'
complete -c rvpm -n "__fish_rvpm_using_subcommand tune" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand edit" -l init -d 'Open init.lua directly (per-plugin path, or Neovim\'s own with --global)'
complete -c rvpm -n "__fish_rvpm_using_subcommand edit" -l before -d 'Open before.lua directly'
complete -c rvpm -n "__fish_rvpm_using_subcommand edit" -l after -d 'Open after.lua directly'
complete -c rvpm -n "__fish_rvpm_using_subcommand edit" -l global -d 'Edit global hooks instead of per-plugin files'
complete -c rvpm -n "__fish_rvpm_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l lazy -d 'Set lazy flag non-interactively' -r -f -a "true\t''
false\t''"
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l merge -d 'Set merge flag non-interactively' -r -f -a "true\t''
false\t''"
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-cmd -d 'Set on_cmd. Comma-separated (`"Foo,Bar"`) or JSON array (`\'["Foo","Bar"]\'`)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-ft -d 'Set on_ft. Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-map -d 'Set on_map. Comma-separated lhs list, JSON array of strings, or JSON array/object with full `{ lhs, mode, desc }` form. Example: --on-map \'{"lhs":"<space>d","mode":["n","x"]}\'' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-event -d 'Set on_event. Comma-separated or JSON array. Supports the `"User Xxx"` shorthand for User events with patterns' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-path -d 'Set on_path glob list. Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l on-source -d 'Set on_source (plugin names). Comma-separated or JSON array' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -l rev -d 'Set rev (branch/tag/commit) non-interactively' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand update" -s h -l help -d 'Print help'
complete -c rvpm -n "__fish_rvpm_using_subcommand remove" -s h -l help -d 'Print help'
complete -c rvpm -n "__fish_rvpm_using_subcommand list" -l no-tui -d 'Print plain text instead of launching the TUI'
complete -c rvpm -n "__fish_rvpm_using_subcommand list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand config" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand init" -l write -d 'Append to init.lua (creates the file if missing)'
complete -c rvpm -n "__fish_rvpm_using_subcommand init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand browse" -s h -l help -d 'Print help'
complete -c rvpm -n "__fish_rvpm_using_subcommand doctor" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l runs -d 'Number of nvim runs to average (default 3, max 20)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l top -d 'Limit plain / JSON output to top N plugins (TUI ignores this)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l json -d 'Emit the averaged report as JSON to stdout'
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l no-tui -d 'Plain text output instead of the TUI'
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l no-merge -d 'Treat all plugins as merge=false for this measurement, so each plugin\'s files source from their own repos/<canonical>/ path instead of the shared merged/ dir. Lets you see per-plugin load time even for plugins that are normally merged, and compare the cost of merging. merged/ itself is not touched'
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -l no-instrument -d 'Skip phase-marker instrumentation. Faster and avoids swapping loader.lua during the profile run. You lose the phase timeline and per-plugin init/trig columns, but raw per-plugin self ms is still measured'
complete -c rvpm -n "__fish_rvpm_using_subcommand profile" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand log" -l last -d 'How many recent runs to show (default: 1, max: 20)' -r
complete -c rvpm -n "__fish_rvpm_using_subcommand log" -l full -d 'Show full commit body in addition to subject (currently subject-only)'
complete -c rvpm -n "__fish_rvpm_using_subcommand log" -l diff -d 'Inline `git diff` for changed README/CHANGELOG/doc files'
complete -c rvpm -n "__fish_rvpm_using_subcommand log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "sync" -d 'Clone/pull plugins and regenerate loader.lua'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "generate" -d 'Regenerate loader.lua only (no git)'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "clean" -d 'Delete plugin directories no longer referenced by config.toml'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "add" -d 'Add a plugin and sync'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "tune" -d 'Tune an existing plugin\'s config with the AI backend'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "edit" -d 'Edit per-plugin or global hook files in $EDITOR'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "set" -d 'Tweak a plugin\'s options interactively'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "update" -d 'Update (git pull) installed plugins'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "remove" -d 'Remove a plugin and delete its directory'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "list" -d 'Show plugin list (TUI by default, plain text with --no-tui)'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "config" -d 'Open config.toml in $EDITOR'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "init" -d 'Print or write the init.lua loader snippet'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "browse" -d 'Browse and install Neovim plugins from GitHub'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "doctor" -d 'Diagnose rvpm\'s config, state, and environment'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "profile" -d 'Profile Neovim startup time per plugin'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "log" -d 'Show recent sync/update/add changes'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "completion" -d 'Print a shell completion script to stdout (#114)'
complete -c rvpm -n "__fish_rvpm_using_subcommand help; and not __fish_seen_subcommand_from sync generate clean add tune edit set update remove list config init browse doctor profile log completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
