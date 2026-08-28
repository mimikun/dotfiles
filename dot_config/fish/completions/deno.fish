complete -c deno -e

function __fish_deno_no_subcommand
    for i in (commandline -opc)
        if test $i = 'run'
            return 1
        end
        if test $i = 'watch'
            return 1
        end
        if test $i = 'serve'
            return 1
        end
        if test $i = 'eval'
            return 1
        end
        if test $i = 'fmt'
            return 1
        end
        if test $i = 'lint'
            return 1
        end
        if test $i = 'test'
            return 1
        end
        if test $i = 'upgrade'
            return 1
        end
        if test $i = 'cache'
            return 1
        end
        if test $i = 'check'
            return 1
        end
        if test $i = 'info'
            return 1
        end
        if test $i = 'doc'
            return 1
        end
        if test $i = 'task'
            return 1
        end
        if test $i = 'bench'
            return 1
        end
        if test $i = 'compile'
            return 1
        end
        if test $i = 'coverage'
            return 1
        end
        if test $i = 'repl'
            return 1
        end
        if test $i = 'install'
            return 1
        end
        if test $i = 'uninstall'
            return 1
        end
        if test $i = 'types'
            return 1
        end
        if test $i = 'completions'
            return 1
        end
        if test $i = 'init'
            return 1
        end
        if test $i = 'create'
            return 1
        end
        if test $i = 'jupyter'
            return 1
        end
        if test $i = 'publish'
            return 1
        end
        if test $i = 'add'
            return 1
        end
        if test $i = 'remove'
            return 1
        end
        if test $i = 'outdated'
            return 1
        end
        if test $i = 'update'
            return 1
        end
        if test $i = 'deploy'
            return 1
        end
        if test $i = 'sandbox'
            return 1
        end
        if test $i = 'clean'
            return 1
        end
        if test $i = 'list'
            return 1
        end
        if test $i = 'link'
            return 1
        end
        if test $i = 'unlink'
            return 1
        end
        if test $i = 'approve-scripts'
            return 1
        end
        if test $i = 'lsp'
            return 1
        end
        if test $i = 'vendor'
            return 1
        end
        if test $i = 'bundle'
            return 1
        end
        if test $i = 'audit'
            return 1
        end
        if test $i = 'why'
            return 1
        end
        if test $i = 'transpile'
            return 1
        end
        if test $i = 'bump-version'
            return 1
        end
        if test $i = 'ci'
            return 1
        end
        if test $i = 'desktop'
            return 1
        end
        if test $i = 'pack'
            return 1
        end
        if test $i = 'x'
            return 1
        end
        if test $i = 'json_reference'
            return 1
        end
        if test $i = 'help'
            return 1
        end
    end
    return 0
end

complete -c deno -n __fish_deno_no_subcommand -a run -d 'Run a JavaScript or TypeScript program, or a task'
complete -c deno -n __fish_deno_no_subcommand -a watch -d 'Run a JavaScript or TypeScript program, watching for file changes and hot-replacing modules'
complete -c deno -n __fish_deno_no_subcommand -a serve -d 'Run a server'
complete -c deno -n __fish_deno_no_subcommand -a eval -d 'Evaluate a script from the command line'
complete -c deno -n __fish_deno_no_subcommand -a fmt -d 'Format source files'
complete -c deno -n __fish_deno_no_subcommand -a lint -d 'Lint source files'
complete -c deno -n __fish_deno_no_subcommand -a test -d 'Run tests'
complete -c deno -n __fish_deno_no_subcommand -a upgrade -d 'Upgrade deno executable to given version'
complete -c deno -n __fish_deno_no_subcommand -a cache -d 'Cache the dependencies'
complete -c deno -n __fish_deno_no_subcommand -a check -d 'Type-check the dependencies'
complete -c deno -n __fish_deno_no_subcommand -a info -d 'Show info about cache or info related to source file'
complete -c deno -n __fish_deno_no_subcommand -a doc -d 'Generate and show documentation for a module or built-ins'
complete -c deno -n __fish_deno_no_subcommand -a task -d 'Run a task defined in the configuration file'
complete -c deno -n __fish_deno_no_subcommand -a bench -d 'Run benchmarks'
complete -c deno -n __fish_deno_no_subcommand -a compile -d 'Compile the script into a self contained executable'
complete -c deno -n __fish_deno_no_subcommand -a coverage -d 'Print coverage reports'
complete -c deno -n __fish_deno_no_subcommand -a repl -d 'Start an interactive Read-Eval-Print Loop (REPL) for Deno'
complete -c deno -n __fish_deno_no_subcommand -a install -d 'Installs dependencies either in the local project or globally to a bin directory'
complete -c deno -n __fish_deno_no_subcommand -a uninstall -d 'Uninstalls a dependency or an executable script in the installation root\'s bin directory'
complete -c deno -n __fish_deno_no_subcommand -a types -d 'Print runtime TypeScript declarations'
complete -c deno -n __fish_deno_no_subcommand -a completions -d 'Generate shell completions'
complete -c deno -n __fish_deno_no_subcommand -a init -d 'Initialize a new project'
complete -c deno -n __fish_deno_no_subcommand -a create -d 'Create a project from a template'
complete -c deno -n __fish_deno_no_subcommand -a jupyter -d 'Deno kernel for Jupyter notebooks'
complete -c deno -n __fish_deno_no_subcommand -a publish -d 'Publish the current working directory\'s package or workspace'
complete -c deno -n __fish_deno_no_subcommand -a add -d 'Add dependencies'
complete -c deno -n __fish_deno_no_subcommand -a remove -d 'Remove dependencies'
complete -c deno -n __fish_deno_no_subcommand -a outdated -d 'Find outdated dependencies'
complete -c deno -n __fish_deno_no_subcommand -a update -d 'Update outdated dependencies'
complete -c deno -n __fish_deno_no_subcommand -a deploy -d 'Deploy to Deno Deploy'
complete -c deno -n __fish_deno_no_subcommand -a sandbox -d 'Run in sandbox mode'
complete -c deno -n __fish_deno_no_subcommand -a clean -d 'Remove the cache directory'
complete -c deno -n __fish_deno_no_subcommand -a list -d 'List the dependencies declared in deno.json / package.json'
complete -c deno -n __fish_deno_no_subcommand -a link -d 'Link a local JSR package into the current project for development'
complete -c deno -n __fish_deno_no_subcommand -a unlink -d 'Remove a linked local package from the current project'
complete -c deno -n __fish_deno_no_subcommand -a approve-scripts -d 'Approve npm lifecycle scripts'
complete -c deno -n __fish_deno_no_subcommand -a lsp -d 'Start the language server'
complete -c deno -n __fish_deno_no_subcommand -a vendor -d '`deno vendor` was removed in Deno 2.

See the Deno 1.x to 2.x Migration Guide for migration instructions: https://docs.deno.com/runtime/manual/advanced/migrate_deprecations'
complete -c deno -n __fish_deno_no_subcommand -a bundle -d 'Output a single JavaScript file with all dependencies'
complete -c deno -n __fish_deno_no_subcommand -a audit -d 'Audit currently installed dependencies'
complete -c deno -n __fish_deno_no_subcommand -a why -d 'Show why a package is installed'
complete -c deno -n __fish_deno_no_subcommand -a transpile -d 'Transpile TypeScript/JSX/TSX files to JavaScript'
complete -c deno -n __fish_deno_no_subcommand -a bump-version -d 'Update version in the configuration file'
complete -c deno -n __fish_deno_no_subcommand -a ci -d 'Install dependencies from a lockfile in a frozen state'
complete -c deno -n __fish_deno_no_subcommand -a desktop -d 'Compile a script into a desktop application'
complete -c deno -n __fish_deno_no_subcommand -a pack -d 'Create a tarball of the package'
complete -c deno -n __fish_deno_no_subcommand -a x -d 'Execute a binary from npm or jsr, like npx'
complete -c deno -n __fish_deno_no_subcommand -a json_reference -d ''

complete -c deno -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -s h -l help -d ''
complete -c deno -s V -l version -d 'Print version'
complete -c deno -s L -l log-level -d 'Set log level'
complete -c deno -s q -l quiet -d 'Suppress diagnostic output'

complete -c deno -n '__fish_seen_subcommand_from run' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from run' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from run' -l hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from run' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from run' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from run' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from run' -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.'
complete -c deno -n '__fish_seen_subcommand_from run' -l use-env-proxy -d 'Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from run' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from run' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from run' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from run' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from run' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from run' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from run' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from run' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from run' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from run' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from run' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from run' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from run' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from run' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from run' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from run' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from run' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from run' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from run' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from run' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from run' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from run' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from run' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from run' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from watch' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from watch' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from watch' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from watch' -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l use-env-proxy -d 'Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from watch' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from watch' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from watch' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from watch' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from watch' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from watch' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from watch' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from watch' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from watch' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from watch' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from watch' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from watch' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from watch' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from watch' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from watch' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from watch' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from watch' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from watch' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from watch' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from watch' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from watch' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from watch' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from serve' -l port -d 'The TCP port to serve on. Pass 0 to pick a random free port [default: 8000]'
complete -c deno -n '__fish_seen_subcommand_from serve' -l host -d 'The TCP address to serve on, defaulting to 0.0.0.0 (all interfaces)'
complete -c deno -n '__fish_seen_subcommand_from serve' -l open -d 'Open the browser on the address that the server is running on.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l parallel -d 'Run multiple server workers in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable'
complete -c deno -n '__fish_seen_subcommand_from serve' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l watch-hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from serve' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from serve' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from serve' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from serve' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from serve' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from serve' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from serve' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from serve' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from serve' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from serve' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from serve' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from serve' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from serve' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from serve' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from serve' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from serve' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from serve' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from serve' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from serve' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from serve' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from serve' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from serve' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from serve' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from serve' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from eval' -l print -d 'print result to stdout'
complete -c deno -n '__fish_seen_subcommand_from eval' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from eval' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from eval' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from eval' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from eval' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from eval' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from eval' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from eval' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from eval' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from eval' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from eval' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from eval' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from eval' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from eval' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from eval' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from eval' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from eval' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from eval' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from eval' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from eval' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from eval' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from eval' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from eval' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from eval' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from eval' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from eval' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from eval' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from eval' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from eval' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from eval' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l check -d 'Check if the source files are formatted'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l fail-fast -d 'Stop checking files on first format error'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l ignore -d 'Ignore formatting particular source files'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l use-tabs -d 'Use tabs instead of spaces for indentation [default: false]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l line-width -d 'Define maximum line width [default: 80]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l indent-width -d 'Define indentation width [default: 2]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l single-quote -d 'Use single quotes [default: false]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l prose-wrap -d 'Define how prose should be wrapped [default: always]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l no-semicolons -d 'Don\'t use semicolons except where necessary [default: false]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l no-editorconfig -d 'Don\'t read .editorconfig files to infer formatting options [default: false]'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l unstable-component -d 'Enable formatting Svelte, Vue, Astro and Angular files'
complete -c deno -n '__fish_seen_subcommand_from fmt' -l unstable-sql -d 'Enable formatting SQL files.'
complete -c deno -n '__fish_seen_subcommand_from lint' -l rules -d 'List available rules'
complete -c deno -n '__fish_seen_subcommand_from lint' -l fix -d 'Fix any linting errors for rules that support it'
complete -c deno -n '__fish_seen_subcommand_from lint' -l rules-tags -d 'Use set of rules with a tag'
complete -c deno -n '__fish_seen_subcommand_from lint' -l rules-include -d 'Include lint rules'
complete -c deno -n '__fish_seen_subcommand_from lint' -l rules-exclude -d 'Exclude lint rules'
complete -c deno -n '__fish_seen_subcommand_from lint' -l json -d 'Output lint result in JSON format'
complete -c deno -n '__fish_seen_subcommand_from lint' -l compact -d 'Output lint result in compact format'
complete -c deno -n '__fish_seen_subcommand_from lint' -l ignore -d 'Ignore linting particular source files'
complete -c deno -n '__fish_seen_subcommand_from lint' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from lint' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from lint' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from lint' -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n '__fish_seen_subcommand_from lint' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from lint' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from lint' -l ext -d 'Specify the file extension to lint when reading from stdin.For example, use `jsx` to lint JSX files or `tsx` for TSX files.This argument is necessary because stdin input does not automatically infer the file type.Example usage: `cat file.jsx | deno lint - --ext=jsx`.'
complete -c deno -n '__fish_seen_subcommand_from lint' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from lint' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from test' -l doc -d 'Evaluate code blocks in JSDoc and Markdown'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-run -d 'Cache test modules, but don\'t run tests'
complete -c deno -n '__fish_seen_subcommand_from test' -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.
  This option can also be set via the DENO_COVERAGE_DIR environment variable.'
complete -c deno -n '__fish_seen_subcommand_from test' -l clean -d 'Empty the temporary coverage profile data directory before running tests.
  Note: running multiple `deno test --clean` calls in series or parallel for the same coverage directory may cause race conditions.'
complete -c deno -n '__fish_seen_subcommand_from test' -l fail-fast -d 'Stop after N errors. Defaults to stopping after first failure'
complete -c deno -n '__fish_seen_subcommand_from test' -l filter -d 'Run tests with this string or regexp pattern in the test name'
complete -c deno -n '__fish_seen_subcommand_from test' -l shuffle -d 'Shuffle the order in which the tests are run'
complete -c deno -n '__fish_seen_subcommand_from test' -l parallel -d 'Run test modules in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable'
complete -c deno -n '__fish_seen_subcommand_from test' -l sanitize-ops -d 'Enable the ops sanitizer, which ensures that all async ops started in a test are completed before the test ends'
complete -c deno -n '__fish_seen_subcommand_from test' -l sanitize-resources -d 'Enable the resources sanitizer, which ensures that all resources opened in a test are closed before the test ends'
complete -c deno -n '__fish_seen_subcommand_from test' -l coverage-threshold -d 'Fail if coverage is below this percentage (0-100). Requires --coverage'
complete -c deno -n '__fish_seen_subcommand_from test' -l update-snapshots -d 'Update snapshots created with `t.assertSnapshot()` instead of failing when they do not match'
complete -c deno -n '__fish_seen_subcommand_from test' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from test' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from test' -l reporter -d 'Select reporter to use. Default to \'pretty\''
complete -c deno -n '__fish_seen_subcommand_from test' -l junit-path -d 'Write a JUnit XML test report to PATH. Use \'-\' to write to stdout which is the default when PATH is not provided'
complete -c deno -n '__fish_seen_subcommand_from test' -l hide-stacktraces -d 'Hide stack traces for errors in failure test results.'
complete -c deno -n '__fish_seen_subcommand_from test' -l retry -d 'Re-run failing tests up to NUMBER times. A test passes if any attempt passes. Tests that set their own `retry` option take precedence'
complete -c deno -n '__fish_seen_subcommand_from test' -l repeats -d 'Run each test NUMBER additional times. Every repetition must pass. Tests that set their own `repeats` option take precedence'
complete -c deno -n '__fish_seen_subcommand_from test' -l shard -d 'Run only the test files for shard INDEX of COUNT, e.g. --shard=2/3.
  The discovered test files are sorted and split into COUNT consecutive groups; INDEX is 1-based. Useful for splitting a run across machines.'
complete -c deno -n '__fish_seen_subcommand_from test' -l changed -d 'Run only test modules affected by files changed in git.
  With no value, uses uncommitted changes (staged, unstaged and untracked).
  Pass a git ref to compare against, e.g. --changed=main or --changed=HEAD~1.'
complete -c deno -n '__fish_seen_subcommand_from test' -l related -d 'Run only test modules that depend on the given source files'
complete -c deno -n '__fish_seen_subcommand_from test' -l coverage-raw-data-only -d 'Only collect raw coverage data, without generating a report'
complete -c deno -n '__fish_seen_subcommand_from test' -l ignore -d 'Ignore files'
complete -c deno -n '__fish_seen_subcommand_from test' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from test' -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n '__fish_seen_subcommand_from test' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from test' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from test' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from test' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from test' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from test' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from test' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from test' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from test' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from test' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from test' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from test' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from test' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from test' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from test' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from test' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from test' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from test' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from test' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from test' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from test' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from test' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from test' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from test' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from test' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from test' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l dry-run -d 'Perform all checks without replacing old exe'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l force -d 'Replace current exe even if not out-of-date'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l canary -d 'Upgrade to canary builds'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l release-candidate -d 'Upgrade to a release candidate'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l version -d 'The version to upgrade to'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l output -d 'The path to output the updated version to'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l pr -d ''
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l checksum -d 'Verify the downloaded archive against the provided SHA256 checksum'
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l branch -d ''
complete -c deno -n '__fish_seen_subcommand_from upgrade' -l no-delta -d 'Disable delta updates and always download the full archive'
complete -c deno -n '__fish_seen_subcommand_from cache' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l ext -d ''
complete -c deno -n '__fish_seen_subcommand_from cache' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from cache' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from cache' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from cache' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from cache' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from cache' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from cache' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from cache' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from cache' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from cache' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from cache' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from cache' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from cache' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from cache' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from cache' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from cache' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from cache' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from cache' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from cache' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from cache' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from check' -l all -d 'Type-check all code, including remote modules and npm packages'
complete -c deno -n '__fish_seen_subcommand_from check' -l doc -d 'Type-check code blocks in JSDoc as well as actual code'
complete -c deno -n '__fish_seen_subcommand_from check' -l doc-only -d 'Type-check code blocks in JSDoc and Markdown only'
complete -c deno -n '__fish_seen_subcommand_from check' -l desktop -d 'Type-check using the type definitions for `deno desktop`'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from check' -l watch -d 'Watch for file changes and restart process automatically.
  Only local files from entry point module graph are watched.'
complete -c deno -n '__fish_seen_subcommand_from check' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from check' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from check' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from check' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from check' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from check' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from check' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from check' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from check' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from check' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from check' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from check' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from check' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from check' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from check' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from check' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from check' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from check' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from check' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from check' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from check' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from check' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from info' -l json -d 'UNSTABLE: Outputs the information in JSON format'
complete -c deno -n '__fish_seen_subcommand_from info' -l location -d 'Show files used for origin bound APIs like the Web Storage API when running a script with --location=<HREF>'
complete -c deno -n '__fish_seen_subcommand_from info' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from info' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from info' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from info' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from info' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from info' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from info' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from info' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from info' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from info' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from info' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from info' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from info' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from info' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from info' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from info' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from info' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from info' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from doc' -l json -d 'Output documentation in JSON format'
complete -c deno -n '__fish_seen_subcommand_from doc' -l private -d 'Output private documentation'
complete -c deno -n '__fish_seen_subcommand_from doc' -l lint -d 'Output documentation diagnostics.'
complete -c deno -n '__fish_seen_subcommand_from doc' -l html -d 'Output documentation in HTML format'
complete -c deno -n '__fish_seen_subcommand_from doc' -l name -d 'The name that will be used in the docs (ie for breadcrumbs)'
complete -c deno -n '__fish_seen_subcommand_from doc' -l output -d 'Directory for HTML documentation output'
complete -c deno -n '__fish_seen_subcommand_from doc' -l category-docs -d 'Path to a JSON file keyed by category and an optional value of a markdown doc'
complete -c deno -n '__fish_seen_subcommand_from doc' -l symbol-redirect-map -d 'Path to a JSON file keyed by file, with an inner map of symbol to an external link'
complete -c deno -n '__fish_seen_subcommand_from doc' -l default-symbol-map -d 'Uses the provided mapping of default name to wanted name for usage blocks'
complete -c deno -n '__fish_seen_subcommand_from doc' -l strip-trailing-html -d 'Remove trailing .html from various links. Will still generate files with a .html extension'
complete -c deno -n '__fish_seen_subcommand_from doc' -l filter -d 'Dot separated path to symbol'
complete -c deno -n '__fish_seen_subcommand_from doc' -l builtin -d ''
complete -c deno -n '__fish_seen_subcommand_from doc' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from doc' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from doc' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from doc' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from doc' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from doc' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from doc' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from doc' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from doc' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from doc' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from doc' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from doc' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from doc' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from doc' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from doc' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from doc' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from doc' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from doc' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from task' -l cwd -d 'Specify the directory to run the task in'
complete -c deno -n '__fish_seen_subcommand_from task' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from task' -l recursive -d 'Run the task in all projects in the workspace'
complete -c deno -n '__fish_seen_subcommand_from task' -l members -d 'Run the task in all workspace members, but not in the workspace root'
complete -c deno -n '__fish_seen_subcommand_from task' -l filter -d 'Filter members of the workspace by name, implies --recursive flag'
complete -c deno -n '__fish_seen_subcommand_from task' -l eval -d 'Evaluate the passed value as if it was a task in a configuration file'
complete -c deno -n '__fish_seen_subcommand_from task' -l if-present -d 'Exit with code 0 instead of an error when the task is not found'
complete -c deno -n '__fish_seen_subcommand_from task' -l no-prefix -d 'Disable prefixing the output of concurrently-executing tasks with the task name'
complete -c deno -n '__fish_seen_subcommand_from task' -l jobs -d 'Maximum number of tasks to run concurrently.
Overrides the DENO_JOBS environment variable; defaults to the number of
available CPUs. Use 1 to force sequential execution. Only affects runs
where multiple tasks can run concurrently (workspace runs, or a task with
parallelizable dependencies)'
complete -c deno -n '__fish_seen_subcommand_from task' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from task' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from task' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from task' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from task' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from bench' -l filter -d 'Run benchmarks with this string or regexp pattern in the bench name'
complete -c deno -n '__fish_seen_subcommand_from bench' -l json -d 'UNSTABLE: Output benchmark result in JSON format'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-run -d 'Cache bench modules, but don\'t run benchmarks'
complete -c deno -n '__fish_seen_subcommand_from bench' -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n '__fish_seen_subcommand_from bench' -l watch -d 'Watch for file changes and restart process automatically.
  Local files from entry point module graph are watched by default.
  Additional paths might be watched by passing them as arguments to this flag.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from bench' -l ignore -d 'Ignore files'
complete -c deno -n '__fish_seen_subcommand_from bench' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from bench' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from bench' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from bench' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from bench' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from bench' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from bench' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from bench' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from bench' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from bench' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from bench' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from bench' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from bench' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from bench' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from bench' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from bench' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from bench' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from bench' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from bench' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from bench' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from bench' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from bench' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from compile' -l output -d 'Output file (defaults to $PWD/<inferred-name>)'
complete -c deno -n '__fish_seen_subcommand_from compile' -l target -d 'Target OS architecture'
complete -c deno -n '__fish_seen_subcommand_from compile' -l engine -d 'JS engine the compiled binary runs on (quickjs is smaller and experimental, and does not receive the same security updates as v8)'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-terminal -d 'Hide terminal on Windows'
complete -c deno -n '__fish_seen_subcommand_from compile' -l icon -d 'Set the icon of the executable on Windows (.ico)'
complete -c deno -n '__fish_seen_subcommand_from compile' -l include -d 'Includes an additional module or file/directory in the compiled executable.
  Use this flag if a dynamically imported module or a web worker main module
  fails to load in the executable or to embed a file or directory in the executable.
  This flag can be passed multiple times, to include multiple additional modules.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l exclude -d 'Excludes a file/directory in the compiled executable.
  Use this flag to exclude a specific file or directory within the included files.
  For example, to exclude a certain folder in the bundled node_modules directory.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from compile' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from compile' -l self-extracting -d 'Create a self-extracting binary that extracts the embedded file system to disk on first run and then runs from there'
complete -c deno -n '__fish_seen_subcommand_from compile' -l bundle -d 'Experimental. Bundle the entrypoint with esbuild before embedding, instead of shipping the whole node_modules tree.
  Produces a smaller binary with faster startup, at the cost of dropping dynamic require/import patterns that can\'t be statically traced.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l minify -d 'Experimental. Minify the bundled output. Only meaningful with --bundle.
  Reduces both the embedded bundle size and runtime memory use, at the cost of less readable stack traces.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l app-name -d 'Stable identity for the compiled app.
  Determines where origin-bound storage such as the default `Deno.openKv()`,
  `localStorage` and `caches` is persisted (under the platform\'s app data directory).
  Defaults to the output file name. Set this to keep storage stable across renames.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l exclude-unused-npm -d 'Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).
  Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.
  Reduces binary size when the lockfile contains packages the entrypoint does not import.
  Skips packages that are only reached through non-statically-analyzable dynamic imports;
  pass those with --include npm:<pkg> if needed.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l watch -d 'Watch for file changes and restart process automatically.
  Only local files from entry point module graph are watched.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l watch-exclude -d 'Exclude provided files/patterns from watch mode'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from compile' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from compile' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from compile' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from compile' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from compile' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from compile' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from compile' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from compile' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from compile' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from compile' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from compile' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from compile' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from compile' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from compile' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from compile' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from compile' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from compile' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from compile' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from compile' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from compile' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from compile' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l ignore -d 'Ignore coverage files'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l include -d 'Include source files in the report'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l exclude -d 'Exclude source files from the report'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l lcov -d 'Output coverage report in lcov format'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l html -d 'Output coverage report in HTML format in the given directory'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l detailed -d 'Output coverage report in detailed format in the terminal'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l threshold -d 'Fail if coverage is below this percentage (0-100), applied to line, branch, and function coverage.
  Per-metric thresholds can be set in deno.json under "coverage": { "thresholds": { ... } }. The flag takes precedence.'
complete -c deno -n '__fish_seen_subcommand_from coverage' -l output -d 'Exports the coverage report in lcov format to the given file.
  If no --output arg is specified then the report is written to stdout.'
complete -c deno -n '__fish_seen_subcommand_from repl' -l eval -d 'Evaluates the provided code when the REPL starts'
complete -c deno -n '__fish_seen_subcommand_from repl' -l eval-file -d 'Evaluates the provided file(s) as scripts when the REPL starts. Accepts file paths and URLs'
complete -c deno -n '__fish_seen_subcommand_from repl' -l json -d ''
complete -c deno -n '__fish_seen_subcommand_from repl' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from repl' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from repl' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from repl' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from repl' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from repl' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from repl' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from repl' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from repl' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from repl' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from repl' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from repl' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from repl' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from repl' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from repl' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from repl' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from repl' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from repl' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from repl' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from repl' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from repl' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from repl' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from repl' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from repl' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from repl' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from repl' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from repl' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from repl' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from install' -l global -d 'Install a package or script as a globally available executable'
complete -c deno -n '__fish_seen_subcommand_from install' -l name -d 'Executable file name'
complete -c deno -n '__fish_seen_subcommand_from install' -l root -d 'Installation root'
complete -c deno -n '__fish_seen_subcommand_from install' -l force -d 'Forcefully overwrite existing installation'
complete -c deno -n '__fish_seen_subcommand_from install' -l dev -d 'Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n '__fish_seen_subcommand_from install' -l save-optional -d 'Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-save -d 'Install the package(s) without adding them to the configuration file.'
complete -c deno -n '__fish_seen_subcommand_from install' -l prod -d 'Only install production dependencies (excludes devDependencies)'
complete -c deno -n '__fish_seen_subcommand_from install' -l skip-types -d 'Exclude @types/* packages from installation.
Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.'
complete -c deno -n '__fish_seen_subcommand_from install' -l entrypoint -d 'Install dependents of the specified entrypoint(s)'
complete -c deno -n '__fish_seen_subcommand_from install' -l compile -d 'Install the script as a compiled executable'
complete -c deno -n '__fish_seen_subcommand_from install' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from install' -l npm -d 'assume unprefixed package names are npm packages (default)'
complete -c deno -n '__fish_seen_subcommand_from install' -l jsr -d 'assume unprefixed package names are jsr packages'
complete -c deno -n '__fish_seen_subcommand_from install' -l save-exact -d 'Save exact version without the caret (^)'
complete -c deno -n '__fish_seen_subcommand_from install' -l unscoped -d 'Use the package name without its scope as the alias (ex. `jsr:@david/jsonc-morph` is added as `jsonc-morph`). Packages given an explicit alias are unaffected.'
complete -c deno -n '__fish_seen_subcommand_from install' -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n '__fish_seen_subcommand_from install' -l os -d 'Target OS for npm package installation (e.g., linux, darwin, win32)'
complete -c deno -n '__fish_seen_subcommand_from install' -l arch -d 'Target architecture for npm package installation (e.g., x64, arm64)'
complete -c deno -n '__fish_seen_subcommand_from install' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from install' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from install' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from install' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from install' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from install' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from install' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from install' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from install' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from install' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from install' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from install' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from install' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from install' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from install' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from install' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from install' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from install' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from install' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from install' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from install' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from install' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from install' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from install' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from install' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from install' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l global -d 'Remove globally installed packages or modules'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l root -d 'Installation root'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from uninstall' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from completions' -l dynamic -d 'Generate dynamic completions for the given shell (unstable), currently this only provides available tasks for `deno task`.'
complete -c deno -n '__fish_seen_subcommand_from init' -l lib -d 'Generate an example library project'
complete -c deno -n '__fish_seen_subcommand_from init' -l serve -d 'Generate an example project for `deno serve`'
complete -c deno -n '__fish_seen_subcommand_from init' -l npm -d 'Generate a npm create-* project'
complete -c deno -n '__fish_seen_subcommand_from init' -l jsr -d 'Generate a project from a JSR package'
complete -c deno -n '__fish_seen_subcommand_from init' -l empty -d 'Generate a minimal project with just main.ts and deno.json'
complete -c deno -n '__fish_seen_subcommand_from init' -l yes -d 'Bypass the prompt and run with full permissions'
complete -c deno -n '__fish_seen_subcommand_from create' -l npm -d 'Treat unprefixed package names as npm packages'
complete -c deno -n '__fish_seen_subcommand_from create' -l jsr -d 'Treat unprefixed package names as JSR packages'
complete -c deno -n '__fish_seen_subcommand_from create' -l yes -d 'Bypass the prompt and run with full permissions'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l install -d 'Install a kernelspec'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l name -d 'Set a name for the kernel (defaults to \'deno\'). Useful when maintaing multiple Deno kernels.'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l display -d 'Set a display name for the kernel (defaults to \'Deno\'). Useful when maintaing multiple Deno kernels.'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l kernel -d 'Start the kernel'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l conn -d 'Path to JSON file describing connection parameters, provided by Jupyter'
complete -c deno -n '__fish_seen_subcommand_from jupyter' -l force -d 'Force installation of a kernel, overwriting previously existing kernelspec'
complete -c deno -n '__fish_seen_subcommand_from publish' -l token -d 'The API token to use when publishing. If unset, interactive authentication is be used'
complete -c deno -n '__fish_seen_subcommand_from publish' -l dry-run -d 'Prepare the package for publishing performing all checks and validations without uploading'
complete -c deno -n '__fish_seen_subcommand_from publish' -l allow-slow-types -d 'Allow publishing with slow types'
complete -c deno -n '__fish_seen_subcommand_from publish' -l allow-dirty -d 'Allow publishing if the repository has uncommitted changed'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-provenance -d 'Disable provenance attestation.
  Enabled by default on Github actions, publicly links the package to where it was built and published from.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l set-version -d 'Set version for a package to be published.
  This flag can be used while publishing individual packages and cannot be used in a workspace.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from publish' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from publish' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from publish' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from publish' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from publish' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from publish' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from publish' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from publish' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from publish' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from publish' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from publish' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from add' -l dev -d 'Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n '__fish_seen_subcommand_from add' -l save-optional -d 'Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-save -d 'Install the package(s) without adding them to the configuration file.'
complete -c deno -n '__fish_seen_subcommand_from add' -l save-exact -d 'Save exact version without the caret (^)'
complete -c deno -n '__fish_seen_subcommand_from add' -l unscoped -d 'Use the package name without its scope as the alias (ex. `jsr:@david/jsonc-morph` is added as `jsonc-morph`). Packages given an explicit alias are unaffected.'
complete -c deno -n '__fish_seen_subcommand_from add' -l npm -d 'assume unprefixed package names are npm packages (default)'
complete -c deno -n '__fish_seen_subcommand_from add' -l jsr -d 'assume unprefixed package names are jsr packages'
complete -c deno -n '__fish_seen_subcommand_from add' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from add' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from add' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from add' -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n '__fish_seen_subcommand_from add' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from add' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from add' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from add' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from add' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from add' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from add' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from add' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from add' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from add' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from add' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from add' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from add' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from add' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from remove' -l global -d 'Remove globally installed package or module'
complete -c deno -n '__fish_seen_subcommand_from remove' -l root -d 'Installation root'
complete -c deno -n '__fish_seen_subcommand_from remove' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from remove' -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n '__fish_seen_subcommand_from remove' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from remove' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from remove' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from remove' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from remove' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from remove' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from remove' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from remove' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from remove' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from remove' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from remove' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from remove' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from remove' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from remove' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from remove' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from remove' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l recursive -d 'Include all workspace members'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l compatible -d 'Only consider versions that satisfy semver requirements'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l update -d 'Update dependency versions'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l latest -d 'Consider the latest version, regardless of semver constraints'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l interactive -d 'Interactively select which dependencies to update'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from outdated' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from update' -l recursive -d 'Include all workspace members'
complete -c deno -n '__fish_seen_subcommand_from update' -l latest -d 'Consider the latest version, regardless of semver constraints'
complete -c deno -n '__fish_seen_subcommand_from update' -l compatible -d 'Only consider versions that satisfy semver requirements'
complete -c deno -n '__fish_seen_subcommand_from update' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from update' -l interactive -d 'Interactively select which dependencies to update'
complete -c deno -n '__fish_seen_subcommand_from update' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from update' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from update' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from update' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from update' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from update' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from update' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from update' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from update' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from update' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from update' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from update' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from update' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from update' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from update' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from update' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from update' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from clean' -l except -d 'Retain cache data needed by the given files'
complete -c deno -n '__fish_seen_subcommand_from clean' -l dry-run -d 'Show what would be removed without performing any actions'
complete -c deno -n '__fish_seen_subcommand_from clean' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from clean' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from clean' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from list' -l depth -d 'Maximum depth of the dependency tree to display (0 = direct dependencies only)'
complete -c deno -n '__fish_seen_subcommand_from list' -l prod -d 'Only list production dependencies'
complete -c deno -n '__fish_seen_subcommand_from list' -l dev -d 'Only list development dependencies'
complete -c deno -n '__fish_seen_subcommand_from list' -l recursive -d 'Include all workspace members'
complete -c deno -n '__fish_seen_subcommand_from link' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from link' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from link' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from link' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from unlink' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from unlink' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from unlink' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from unlink' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from approve-scripts' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from vendor' -l help -d '[possible values: unstable, full]'
complete -c deno -n '__fish_seen_subcommand_from vendor' -l quiet -d 'Suppress diagnostic output'
complete -c deno -n '__fish_seen_subcommand_from vendor' -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead
  To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l output -d 'Output path`'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l outdir -d 'Output directory for bundled files'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l format -d ''
complete -c deno -n '__fish_seen_subcommand_from bundle' -l packages -d 'How to handle packages. Accepted values are \'bundle\' or \'external\''
complete -c deno -n '__fish_seen_subcommand_from bundle' -l platform -d 'Platform to bundle for. Accepted values are \'browser\' or \'deno\''
complete -c deno -n '__fish_seen_subcommand_from bundle' -l sourcemap -d 'Generate source map. Accepted values are \'linked\', \'inline\', or \'external\''
complete -c deno -n '__fish_seen_subcommand_from bundle' -l external -d ''
complete -c deno -n '__fish_seen_subcommand_from bundle' -l watch -d 'Watch and rebuild on changes'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l minify -d 'Minify the output'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l keep-names -d 'Keep function and class names'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l code-splitting -d 'Enable code splitting'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l inline-imports -d 'Whether to inline imported modules into the importing file [default: true]'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l declaration -d 'Generate .d.ts declaration files alongside the bundle'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.'
complete -c deno -n '__fish_seen_subcommand_from bundle' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from audit' -l level -d 'Only show advisories with severity greater or equal to the one specified'
complete -c deno -n '__fish_seen_subcommand_from audit' -l ignore-unfixable -d 'Ignore advisories that don\'t have any actions to resolve them'
complete -c deno -n '__fish_seen_subcommand_from audit' -l ignore-registry-errors -d 'Return exit code 0 if remote service(s) responds with an error.'
complete -c deno -n '__fish_seen_subcommand_from audit' -l socket -d 'Check against socket.dev vulnerability database'
complete -c deno -n '__fish_seen_subcommand_from audit' -l fix -d 'Automatically fix vulnerabilities by upgrading packages'
complete -c deno -n '__fish_seen_subcommand_from audit' -l ignore -d 'Ignore advisories matching the given CVE IDs'
complete -c deno -n '__fish_seen_subcommand_from audit' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from audit' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from audit' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from why' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from why' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from why' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from why' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l output -d 'Output file path (for single file transpilation)'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l outdir -d 'Output directory for transpiled files'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l source-map -d 'Source map mode: none, inline, or separate'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l declaration -d 'Generate .d.ts declaration files (requires type-checking via tsc)'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from transpile' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l workspace -d 'Bump every package in the workspace (auto-detected at the workspace root)'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l no-workspace -d 'Disable workspace mode and only bump the deno.json/package.json in the current directory'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l dry-run -d 'Print the planned changes without writing any files'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l start -d '[conventional-commits mode] Git ref to start from. Default: latest tag (git describe --tags --abbrev=0)'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l base -d '[conventional-commits mode] Git ref to compare against. Default: current branch'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l import-map -d 'Path to the import map to rewrite jsr: version constraints in. Defaults to the root deno.json (or its importMap target)'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l release-notes -d '[conventional-commits mode] Path to the release notes file to prepend. Default: Releases.md'
complete -c deno -n '__fish_seen_subcommand_from bump-version' -l config -d 'Explicit path to the manifest file to bump.
  May point to a `deno.json`/`deno.jsonc` or a `package.json`. When
  set, single-file mode is forced (workspace auto-detection is bypassed).
  Useful when both `deno.json` and `package.json` exist in the same
  directory.'
complete -c deno -n '__fish_seen_subcommand_from ci' -l prod -d 'Only install production dependencies (excludes devDependencies)'
complete -c deno -n '__fish_seen_subcommand_from ci' -l skip-types -d 'Exclude @types/* packages from installation.
Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.'
complete -c deno -n '__fish_seen_subcommand_from ci' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l inspect-renderer -d 'Override the CEF renderer debugger listen address; defaults to an auto-allocated port'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l include -d 'Includes an additional module or file/directory in the compiled executable.
  Use this flag if a dynamically imported module or a web worker main module
  fails to load in the executable or to embed a file or directory in the executable.
  This flag can be passed multiple times, to include multiple additional modules.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l exclude -d 'Excludes a file/directory in the compiled executable.
  Use this flag to exclude a specific file or directory within the included files.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l exclude-unused-npm -d 'Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).
  Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.
  Reduces binary size when the lockfile contains packages the entrypoint does not import.
  Skips packages that are only reached through non-statically-analyzable dynamic imports;
  pass those with --include npm:<pkg> if needed.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l output -d 'Output path (e.g. MyApp.app, MyApp.dmg, MyApp.AppImage, MyApp.deb, MyApp.rpm, MyApp.msi)'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l target -d 'Target OS architecture'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l icon -d 'Set the application icon (.ico on Windows, .icns or .png on macOS)'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l hmr -d 'Run the desktop app with Hot Module Replacement enabled'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l backend -d 'Backend to use for the desktop app'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l engine -d 'JS engine the desktop binary runs on (quickjs is smaller and experimental, and does not receive the same security updates as v8)'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l all-targets -d 'Build for all supported target platforms'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l compress -d 'Make the packaged app self-extracting: the payload is compressed inside the app and unpacked on first launch. Off by default. Defaults to xz (decompressed by the system `tar` everywhere); zstd is smaller/faster but needs the `zstd` tool at runtime.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l ext -d 'Set content type of the supplied file'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l inspect-publish-uid -d ''
complete -c deno -n '__fish_seen_subcommand_from desktop' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from desktop' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from pack' -l output -d 'Output file path (defaults to <name>-<version>.tgz)'
complete -c deno -n '__fish_seen_subcommand_from pack' -l dry-run -d 'Show what would be packed without creating the tarball'
complete -c deno -n '__fish_seen_subcommand_from pack' -l allow-slow-types -d 'Skip fast-check type extraction; .d.ts files are omitted from the output'
complete -c deno -n '__fish_seen_subcommand_from pack' -l allow-dirty -d 'Allow packing if the repository has uncommitted changes'
complete -c deno -n '__fish_seen_subcommand_from pack' -l set-version -d 'Override the version in the tarball'
complete -c deno -n '__fish_seen_subcommand_from pack' -l no-source-maps -d 'Don\'t include source maps in the output'
complete -c deno -n '__fish_seen_subcommand_from pack' -l ignore -d 'Ignore files matching these patterns'
complete -c deno -n '__fish_seen_subcommand_from pack' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from pack' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from pack' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from x' -l yes -d 'Assume confirmation for all prompts'
complete -c deno -n '__fish_seen_subcommand_from x' -l package -d 'Package to install (use when the binary name differs from the package name)'
complete -c deno -n '__fish_seen_subcommand_from x' -l ignore-scripts -d 'Do not run npm lifecycle scripts for the given packages'
complete -c deno -n '__fish_seen_subcommand_from x' -l install-alias -d 'Creates a dx alias so you can run dx <command> instead of deno x <command>'
complete -c deno -n '__fish_seen_subcommand_from x' -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.'
complete -c deno -n '__fish_seen_subcommand_from x' -l env-file -d 'Load environment variables from local file
  Only the first environment variable with a given key is used.
  Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.
  Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.'
complete -c deno -n '__fish_seen_subcommand_from x' -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages
  Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)'
complete -c deno -n '__fish_seen_subcommand_from x' -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored'
complete -c deno -n '__fish_seen_subcommand_from x' -l import-map -d 'Load import map file from local file or remote URL
  Docs: https://docs.deno.com/runtime/manual/basics/import_maps'
complete -c deno -n '__fish_seen_subcommand_from x' -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n '__fish_seen_subcommand_from x' -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n '__fish_seen_subcommand_from x' -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.'
complete -c deno -n '__fish_seen_subcommand_from x' -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages'
complete -c deno -n '__fish_seen_subcommand_from x' -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)'
complete -c deno -n '__fish_seen_subcommand_from x' -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.
  Typically the configuration file will be called `deno.json` or `deno.jsonc` and
  automatically detected; in that case this flag is not necessary.
  Docs: https://docs.deno.com/go/config'
complete -c deno -n '__fish_seen_subcommand_from x' -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n '__fish_seen_subcommand_from x' -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.'
complete -c deno -n '__fish_seen_subcommand_from x' -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")'
complete -c deno -n '__fish_seen_subcommand_from x' -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n '__fish_seen_subcommand_from x' -l frozen-lockfile -d 'Error out if lockfile is out of date'
complete -c deno -n '__fish_seen_subcommand_from x' -l cert -d 'Load certificate authority from PEM encoded file'
complete -c deno -n '__fish_seen_subcommand_from x' -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates'
complete -c deno -n '__fish_seen_subcommand_from x' -l min-dep-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)'
complete -c deno -n '__fish_seen_subcommand_from x' -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n '__fish_seen_subcommand_from x' -l location -d 'Value of globalThis.location used by some web APIs'
complete -c deno -n '__fish_seen_subcommand_from x' -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help
  Flags can also be set via the DENO_V8_FLAGS environment variable.
  Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable'
complete -c deno -n '__fish_seen_subcommand_from x' -l seed -d 'Set the random number generator seed'
complete -c deno -n '__fish_seen_subcommand_from x' -l preload -d 'A list of files that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from x' -l require -d 'A list of CommonJS modules that will be executed before the main module'
complete -c deno -n '__fish_seen_subcommand_from x' -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.

Docs: https://docs.deno.com/go/conditional-exports'
complete -c deno -n '__fish_seen_subcommand_from x' -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.'
complete -c deno -n '__fish_seen_subcommand_from x' -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script'
complete -c deno -n '__fish_seen_subcommand_from x' -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code'
complete -c deno -n '__fish_seen_subcommand_from x' -l inspect-publish-uid -d ''
