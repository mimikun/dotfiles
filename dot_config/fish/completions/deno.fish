# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_deno_global_optspecs
	string join \n no-check= import-map= no-remote no-npm node-modules-dir= node-modules-linker= vendor= conditions= c/config= no-config r/reload= lock= no-lock frozen= cert= unsafely-ignore-certificate-errors= minimum-dependency-age= A/allow-all P/permission-set= R/allow-read= deny-read= ignore-read= W/allow-write= deny-write= N/allow-net= deny-net= E/allow-env= deny-env= ignore-env= S/allow-sys= deny-sys= allow-run= deny-run= allow-ffi= deny-ffi= allow-hrtime deny-hrtime no-prompt I/allow-import= deny-import= inspect= inspect-brk= inspect-wait= inspect-publish-uid= allow-scripts= cached-only location= v8-flags= seed= enable-testing-features-do-not-use trace-ops= eszip-internal-do-not-use preload= require= check= watch= watch-hmr= watch-exclude= no-clear-screen ext= env-file= no-code-cache coverage= cpu-prof cpu-prof-dir= cpu-prof-name= cpu-prof-interval= cpu-prof-md cpu-prof-flamegraph t/tunnel= use-env-proxy no-use-env-proxy unstable unstable-bare-node-builtins unstable-broadcast-channel unstable-bundle unstable-byonm unstable-cron unstable-detect-cjs unstable-ffi unstable-fs unstable-http unstable-kv unstable-lazy-dynamic-imports unstable-lockfile-v5 unstable-net unstable-no-legacy-abort unstable-node-globals unstable-npm-lazy-caching unstable-otel unstable-process unstable-raw-imports unstable-sloppy-imports unstable-subdomain-wildcards unstable-temporal unstable-tsgo unstable-unsafe-proto unstable-vsock unstable-webgpu unstable-worker-options h/help= V/version L/log-level= q/quiet
end

function __fish_deno_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_deno_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_deno_using_subcommand
	set -l cmd (__fish_deno_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c deno -n "__fish_deno_needs_command" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_needs_command" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_needs_command" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_needs_command" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_needs_command" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_needs_command" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_needs_command" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_needs_command" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_needs_command" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_needs_command" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_needs_command" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_needs_command" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_needs_command" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_needs_command" -s P -l permission-set -r
complete -c deno -n "__fish_deno_needs_command" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_needs_command" -l deny-read -r -F
complete -c deno -n "__fish_deno_needs_command" -l ignore-read -r -F
complete -c deno -n "__fish_deno_needs_command" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_needs_command" -l deny-write -r -F
complete -c deno -n "__fish_deno_needs_command" -s N -l allow-net -r
complete -c deno -n "__fish_deno_needs_command" -l deny-net -r
complete -c deno -n "__fish_deno_needs_command" -s E -l allow-env -r
complete -c deno -n "__fish_deno_needs_command" -l deny-env -r
complete -c deno -n "__fish_deno_needs_command" -l ignore-env -r
complete -c deno -n "__fish_deno_needs_command" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_needs_command" -l deny-sys -r
complete -c deno -n "__fish_deno_needs_command" -l allow-run -r
complete -c deno -n "__fish_deno_needs_command" -l deny-run -r
complete -c deno -n "__fish_deno_needs_command" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_needs_command" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_needs_command" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_needs_command" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_needs_command" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_needs_command" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_needs_command" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_needs_command" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_needs_command" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_needs_command" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_needs_command" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_needs_command" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_needs_command" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_needs_command" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_needs_command" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_needs_command" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_needs_command" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_needs_command" -l watch-hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_needs_command" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_needs_command" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_needs_command" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_needs_command" -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.   This option can also be set via the DENO_COVERAGE_DIR environment variable.' -r -F
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof-dir -d 'Directory where the V8 CPU profiles will be written. Implicitly enables --cpu-prof' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof-name -d 'Filename for the CPU profile (defaults to CPU.<timestamp>.<pid>.cpuprofile)' -r
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof-interval -d 'Sampling interval in microseconds for CPU profiling (default: 1000)' -r
complete -c deno -n "__fish_deno_needs_command" -s t -l tunnel -d 'Execute tasks with a tunnel to Deno Deploy.      Create a secure connection between your local machine and Deno Deploy,     providing access to centralised environment variables, logging,     and serving from your local environment to the public internet' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_needs_command" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_needs_command" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_needs_command" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_needs_command" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_needs_command" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_needs_command" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_needs_command" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_needs_command" -l allow-hrtime
complete -c deno -n "__fish_deno_needs_command" -l deny-hrtime
complete -c deno -n "__fish_deno_needs_command" -l no-prompt
complete -c deno -n "__fish_deno_needs_command" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_needs_command" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_needs_command" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_needs_command" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_needs_command" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof -d 'Start the V8 CPU profiler on startup and write the profile to disk on exit. Profiles are written to the current directory by default'
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof-md -d 'Generate a human-readable markdown report alongside the CPU profile'
complete -c deno -n "__fish_deno_needs_command" -l cpu-prof-flamegraph -d 'Generate an SVG flamegraph alongside the CPU profile'
complete -c deno -n "__fish_deno_needs_command" -l use-env-proxy -d 'Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https'
complete -c deno -n "__fish_deno_needs_command" -l no-use-env-proxy
complete -c deno -n "__fish_deno_needs_command" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_needs_command" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_needs_command" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_needs_command" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_needs_command" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_needs_command" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_needs_command" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_needs_command" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_needs_command" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_needs_command" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_needs_command" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_needs_command" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_needs_command" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_needs_command" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_needs_command" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_needs_command" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_needs_command" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_needs_command" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_needs_command" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_needs_command" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_needs_command" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_needs_command" -s V -l version -d 'Print version'
complete -c deno -n "__fish_deno_needs_command" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_needs_command" -a "run" -d 'Run a JavaScript or TypeScript program, or a task or script.  By default all programs are run in sandbox without access to disk, network or ability to spawn subprocesses.   deno run https://docs.deno.com/hello_world.ts  Grant permission to read from disk and listen to network:   deno run --allow-read --allow-net jsr:@std/http/file-server  Grant permission to read allow-listed files from disk:   deno run --allow-read=/etc jsr:@std/http/file-server  Grant all permissions:   deno run -A jsr:@std/http/file-server  Specifying the filename \'-\' to read the file from stdin.   curl https://docs.deno.com/hello_world.ts | deno run -  Read more: https://docs.deno.com/go/run'
complete -c deno -n "__fish_deno_needs_command" -a "watch" -d 'Run a JavaScript or TypeScript program, watching for file changes and hot-replacing modules.  This is an alias for deno run --watch-hmr. The process restarts if hot replacement fails.   deno watch main.ts  Local files from the entry point module graph are watched by default. Additional paths can be passed with --watch-hmr:   deno watch --watch-hmr=./templates main.ts  Read more: https://docs.deno.com/go/run'
complete -c deno -n "__fish_deno_needs_command" -a "serve" -d 'Run a server defined in a main module  The serve command uses the default exports of the main module to determine which servers to start.  Start a server defined in server.ts:   deno serve server.ts  Start a server defined in server.ts, watching for changes and running on port 5050:   deno serve --watch --port 5050 server.ts  Read more: https://docs.deno.com/go/serve'
complete -c deno -n "__fish_deno_needs_command" -a "add" -d 'Add dependencies to your configuration file.   deno add express  Unprefixed packages default to npm. Use jsr: prefix for jsr packages:   deno add jsr:@std/path  Or multiple dependencies at once:   deno add express jsr:@std/path'
complete -c deno -n "__fish_deno_needs_command" -a "audit" -d 'Audit currently installed dependencies.   deno audit  Show only high and critical severity vulnerabilities   deno audit --level=high  Check against socket.dev vulnerability database   deno audit --socket  Don\'t error if the audit data can\'t be retrieved from the registry   deno audit --ignore-registry-errors'
complete -c deno -n "__fish_deno_needs_command" -a "remove" -d 'Remove dependencies from the configuration file.   deno remove @std/path  You can remove multiple dependencies at once:   deno remove @std/path @std/assert  With the --global flag, this is an alias for deno uninstall --global and removes a globally installed executable script:   deno remove --global file_server '
complete -c deno -n "__fish_deno_needs_command" -a "bench" -d 'Run benchmarks using Deno\'s built-in bench tool.  Evaluate the given files, run all benches declared with \'Deno.bench()\' and report results to standard output:   deno bench src/fetch_bench.ts src/signal_bench.ts  If you specify a directory instead of a file, the path is expanded to all contained files matching the glob {*_,*.,}bench.{js,mjs,ts,mts,jsx,tsx}:   deno bench src/  Read more: https://docs.deno.com/go/bench'
complete -c deno -n "__fish_deno_needs_command" -a "bundle" -d 'Output a single JavaScript file with all dependencies.    deno bundle jsr:@std/http/file-server -o file-server.bundle.js  If no output file is given, the output is written to standard output:    deno bundle jsr:@std/http/file-server '
complete -c deno -n "__fish_deno_needs_command" -a "cache" -d 'Cache and compile remote dependencies.  Download and compile a module with all of its static dependencies and save them in the local cache, without running any code:   deno cache jsr:@std/http/file-server  Future runs of this module will trigger no downloads or compilation unless --reload is specified  Read more: https://docs.deno.com/go/cache'
complete -c deno -n "__fish_deno_needs_command" -a "check" -d 'Download and type-check without execution.    deno check jsr:@std/http/file-server  Unless --reload is specified, this command will not re-download already cached dependencies  Read more: https://docs.deno.com/go/check'
complete -c deno -n "__fish_deno_needs_command" -a "clean" -d 'Remove the cache directory ($DENO_DIR)'
complete -c deno -n "__fish_deno_needs_command" -a "compile" -d 'Compiles the given script into a self contained executable.    deno compile --allow-read --allow-net jsr:@std/http/file-server   deno compile --output file_server jsr:@std/http/file-server  Any flags specified which affect runtime behavior will be applied to the resulting binary.  This allows distribution of a Deno application to systems that do not have Deno installed. Under the hood, it bundles a slimmed down version of the Deno runtime along with your JavaScript or TypeScript code.  Cross-compiling to different target architectures is supported using the --target flag. On the first invocation of `deno compile`, Deno will download the relevant binary and cache it in $DENO_DIR.  Read more: https://docs.deno.com/go/compile '
complete -c deno -n "__fish_deno_needs_command" -a "create" -d 'scaffolds a project from a package'
complete -c deno -n "__fish_deno_needs_command" -a "desktop" -d 'Build and run desktop applications.    deno desktop main.tsx   deno desktop --hmr main.tsx   deno desktop --output MyApp.app main.tsx   deno desktop  Compiles the given script into a desktop application using a backend for the UI layer. The entrypoint can be a file, or omitted (or .) to auto-detect a supported framework (Next.js, Astro, etc.) in the current directory.  Read more: https://docs.deno.com/go/desktop '
complete -c deno -n "__fish_deno_needs_command" -a "completions" -d 'Output shell completion script to standard output.    deno completions bash > /usr/local/etc/bash_completion.d/deno.bash   source /usr/local/etc/bash_completion.d/deno.bash'
complete -c deno -n "__fish_deno_needs_command" -a "coverage" -d 'Print coverage reports from coverage profiles.  Collect a coverage profile with deno test:   deno test --coverage=cov_profile  Print a report to stdout:   deno coverage cov_profile  Include urls that start with the file schema and exclude files ending with test.ts and test.js, for an url to match it must match the include pattern and not match the exclude pattern:   deno coverage --include="^file:" --exclude="test\\.(ts|js)" cov_profile  Write a report using the lcov format:   deno coverage --lcov --output=cov.lcov cov_profile/  Generate html reports from lcov:   genhtml -o html_cov cov.lcov  Read more: https://docs.deno.com/go/coverage'
complete -c deno -n "__fish_deno_needs_command" -a "doc" -d 'Show documentation for a module.  Output documentation to standard output:     deno doc ./path/to/module.ts  Output documentation in HTML format:     deno doc --html --name="My library" ./path/to/module.ts  Lint a module for documentation diagnostics:     deno doc --lint ./path/to/module.ts  Target a specific symbol:     deno doc ./path/to/module.ts MyClass.someField  Show documentation for runtime built-ins:     deno doc     deno doc --filter Deno.Listener  Read more: https://docs.deno.com/go/doc'
complete -c deno -n "__fish_deno_needs_command" -a "deploy"
complete -c deno -n "__fish_deno_needs_command" -a "sandbox"
complete -c deno -n "__fish_deno_needs_command" -a "eval" -d 'Evaluate JavaScript from the command line.   deno eval "console.log(\'hello world\')"  To evaluate as TypeScript:   deno eval --ext=ts "const v: string = \'hello\'; console.log(v)"  This command has implicit access to all permissions.  Read more: https://docs.deno.com/go/eval'
complete -c deno -n "__fish_deno_needs_command" -a "fmt" -d 'Auto-format various file types.   deno fmt myfile1.ts myfile2.ts  Supported file types are:   JavaScript, TypeScript, Markdown, JSON(C) and Jupyter Notebooks  Supported file types which are behind corresponding unstable flags (see formatting options):   HTML, CSS, SCSS, LESS, YAML, Svelte, Vue, Astro and Angular  Format stdin and write to stdout:   cat file.ts | deno fmt -  Check if the files are formatted:   deno fmt --check  Ignore formatting code by preceding it with an ignore comment:   // deno-fmt-ignore  Ignore formatting a file by adding an ignore comment at the top of the file:   // deno-fmt-ignore-file  Read more: https://docs.deno.com/go/fmt'
complete -c deno -n "__fish_deno_needs_command" -a "init" -d 'scaffolds a basic Deno project with a script, test, and configuration file'
complete -c deno -n "__fish_deno_needs_command" -a "info" -d 'Show information about a module or the cache directories.  Get information about a module:   deno info jsr:@std/http/file-server  The following information is shown:   local: Local path of the file   type: JavaScript, TypeScript, or JSON   emit: Local path of compiled source code (TypeScript only)   dependencies: Dependency tree of the source file  Read more: https://docs.deno.com/go/info'
complete -c deno -n "__fish_deno_needs_command" -a "list" -d 'List the dependencies declared in deno.json / package.json.  Show declared dependencies and their resolved versions:   deno list  Show the dependency tree two levels deep:   deno list --depth 2  Show only production or only development dependencies:   deno list --prod   deno list --dev  Filter by name (wildcards allowed, negate with a leading \'!\'):   deno list "@std/*"   deno list "react*" "!react-dom"  Include all workspace members:   deno list --recursive  Unlike deno info, which walks the module graph from an entrypoint, this lists the packages a project declares as dependencies, similar to npm ls / pnpm list.'
complete -c deno -n "__fish_deno_needs_command" -a "install" -d 'Installs dependencies either in the local project or globally to a bin directory.  Local installation  Add dependencies to the local project\'s configuration (deno.json / package.json) and installs them in the package cache. If no dependency is specified, installs all dependencies listed in the config file. If the --entrypoint flag is passed, installs the dependencies of the specified entrypoint(s).    deno install   deno install express   deno install jsr:@std/bytes   deno install --entrypoint entry1.ts entry2.ts  Global installation  If the --global flag is set, installs a script as an executable in the installation root\'s bin directory.    deno install --global --allow-net --allow-read jsr:@std/http/file-server   deno install -g https://examples.deno.land/color-logging.ts  To change the executable name, use -n/--name:   deno install -g --allow-net --allow-read -n serve jsr:@std/http/file-server  The executable name is inferred by default:   - Attempt to take the file stem of the URL path. The above example would     become file_server.   - If the file stem is something generic like main, mod, index or cli,     and the path has no parent, take the file name of the parent path. Otherwise     settle with the generic name.   - If the resulting name has an @... suffix, strip it.  To change the installation root, use --root:   deno install -g --allow-net --allow-read --root /usr/local jsr:@std/http/file-server  The installation root is determined, in order of precedence:   - --root option   - DENO_INSTALL_ROOT environment variable   - $HOME/.deno  These must be added to the path manually if required.'
complete -c deno -n "__fish_deno_needs_command" -a "i" -d 'Installs dependencies either in the local project or globally to a bin directory.  Local installation  Add dependencies to the local project\'s configuration (deno.json / package.json) and installs them in the package cache. If no dependency is specified, installs all dependencies listed in the config file. If the --entrypoint flag is passed, installs the dependencies of the specified entrypoint(s).    deno install   deno install express   deno install jsr:@std/bytes   deno install --entrypoint entry1.ts entry2.ts  Global installation  If the --global flag is set, installs a script as an executable in the installation root\'s bin directory.    deno install --global --allow-net --allow-read jsr:@std/http/file-server   deno install -g https://examples.deno.land/color-logging.ts  To change the executable name, use -n/--name:   deno install -g --allow-net --allow-read -n serve jsr:@std/http/file-server  The executable name is inferred by default:   - Attempt to take the file stem of the URL path. The above example would     become file_server.   - If the file stem is something generic like main, mod, index or cli,     and the path has no parent, take the file name of the parent path. Otherwise     settle with the generic name.   - If the resulting name has an @... suffix, strip it.  To change the installation root, use --root:   deno install -g --allow-net --allow-read --root /usr/local jsr:@std/http/file-server  The installation root is determined, in order of precedence:   - --root option   - DENO_INSTALL_ROOT environment variable   - $HOME/.deno  These must be added to the path manually if required.'
complete -c deno -n "__fish_deno_needs_command" -a "ci" -d 'Install dependencies in a clean, reproducible way for CI environments.  Similar to npm ci: requires a deno.lock file, removes any existing node_modules directory, and then installs strictly from the lockfile. Errors if deno.lock is missing or out of date with the config file.    deno ci   deno ci --prod'
complete -c deno -n "__fish_deno_needs_command" -a "json_reference"
complete -c deno -n "__fish_deno_needs_command" -a "jupyter" -d 'Deno kernel for Jupyter notebooks'
complete -c deno -n "__fish_deno_needs_command" -a "approve-scripts" -d 'Approve npm lifecycle scripts for installed dependencies.'
complete -c deno -n "__fish_deno_needs_command" -a "uninstall" -d 'Uninstalls dependencies or an executable script in the installation root\'s bin directory.   deno uninstall @std/dotenv chalk   deno uninstall --global file_server  To change the installation root, use --root flag:   deno uninstall --global --root /usr/local cowsay serve  The installation root is determined, in order of precedence:   - --root option   - DENO_INSTALL_ROOT environment variable   - $HOME/.deno'
complete -c deno -n "__fish_deno_needs_command" -a "outdated" -d 'Find and update outdated dependencies. By default, outdated dependencies are only displayed.  Display outdated dependencies:   deno outdated   deno outdated --compatible  Update dependencies to the latest semver compatible versions:   deno outdated --update Update dependencies to the latest versions, ignoring semver requirements:   deno outdated --update --latest Update dependencies within their existing version ranges, without editing deno.json / package.json (like npm update):   deno outdated --update --lockfile-only  Filters can be used to select which packages to act on. Filters can include wildcards (*) to match multiple packages.   deno outdated --update --latest "@std/*"   deno outdated --update --latest "react*" Note that filters act on their aliases configured in deno.json / package.json, not the actual package names:   Given "foobar": "npm:react@17.0.0" in deno.json or package.json, the filter "foobar" would update npm:react to   the latest version.   deno outdated --update --latest foobar Filters can be combined, and negative filters can be used to exclude results:   deno outdated --update --latest "@std/*" "!@std/fmt*"  Specific version requirements to update to can be specified:   deno outdated --update @std/fmt@^1.0.2 '
complete -c deno -n "__fish_deno_needs_command" -a "link" -d 'Link a local JSR package into the current project for development.    deno link ../my-local-pkg  Each path must be a directory containing a deno.json with a JSR-style "name" field. The path is appended to the "links" array in the nearest deno.json, and modules imported by that package\'s name resolve to the local copy instead of the registry.  To stop using the local copy:   deno unlink ../my-local-pkg   deno unlink @scope/name '
complete -c deno -n "__fish_deno_needs_command" -a "unlink" -d 'Remove a linked local package from the current project.    deno unlink ../my-local-pkg   deno unlink @scope/name  Accepts either a path that matches an existing entry in the "links" array, or the JSR-style name of a linked package. '
complete -c deno -n "__fish_deno_needs_command" -a "lsp" -d 'The \'deno lsp\' subcommand provides a way for code editors and IDEs to interact with Deno using the Language Server Protocol. Usually humans do not use this subcommand directly. For example, \'deno lsp\' can provide IDEs with go-to-definition support and automatic code formatting.  How to connect various editors and IDEs to \'deno lsp\': https://docs.deno.com/go/lsp'
complete -c deno -n "__fish_deno_needs_command" -a "lint" -d 'Lint JavaScript/TypeScript source code.    deno lint   deno lint myfile1.ts myfile2.js  Print result as JSON:   deno lint --json  Read from stdin:   cat file.ts | deno lint -   cat file.ts | deno lint --json -  List available rules:   deno lint --rules  To ignore specific diagnostics, you can write an ignore comment on the preceding line with a rule name (or multiple):   // deno-lint-ignore no-explicit-any   // deno-lint-ignore require-await no-empty  To ignore linting on an entire file, you can add an ignore comment at the top of the file:   // deno-lint-ignore-file  Read more: https://docs.deno.com/go/lint '
complete -c deno -n "__fish_deno_needs_command" -a "publish" -d 'Publish the current working directory\'s package or workspace to JSR'
complete -c deno -n "__fish_deno_needs_command" -a "pack" -d 'Create an npm-compatible tarball from a Deno project'
complete -c deno -n "__fish_deno_needs_command" -a "repl" -d 'Starts a read-eval-print-loop, which lets you interactively build up program state in the global context. It is especially useful for quick prototyping and checking snippets of code.  TypeScript is supported, however it is not type-checked, only transpiled.'
complete -c deno -n "__fish_deno_needs_command" -a "task" -d 'Run a task defined in the configuration file:   deno task build  List all available tasks (from config files in the current and ancestor directories):   deno task  Evaluate a task from string:   deno task --eval "echo $(pwd)"'
complete -c deno -n "__fish_deno_needs_command" -a "test" -d 'Run tests using Deno\'s built-in test runner.  Evaluate the given modules, run all tests declared with Deno.test() and report results to standard output:   deno test src/fetch_test.ts src/signal_test.ts  Directory arguments are expanded to all contained files matching the glob {*_,*.,}test.{js,mjs,ts,mts,jsx,tsx} or **/__tests__/**:  deno test src/  Read more: https://docs.deno.com/go/test'
complete -c deno -n "__fish_deno_needs_command" -a "transpile" -d 'Transpile TypeScript/JSX/TSX files to JavaScript.    deno transpile main.ts  Output to a specific file:   deno transpile main.ts -o main.js  Output to a directory:   deno transpile src/*.ts --outdir dist  With source maps:   deno transpile main.ts --source-map separate  Generate declaration files:   deno transpile main.ts -o out.js --declaration  Note: --declaration always writes .d.ts files to disk (next to the source or in --outdir).'
complete -c deno -n "__fish_deno_needs_command" -a "types" -d 'Print runtime TypeScript declarations.    deno types > lib.deno.d.ts  The declaration file could be saved and used for typing information.'
complete -c deno -n "__fish_deno_needs_command" -a "update" -d 'Update outdated dependencies.  Update dependencies to the latest semver compatible versions:   deno update Update dependencies to the latest versions, ignoring semver requirements:   deno update --latest Update dependencies within their existing version ranges, without editing deno.json / package.json (like npm update):   deno update --lockfile-only  This command is an alias of deno outdated --update  Filters can be used to select which packages to act on. Filters can include wildcards (*) to match multiple packages.   deno update --latest "@std/*"   deno update --latest "react*" Note that filters act on their aliases configured in deno.json / package.json, not the actual package names:   Given "foobar": "npm:react@17.0.0" in deno.json or package.json, the filter "foobar" would update npm:react to   the latest version.   deno update --latest foobar Filters can be combined, and negative filters can be used to exclude results:   deno update --latest "@std/*" "!@std/fmt*"  Specific version requirements to update to can be specified:   deno update @std/fmt@^1.0.2 '
complete -c deno -n "__fish_deno_needs_command" -a "upgrade" -d 'Upgrade deno executable to the given version.  Latest   deno upgrade  Specific version   deno upgrade 1.45.0   deno upgrade 1.46.0-rc.1   deno upgrade 9bc2dd29ad6ba334fd57a20114e367d3c04763d4  Channel   deno upgrade stable   deno upgrade alpha   deno upgrade beta   deno upgrade rc   deno upgrade canary  From a pull request (requires gh CLI)   deno upgrade pr 12345  The version is resolved via https://dl.deno.land and then downloaded from either there or GitHub releases, replacing the current executable.  If you want to not replace the current Deno executable but instead download an update to a different location, use the --output flag:   deno upgrade --output $HOME/my_deno  Read more: https://docs.deno.com/go/upgrade'
complete -c deno -n "__fish_deno_needs_command" -a "bump-version" -d 'Update version in the configuration file.   deno bump-version patch       # 1.4.6 -> 1.4.7   deno bump-version minor       # 1.4.6 -> 1.5.0   deno bump-version major       # 1.4.6 -> 2.0.0   deno bump-version prepatch    # 1.4.6 -> 1.4.7-0   deno bump-version preminor    # 1.4.6 -> 1.5.0-0   deno bump-version premajor    # 1.4.6 -> 2.0.0-0   deno bump-version prerelease  # 1.4.7-0 -> 1.4.7-1  When invoked at a workspace root, the same increment is applied to every member package and jsr: references in the root import map are updated. Without an increment, per-package bumps are derived from conventional commit messages between the latest tag and the current branch and a release note is prepended to Releases.md.'
complete -c deno -n "__fish_deno_needs_command" -a "vendor" -d '`deno vendor` was removed in Deno 2.  See the Deno 1.x to 2.x Migration Guide for migration instructions: https://docs.deno.com/runtime/manual/advanced/migrate_deprecations'
complete -c deno -n "__fish_deno_needs_command" -a "why" -d 'Show why a package is installed, displaying the dependency chain from your project\'s direct dependencies to the specified package.   deno why express  Show why a specific version is installed   deno why express@4.18.2'
complete -c deno -n "__fish_deno_needs_command" -a "x" -d 'Execute a binary from npm or jsr, like npx'
complete -c deno -n "__fish_deno_needs_command" -a "help"
complete -c deno -n "__fish_deno_using_subcommand run" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand run" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand run" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand run" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand run" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand run" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand run" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand run" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand run" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand run" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand run" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l watch-hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.   This option can also be set via the DENO_COVERAGE_DIR environment variable.' -r -F
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof-dir -d 'Directory where the V8 CPU profiles will be written. Implicitly enables --cpu-prof' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof-name -d 'Filename for the CPU profile (defaults to CPU.<timestamp>.<pid>.cpuprofile)' -r
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof-interval -d 'Sampling interval in microseconds for CPU profiling (default: 1000)' -r
complete -c deno -n "__fish_deno_using_subcommand run" -s t -l tunnel -d 'Execute tasks with a tunnel to Deno Deploy.      Create a secure connection between your local machine and Deno Deploy,     providing access to centralised environment variables, logging,     and serving from your local environment to the public internet' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand run" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand run" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand run" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand run" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand run" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand run" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand run" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand run" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof -d 'Start the V8 CPU profiler on startup and write the profile to disk on exit. Profiles are written to the current directory by default'
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof-md -d 'Generate a human-readable markdown report alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand run" -l cpu-prof-flamegraph -d 'Generate an SVG flamegraph alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand run" -l use-env-proxy -d 'Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https'
complete -c deno -n "__fish_deno_using_subcommand run" -l no-use-env-proxy
complete -c deno -n "__fish_deno_using_subcommand run" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand watch" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l watch-hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.   This option can also be set via the DENO_COVERAGE_DIR environment variable.' -r -F
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof-dir -d 'Directory where the V8 CPU profiles will be written. Implicitly enables --cpu-prof' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof-name -d 'Filename for the CPU profile (defaults to CPU.<timestamp>.<pid>.cpuprofile)' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof-interval -d 'Sampling interval in microseconds for CPU profiling (default: 1000)' -r
complete -c deno -n "__fish_deno_using_subcommand watch" -s t -l tunnel -d 'Execute tasks with a tunnel to Deno Deploy.      Create a secure connection between your local machine and Deno Deploy,     providing access to centralised environment variables, logging,     and serving from your local environment to the public internet' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand watch" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand watch" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand watch" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand watch" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand watch" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand watch" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof -d 'Start the V8 CPU profiler on startup and write the profile to disk on exit. Profiles are written to the current directory by default'
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof-md -d 'Generate a human-readable markdown report alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand watch" -l cpu-prof-flamegraph -d 'Generate an SVG flamegraph alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand watch" -l use-env-proxy -d 'Use HTTP_PROXY, HTTPS_PROXY, and NO_PROXY for node:http/node:https'
complete -c deno -n "__fish_deno_using_subcommand watch" -l no-use-env-proxy
complete -c deno -n "__fish_deno_using_subcommand watch" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand serve" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l port -d 'The TCP port to serve on. Pass 0 to pick a random free port [default: 8000]' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l host -d 'The TCP address to serve on, defaulting to 0.0.0.0 (all interfaces)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l watch-hmr -d 'Watch for file changes and hot-replace modules. The process restarts if hot replacement fails.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof-dir -d 'Directory where the V8 CPU profiles will be written. Implicitly enables --cpu-prof' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof-name -d 'Filename for the CPU profile (defaults to CPU.<timestamp>.<pid>.cpuprofile)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof-interval -d 'Sampling interval in microseconds for CPU profiling (default: 1000)' -r
complete -c deno -n "__fish_deno_using_subcommand serve" -s t -l tunnel -d 'Execute tasks with a tunnel to Deno Deploy.      Create a secure connection between your local machine and Deno Deploy,     providing access to centralised environment variables, logging,     and serving from your local environment to the public internet' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand serve" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand serve" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand serve" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand serve" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand serve" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand serve" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand serve" -l open -d 'Open the browser on the address that the server is running on.'
complete -c deno -n "__fish_deno_using_subcommand serve" -l parallel -d 'Run multiple server workers in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand serve" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof -d 'Start the V8 CPU profiler on startup and write the profile to disk on exit. Profiles are written to the current directory by default'
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof-md -d 'Generate a human-readable markdown report alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand serve" -l cpu-prof-flamegraph -d 'Generate an SVG flamegraph alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand serve" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand add" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand add" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand add" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand add" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand add" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand add" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand add" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand add" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand add" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand add" -s D -l dev -d 'Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand add" -s O -l save-optional -d 'Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand add" -l no-save -d 'Install the package(s) without adding them to the configuration file.'
complete -c deno -n "__fish_deno_using_subcommand add" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand add" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand add" -l npm -d 'assume unprefixed package names are npm packages (default)'
complete -c deno -n "__fish_deno_using_subcommand add" -l jsr -d 'assume unprefixed package names are jsr packages'
complete -c deno -n "__fish_deno_using_subcommand add" -l save-exact -d 'Save exact version without the caret (^)'
complete -c deno -n "__fish_deno_using_subcommand add" -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n "__fish_deno_using_subcommand audit" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand audit" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand audit" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand audit" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand audit" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand audit" -l level -d 'Only show advisories with severity greater or equal to the one specified' -r -f -a "low\t''
moderate\t''
high\t''
critical\t''"
complete -c deno -n "__fish_deno_using_subcommand audit" -l ignore -d 'Ignore advisories matching the given CVE IDs' -r
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand audit" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand audit" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand audit" -l ignore-unfixable -d 'Ignore advisories that don\'t have any actions to resolve them'
complete -c deno -n "__fish_deno_using_subcommand audit" -l socket -d 'Check against socket.dev vulnerability database'
complete -c deno -n "__fish_deno_using_subcommand audit" -l ignore-registry-errors -d 'Return exit code 0 if remote service(s) responds with an error.'
complete -c deno -n "__fish_deno_using_subcommand audit" -l fix -d 'Automatically fix vulnerabilities by upgrading packages'
complete -c deno -n "__fish_deno_using_subcommand remove" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand remove" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand remove" -l root -d 'Installation root' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand remove" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand remove" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand remove" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand remove" -s g -l global -d 'Remove globally installed package or module'
complete -c deno -n "__fish_deno_using_subcommand remove" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand remove" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand remove" -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n "__fish_deno_using_subcommand bench" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand bench" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand bench" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand bench" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand bench" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand bench" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand bench" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand bench" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l ignore -d 'Ignore files' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l filter -d 'Run benchmarks with this string or regexp pattern in the bench name' -r
complete -c deno -n "__fish_deno_using_subcommand bench" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bench" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand bench" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand bench" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand bench" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand bench" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand bench" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand bench" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand bench" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand bench" -l json -d 'UNSTABLE: Output benchmark result in JSON format'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-run -d 'Cache bench modules, but don\'t run benchmarks'
complete -c deno -n "__fish_deno_using_subcommand bench" -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n "__fish_deno_using_subcommand bench" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand bundle" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand bundle" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand bundle" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand bundle" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand bundle" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -s o -l output -d 'Output path`' -r -F
complete -c deno -n "__fish_deno_using_subcommand bundle" -l outdir -d 'Output directory for bundled files' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand bundle" -l external -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l format -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l packages -d 'How to handle packages. Accepted values are \'bundle\' or \'external\'' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l inline-imports -d 'Whether to inline imported modules into the importing file [default: true]' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand bundle" -l sourcemap -d 'Generate source map. Accepted values are \'linked\', \'inline\', or \'external\'' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l platform -d 'Platform to bundle for. Accepted values are \'browser\' or \'deno\'' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand bundle" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l minify -d 'Minify the output'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l keep-names -d 'Keep function and class names'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l code-splitting -d 'Enable code splitting'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l watch -d 'Watch and rebuild on changes'
complete -c deno -n "__fish_deno_using_subcommand bundle" -l declaration -d 'Generate .d.ts declaration files alongside the bundle'
complete -c deno -n "__fish_deno_using_subcommand cache" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand cache" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand cache" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand cache" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand cache" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand cache" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand cache" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand cache" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand cache" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand cache" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand cache" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand check" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand check" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand check" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand check" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand check" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand check" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand check" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand check" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand check" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand check" -l all -d 'Type-check all code, including remote modules and npm packages'
complete -c deno -n "__fish_deno_using_subcommand check" -l remote -d 'Type-check all modules, including remote ones'
complete -c deno -n "__fish_deno_using_subcommand check" -l doc -d 'Type-check code blocks in JSDoc as well as actual code'
complete -c deno -n "__fish_deno_using_subcommand check" -l doc-only -d 'Type-check code blocks in JSDoc and Markdown only'
complete -c deno -n "__fish_deno_using_subcommand check" -l check-js -d 'Enable type-checking of JavaScript files (equivalent to `compilerOptions.checkJs: true`)'
complete -c deno -n "__fish_deno_using_subcommand check" -l desktop -d 'Type-check using the type definitions for `deno desktop`'
complete -c deno -n "__fish_deno_using_subcommand check" -l watch -d 'Watch for file changes and restart process automatically.   Only local files from entry point module graph are watched.'
complete -c deno -n "__fish_deno_using_subcommand check" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand clean" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand clean" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand clean" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand clean" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand clean" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand clean" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand clean" -s e -l except -d 'Retain cache data needed by the given files'
complete -c deno -n "__fish_deno_using_subcommand clean" -l dry-run -d 'Show what would be removed without performing any actions'
complete -c deno -n "__fish_deno_using_subcommand compile" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand compile" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand compile" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand compile" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand compile" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l include -d 'Includes an additional module or file/directory in the compiled executable.   Use this flag if a dynamically imported module or a web worker main module   fails to load in the executable or to embed a file or directory in the executable.   This flag can be passed multiple times, to include multiple additional modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l exclude -d 'Excludes a file/directory in the compiled executable.   Use this flag to exclude a specific file or directory within the included files.   For example, to exclude a certain folder in the bundled node_modules directory.' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -s o -l output -d 'Output file (defaults to $PWD/<inferred-name>)' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l target -d 'Target OS architecture' -r -f -a "x86_64-unknown-linux-gnu\t''
aarch64-unknown-linux-gnu\t''
x86_64-pc-windows-msvc\t''
aarch64-pc-windows-msvc\t''
x86_64-apple-darwin\t''
aarch64-apple-darwin\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -l icon -d 'Set the icon of the executable on Windows (.ico)' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l app-name -d 'Stable identity for the compiled app.   Determines where origin-bound storage such as the default `Deno.openKv()`,   `localStorage` and `caches` is persisted (under the platform\'s app data directory).   Defaults to the output file name. Set this to keep storage stable across renames.' -r
complete -c deno -n "__fish_deno_using_subcommand compile" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand compile" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand compile" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand compile" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand compile" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand compile" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand compile" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand compile" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand compile" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-terminal -d 'Hide terminal on Windows'
complete -c deno -n "__fish_deno_using_subcommand compile" -l self-extracting -d 'Create a self-extracting binary that extracts the embedded file system to disk on first run and then runs from there'
complete -c deno -n "__fish_deno_using_subcommand compile" -l bundle -d 'Experimental. Bundle the entrypoint with esbuild before embedding, instead of shipping the whole node_modules tree.   Produces a smaller binary with faster startup, at the cost of dropping dynamic require/import patterns that can\'t be statically traced.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l minify -d 'Experimental. Minify the bundled output. Only meaningful with --bundle.   Reduces both the embedded bundle size and runtime memory use, at the cost of less readable stack traces.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l exclude-unused-npm -d 'Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).   Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.   Reduces binary size when the lockfile contains packages the entrypoint does not import.   Skips packages that are only reached through non-statically-analyzable dynamic imports;   pass those with --include npm:<pkg> if needed.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l watch -d 'Watch for file changes and restart process automatically.   Only local files from entry point module graph are watched.'
complete -c deno -n "__fish_deno_using_subcommand compile" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand create" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand create" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand create" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand create" -l npm -d 'Treat unprefixed package names as npm packages'
complete -c deno -n "__fish_deno_using_subcommand create" -l jsr -d 'Treat unprefixed package names as JSR packages'
complete -c deno -n "__fish_deno_using_subcommand create" -s y -l yes -d 'Bypass the prompt and run with full permissions'
complete -c deno -n "__fish_deno_using_subcommand desktop" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand desktop" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l inspect-renderer -d 'Override the CEF renderer debugger listen address; defaults to an auto-allocated port' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l include -d 'Includes an additional module or file/directory in the compiled executable.   Use this flag if a dynamically imported module or a web worker main module   fails to load in the executable or to embed a file or directory in the executable.   This flag can be passed multiple times, to include multiple additional modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l exclude -d 'Excludes a file/directory in the compiled executable.   Use this flag to exclude a specific file or directory within the included files.' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -s o -l output -d 'Output path (e.g. MyApp.app, MyApp.dmg, MyApp.AppImage, MyApp.deb, MyApp.rpm, MyApp.msi)' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l target -d 'Target OS architecture' -r -f -a "x86_64-unknown-linux-gnu\t''
aarch64-unknown-linux-gnu\t''
x86_64-pc-windows-msvc\t''
aarch64-pc-windows-msvc\t''
x86_64-apple-darwin\t''
aarch64-apple-darwin\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l icon -d 'Set the application icon (.ico on Windows, .icns or .png on macOS)' -r
complete -c deno -n "__fish_deno_using_subcommand desktop" -l backend -d 'Backend to use for the desktop app' -r -f -a "webview\t''
cef\t''
raw\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l compress -d 'Make the packaged app self-extracting: the payload is compressed inside the app and unpacked on first launch. Off by default. Defaults to xz (decompressed by the system `tar` everywhere); zstd is smaller/faster but needs the `zstd` tool at runtime.' -r -f -a "xz\t''
lzma\t''
zstd\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand desktop" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand desktop" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand desktop" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand desktop" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand desktop" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand desktop" -l exclude-unused-npm -d 'Embed only the npm packages reachable from the module graph (managed npm; no node_modules directory).   Without this flag the full managed npm snapshot from the lockfile / package.json is embedded.   Reduces binary size when the lockfile contains packages the entrypoint does not import.   Skips packages that are only reached through non-statically-analyzable dynamic imports;   pass those with --include npm:<pkg> if needed.'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l no-code-cache -d 'Disable V8 code cache feature'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l hmr -d 'Run the desktop app with Hot Module Replacement enabled'
complete -c deno -n "__fish_deno_using_subcommand desktop" -l all-targets -d 'Build for all supported target platforms'
complete -c deno -n "__fish_deno_using_subcommand completions" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand completions" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand completions" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand completions" -l dynamic -d 'Generate dynamic completions for the given shell (unstable), currently this only provides available tasks for `deno task`.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand coverage" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand coverage" -l ignore -d 'Ignore coverage files' -r -F
complete -c deno -n "__fish_deno_using_subcommand coverage" -l include -d 'Include source files in the report' -r
complete -c deno -n "__fish_deno_using_subcommand coverage" -l exclude -d 'Exclude source files from the report' -r
complete -c deno -n "__fish_deno_using_subcommand coverage" -l output -d 'Exports the coverage report in lcov format to the given file.   If no --output arg is specified then the report is written to stdout.' -r -F
complete -c deno -n "__fish_deno_using_subcommand coverage" -l threshold -d 'Fail if coverage is below this percentage (0-100), applied to line, branch, and function coverage.   Per-metric thresholds can be set in deno.json under "coverage": { "thresholds": { ... } }. The flag takes precedence.' -r
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand coverage" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l lcov -d 'Output coverage report in lcov format'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l html -d 'Output coverage report in HTML format in the given directory'
complete -c deno -n "__fish_deno_using_subcommand coverage" -l detailed -d 'Output coverage report in detailed format in the terminal'
complete -c deno -n "__fish_deno_using_subcommand doc" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand doc" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand doc" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand doc" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand doc" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand doc" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand doc" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand doc" -l name -d 'The name that will be used in the docs (ie for breadcrumbs)' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l category-docs -d 'Path to a JSON file keyed by category and an optional value of a markdown doc' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l symbol-redirect-map -d 'Path to a JSON file keyed by file, with an inner map of symbol to an external link' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l default-symbol-map -d 'Uses the provided mapping of default name to wanted name for usage blocks' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l output -d 'Directory for HTML documentation output' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand doc" -l filter -d 'Dot separated path to symbol' -r
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand doc" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand doc" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand doc" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand doc" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand doc" -l json -d 'Output documentation in JSON format'
complete -c deno -n "__fish_deno_using_subcommand doc" -l html -d 'Output documentation in HTML format'
complete -c deno -n "__fish_deno_using_subcommand doc" -l strip-trailing-html -d 'Remove trailing .html from various links. Will still generate files with a .html extension'
complete -c deno -n "__fish_deno_using_subcommand doc" -l private -d 'Output private documentation'
complete -c deno -n "__fish_deno_using_subcommand doc" -l lint -d 'Output documentation diagnostics.'
complete -c deno -n "__fish_deno_using_subcommand deploy" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand deploy" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand deploy" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand sandbox" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand sandbox" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand sandbox" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand eval" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand eval" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand eval" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand eval" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand eval" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand eval" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand eval" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof-dir -d 'Directory where the V8 CPU profiles will be written. Implicitly enables --cpu-prof' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof-name -d 'Filename for the CPU profile (defaults to CPU.<timestamp>.<pid>.cpuprofile)' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof-interval -d 'Sampling interval in microseconds for CPU profiling (default: 1000)' -r
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand eval" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand eval" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand eval" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand eval" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand eval" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand eval" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand eval" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand eval" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand eval" -s p -l print -d 'print result to stdout'
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof -d 'Start the V8 CPU profiler on startup and write the profile to disk on exit. Profiles are written to the current directory by default'
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof-md -d 'Generate a human-readable markdown report alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand eval" -l cpu-prof-flamegraph -d 'Generate an SVG flamegraph alongside the CPU profile'
complete -c deno -n "__fish_deno_using_subcommand fmt" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand fmt" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''
md\t''
json\t''
jsonc\t''
css\t''
scss\t''
less\t''
html\t''
svelte\t''
vue\t''
astro\t''
yml\t''
yaml\t''
ipynb\t''
sql\t''
vto\t''
njk\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -l ignore -d 'Ignore formatting particular source files' -r -F
complete -c deno -n "__fish_deno_using_subcommand fmt" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand fmt" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand fmt" -l use-tabs -d 'Use tabs instead of spaces for indentation [default: false]' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -l line-width -d 'Define maximum line width [default: 80]' -r
complete -c deno -n "__fish_deno_using_subcommand fmt" -l indent-width -d 'Define indentation width [default: 2]' -r
complete -c deno -n "__fish_deno_using_subcommand fmt" -l single-quote -d 'Use single quotes [default: false]' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -l prose-wrap -d 'Define how prose should be wrapped [default: always]' -r -f -a "always\t''
never\t''
preserve\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -l no-semicolons -d 'Don\'t use semicolons except where necessary [default: false]' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand fmt" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l check -d 'Check if the source files are formatted'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l fail-fast -d 'Stop checking files on first format error'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l no-editorconfig -d 'Don\'t read .editorconfig files to infer formatting options [default: false]'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-css -d 'Enable formatting CSS, SCSS and Less files'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-html -d 'Enable formatting HTML files'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-component -d 'Enable formatting Svelte, Vue, Astro and Angular files'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-yaml -d 'Enable formatting YAML files'
complete -c deno -n "__fish_deno_using_subcommand fmt" -l unstable-sql -d 'Enable formatting SQL files.'
complete -c deno -n "__fish_deno_using_subcommand init" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand init" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand init" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand init" -l npm -d 'Generate a npm create-* project'
complete -c deno -n "__fish_deno_using_subcommand init" -l jsr -d 'Generate a project from a JSR package'
complete -c deno -n "__fish_deno_using_subcommand init" -l lib -d 'Generate an example library project'
complete -c deno -n "__fish_deno_using_subcommand init" -l serve -d 'Generate an example project for `deno serve`'
complete -c deno -n "__fish_deno_using_subcommand init" -l empty -d 'Generate a minimal project with just main.ts and deno.json'
complete -c deno -n "__fish_deno_using_subcommand init" -s y -l yes -d 'Bypass the prompt and run with full permissions'
complete -c deno -n "__fish_deno_using_subcommand info" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand info" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand info" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l location -d 'Show files used for origin bound APIs like the Web Storage API when running a script with --location=<HREF>' -r -f
complete -c deno -n "__fish_deno_using_subcommand info" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand info" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand info" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand info" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand info" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand info" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand info" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand info" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand info" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand info" -l json -d 'UNSTABLE: Outputs the information in JSON format'
complete -c deno -n "__fish_deno_using_subcommand list" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand list" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand list" -l depth -d 'Maximum depth of the dependency tree to display (0 = direct dependencies only)' -r
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand list" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand list" -l prod -d 'Only list production dependencies'
complete -c deno -n "__fish_deno_using_subcommand list" -l dev -d 'Only list development dependencies'
complete -c deno -n "__fish_deno_using_subcommand list" -s r -l recursive -d 'Include all workspace members'
complete -c deno -n "__fish_deno_using_subcommand install" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand install" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand install" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand install" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand install" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand install" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand install" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand install" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand install" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand install" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand install" -s n -l name -d 'Executable file name' -r
complete -c deno -n "__fish_deno_using_subcommand install" -l root -d 'Installation root' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand install" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand install" -l os -d 'Target OS for npm package installation (e.g., linux, darwin, win32)' -r -f -a "aix\t''
android\t''
darwin\t''
freebsd\t''
linux\t''
openbsd\t''
sunos\t''
win32\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -l arch -d 'Target architecture for npm package installation (e.g., x64, arm64)' -r -f -a "arm\t''
arm64\t''
ia32\t''
mips\t''
mipsel\t''
ppc\t''
ppc64\t''
s390\t''
s390x\t''
x64\t''"
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand install" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand install" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand install" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand install" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand install" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand install" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand install" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand install" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand install" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand install" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand install" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand install" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand install" -s f -l force -d 'Forcefully overwrite existing installation'
complete -c deno -n "__fish_deno_using_subcommand install" -l compile -d 'Install the script as a compiled executable'
complete -c deno -n "__fish_deno_using_subcommand install" -s g -l global -d 'Install a package or script as a globally available executable'
complete -c deno -n "__fish_deno_using_subcommand install" -s e -l entrypoint -d 'Install dependents of the specified entrypoint(s)'
complete -c deno -n "__fish_deno_using_subcommand install" -s D -l dev -d 'Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand install" -s O -l save-optional -d 'Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand install" -l no-save -d 'Install the package(s) without adding them to the configuration file.'
complete -c deno -n "__fish_deno_using_subcommand install" -l npm -d 'assume unprefixed package names are npm packages (default)'
complete -c deno -n "__fish_deno_using_subcommand install" -l jsr -d 'assume unprefixed package names are jsr packages'
complete -c deno -n "__fish_deno_using_subcommand install" -l save-exact -d 'Save exact version without the caret (^)'
complete -c deno -n "__fish_deno_using_subcommand install" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand install" -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n "__fish_deno_using_subcommand install" -l prod -d 'Only install production dependencies (excludes devDependencies)'
complete -c deno -n "__fish_deno_using_subcommand install" -l skip-types -d 'Exclude @types/* packages from installation. Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.'
complete -c deno -n "__fish_deno_using_subcommand i" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand i" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand i" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand i" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand i" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand i" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand i" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand i" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand i" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand i" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand i" -s n -l name -d 'Executable file name' -r
complete -c deno -n "__fish_deno_using_subcommand i" -l root -d 'Installation root' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand i" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand i" -l os -d 'Target OS for npm package installation (e.g., linux, darwin, win32)' -r -f -a "aix\t''
android\t''
darwin\t''
freebsd\t''
linux\t''
openbsd\t''
sunos\t''
win32\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -l arch -d 'Target architecture for npm package installation (e.g., x64, arm64)' -r -f -a "arm\t''
arm64\t''
ia32\t''
mips\t''
mipsel\t''
ppc\t''
ppc64\t''
s390\t''
s390x\t''
x64\t''"
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand i" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand i" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand i" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand i" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand i" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand i" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand i" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand i" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand i" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand i" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand i" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand i" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand i" -s f -l force -d 'Forcefully overwrite existing installation'
complete -c deno -n "__fish_deno_using_subcommand i" -l compile -d 'Install the script as a compiled executable'
complete -c deno -n "__fish_deno_using_subcommand i" -s g -l global -d 'Install a package or script as a globally available executable'
complete -c deno -n "__fish_deno_using_subcommand i" -s e -l entrypoint -d 'Install dependents of the specified entrypoint(s)'
complete -c deno -n "__fish_deno_using_subcommand i" -s D -l dev -d 'Add the package as a dev dependency (under `devDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand i" -s O -l save-optional -d 'Add the package as an optional dependency (under `optionalDependencies`). Note: this only applies when adding to a `package.json` file.'
complete -c deno -n "__fish_deno_using_subcommand i" -l no-save -d 'Install the package(s) without adding them to the configuration file.'
complete -c deno -n "__fish_deno_using_subcommand i" -l npm -d 'assume unprefixed package names are npm packages (default)'
complete -c deno -n "__fish_deno_using_subcommand i" -l jsr -d 'assume unprefixed package names are jsr packages'
complete -c deno -n "__fish_deno_using_subcommand i" -l save-exact -d 'Save exact version without the caret (^)'
complete -c deno -n "__fish_deno_using_subcommand i" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand i" -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n "__fish_deno_using_subcommand i" -l prod -d 'Only install production dependencies (excludes devDependencies)'
complete -c deno -n "__fish_deno_using_subcommand i" -l skip-types -d 'Exclude @types/* packages from installation. Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.'
complete -c deno -n "__fish_deno_using_subcommand ci" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand ci" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand ci" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand ci" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand ci" -l prod -d 'Only install production dependencies (excludes devDependencies)'
complete -c deno -n "__fish_deno_using_subcommand ci" -l skip-types -d 'Exclude @types/* packages from installation. Be careful, as it uses a name-based heuristic and may skip packages that ship runtime code.'
complete -c deno -n "__fish_deno_using_subcommand json_reference" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand json_reference" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand json_reference" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -s n -l name -d 'Set a name for the kernel (defaults to \'deno\'). Useful when maintaing multiple Deno kernels.' -r
complete -c deno -n "__fish_deno_using_subcommand jupyter" -s d -l display -d 'Set a display name for the kernel (defaults to \'Deno\'). Useful when maintaing multiple Deno kernels.' -r
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l conn -d 'Path to JSON file describing connection parameters, provided by Jupyter' -r -F
complete -c deno -n "__fish_deno_using_subcommand jupyter" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand jupyter" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l install -d 'Install a kernelspec'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l force -d 'Force installation of a kernel, overwriting previously existing kernelspec'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -l kernel -d 'Start the kernel'
complete -c deno -n "__fish_deno_using_subcommand jupyter" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand approve-scripts" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand uninstall" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l root -d 'Installation root' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -s g -l global -d 'Remove globally installed packages or modules'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand uninstall" -l package-json -d 'Force using package.json for dependency management instead of deno.json'
complete -c deno -n "__fish_deno_using_subcommand outdated" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand outdated" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand outdated" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand outdated" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand outdated" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand outdated" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand outdated" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l latest -d 'Consider the latest version, regardless of semver constraints'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l compatible -d 'Only consider versions that satisfy semver requirements'
complete -c deno -n "__fish_deno_using_subcommand outdated" -s r -l recursive -d 'Include all workspace members'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand outdated" -s i -l interactive -d 'Interactively select which dependencies to update'
complete -c deno -n "__fish_deno_using_subcommand outdated" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand outdated" -s u -l update -d 'Update dependency versions'
complete -c deno -n "__fish_deno_using_subcommand link" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand link" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand link" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand link" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand link" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand link" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand link" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand unlink" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand unlink" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand unlink" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand unlink" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand unlink" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand unlink" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand lsp" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand lsp" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand lsp" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand lint" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand lint" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand lint" -l ext -d 'Specify the file extension to lint when reading from stdin.For example, use `jsx` to lint JSX files or `tsx` for TSX files.This argument is necessary because stdin input does not automatically infer the file type.Example usage: `cat file.jsx | deno lint - --ext=jsx`.' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -l rules-tags -d 'Use set of rules with a tag' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -l rules-include -d 'Include lint rules' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -l rules-exclude -d 'Exclude lint rules' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand lint" -l ignore -d 'Ignore linting particular source files' -r -F
complete -c deno -n "__fish_deno_using_subcommand lint" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand lint" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand lint" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand lint" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand lint" -l fix -d 'Fix any linting errors for rules that support it'
complete -c deno -n "__fish_deno_using_subcommand lint" -l rules -d 'List available rules'
complete -c deno -n "__fish_deno_using_subcommand lint" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand lint" -l json -d 'Output lint result in JSON format'
complete -c deno -n "__fish_deno_using_subcommand lint" -l compact -d 'Output lint result in compact format'
complete -c deno -n "__fish_deno_using_subcommand lint" -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n "__fish_deno_using_subcommand lint" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand publish" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand publish" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand publish" -l token -d 'The API token to use when publishing. If unset, interactive authentication is be used' -r
complete -c deno -n "__fish_deno_using_subcommand publish" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand publish" -l set-version -d 'Set version for a package to be published.   This flag can be used while publishing individual packages and cannot be used in a workspace.' -r
complete -c deno -n "__fish_deno_using_subcommand publish" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand publish" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand publish" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand publish" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand publish" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand publish" -l dry-run -d 'Prepare the package for publishing performing all checks and validations without uploading'
complete -c deno -n "__fish_deno_using_subcommand publish" -l allow-slow-types -d 'Allow publishing with slow types'
complete -c deno -n "__fish_deno_using_subcommand publish" -l allow-dirty -d 'Allow publishing if the repository has uncommitted changed'
complete -c deno -n "__fish_deno_using_subcommand publish" -l no-provenance -d 'Disable provenance attestation.   Enabled by default on Github actions, publicly links the package to where it was built and published from.'
complete -c deno -n "__fish_deno_using_subcommand pack" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand pack" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand pack" -s o -l output -d 'Output file path (defaults to <name>-<version>.tgz)' -r
complete -c deno -n "__fish_deno_using_subcommand pack" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand pack" -l set-version -d 'Override the version in the tarball' -r
complete -c deno -n "__fish_deno_using_subcommand pack" -l ignore -d 'Ignore files matching these patterns' -r -F
complete -c deno -n "__fish_deno_using_subcommand pack" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand pack" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand pack" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand pack" -l dry-run -d 'Show what would be packed without creating the tarball'
complete -c deno -n "__fish_deno_using_subcommand pack" -l allow-slow-types -d 'Skip fast-check type extraction; .d.ts files are omitted from the output'
complete -c deno -n "__fish_deno_using_subcommand pack" -l allow-dirty -d 'Allow packing if the repository has uncommitted changes'
complete -c deno -n "__fish_deno_using_subcommand pack" -l no-source-maps -d 'Don\'t include source maps in the output'
complete -c deno -n "__fish_deno_using_subcommand repl" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand repl" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand repl" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand repl" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand repl" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand repl" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand repl" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand repl" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand repl" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand repl" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l eval-file -d 'Evaluates the provided file(s) as scripts when the REPL starts. Accepts file paths and URLs' -r -F
complete -c deno -n "__fish_deno_using_subcommand repl" -l eval -d 'Evaluates the provided code when the REPL starts' -r
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand repl" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand repl" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand repl" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand repl" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand repl" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand repl" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand repl" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand repl" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand repl" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand repl" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand repl" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand repl" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand repl" -l json
complete -c deno -n "__fish_deno_using_subcommand task" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand task" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand task" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand task" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand task" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand task" -l cwd -d 'Specify the directory to run the task in' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand task" -s f -l filter -d 'Filter members of the workspace by name, implies --recursive flag' -r
complete -c deno -n "__fish_deno_using_subcommand task" -s j -l jobs -l concurrency -d 'Maximum number of tasks to run concurrently. Overrides the DENO_JOBS environment variable; defaults to the number of available CPUs. Use 1 to force sequential execution. Only affects runs where multiple tasks can run concurrently (workspace runs, or a task with parallelizable dependencies)' -r
complete -c deno -n "__fish_deno_using_subcommand task" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand task" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand task" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand task" -s t -l tunnel -d 'Execute tasks with a tunnel to Deno Deploy.      Create a secure connection between your local machine and Deno Deploy,     providing access to centralised environment variables, logging,     and serving from your local environment to the public internet' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand task" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand task" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand task" -s r -l recursive -d 'Run the task in all projects in the workspace'
complete -c deno -n "__fish_deno_using_subcommand task" -l eval -d 'Evaluate the passed value as if it was a task in a configuration file'
complete -c deno -n "__fish_deno_using_subcommand task" -l no-prefix -d 'Disable prefixing the output of concurrently-executing tasks with the task name'
complete -c deno -n "__fish_deno_using_subcommand task" -l if-present -d 'Exit with code 0 instead of an error when the task is not found'
complete -c deno -n "__fish_deno_using_subcommand test" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand test" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand test" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand test" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand test" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand test" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand test" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand test" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand test" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand test" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand test" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l check -d 'Set type-checking behavior. This subcommand type-checks local modules by default, so passing --check is redundant; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l ignore -d 'Ignore files' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l fail-fast -d 'Stop after N errors. Defaults to stopping after first failure' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l filter -d 'Run tests with this string or regexp pattern in the test name' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l shuffle -d 'Shuffle the order in which the tests are run' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l retry -d 'Re-run failing tests up to NUMBER times. A test passes if any attempt passes. Tests that set their own `retry` option take precedence' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l repeats -d 'Run each test NUMBER additional times. Every repetition must pass. Tests that set their own `repeats` option take precedence' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l shard -d 'Run only the test files for shard INDEX of COUNT, e.g. --shard=2/3.   The discovered test files are sorted and split into COUNT consecutive groups; INDEX is 1-based. Useful for splitting a run across machines.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l coverage -d 'Collect coverage profile data into DIR. If DIR is not specified, it uses \'coverage/\'.   This option can also be set via the DENO_COVERAGE_DIR environment variable.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l coverage-threshold -d 'Fail if coverage is below this percentage (0-100). Requires --coverage' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l changed -d 'Run only test modules affected by files changed in git.   With no value, uses uncommitted changes (staged, unstaged and untracked).   Pass a git ref to compare against, e.g. --changed=main or --changed=HEAD~1.' -r
complete -c deno -n "__fish_deno_using_subcommand test" -l related -d 'Run only test modules that depend on the given source files' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l watch -d 'Watch for file changes and restart process automatically.   Local files from entry point module graph are watched by default.   Additional paths might be watched by passing them as arguments to this flag.' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l watch-exclude -d 'Exclude provided files/patterns from watch mode' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l junit-path -d 'Write a JUnit XML test report to PATH. Use \'-\' to write to stdout which is the default when PATH is not provided' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l reporter -d 'Select reporter to use. Default to \'pretty\'' -r -f -a "pretty\t''
dot\t''
junit\t''
tap\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand test" -l ext -d 'Set content type of the supplied file' -r -f -a "ts\t''
tsx\t''
js\t''
jsx\t''
mts\t''
mjs\t''
cts\t''
cjs\t''"
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand test" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand test" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand test" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand test" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand test" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand test" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand test" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand test" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand test" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand test" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand test" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand test" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand test" -l no-run -d 'Cache test modules, but don\'t run tests'
complete -c deno -n "__fish_deno_using_subcommand test" -l trace-leaks -d 'Enable tracing of leaks. Useful when debugging leaking ops in test, but impacts test execution time'
complete -c deno -n "__fish_deno_using_subcommand test" -l sanitize-ops -d 'Enable the ops sanitizer, which ensures that all async ops started in a test are completed before the test ends'
complete -c deno -n "__fish_deno_using_subcommand test" -l sanitize-resources -d 'Enable the resources sanitizer, which ensures that all resources opened in a test are closed before the test ends'
complete -c deno -n "__fish_deno_using_subcommand test" -l doc -d 'Evaluate code blocks in JSDoc and Markdown'
complete -c deno -n "__fish_deno_using_subcommand test" -l permit-no-files -d 'Don\'t return an error code if no files were found'
complete -c deno -n "__fish_deno_using_subcommand test" -l coverage-raw-data-only -d 'Only collect raw coverage data, without generating a report'
complete -c deno -n "__fish_deno_using_subcommand test" -l clean -d 'Empty the temporary coverage profile data directory before running tests.   Note: running multiple `deno test --clean` calls in series or parallel for the same coverage directory may cause race conditions.'
complete -c deno -n "__fish_deno_using_subcommand test" -l parallel -d 'Run test modules in parallel. Parallelism defaults to the number of available CPUs or the value of the DENO_JOBS environment variable'
complete -c deno -n "__fish_deno_using_subcommand test" -l no-clear-screen -d 'Do not clear terminal screen when under watch mode'
complete -c deno -n "__fish_deno_using_subcommand test" -l hide-stacktraces -d 'Hide stack traces for errors in failure test results.'
complete -c deno -n "__fish_deno_using_subcommand test" -s u -l update-snapshots -d 'Update snapshots created with `t.assertSnapshot()` instead of failing when they do not match'
complete -c deno -n "__fish_deno_using_subcommand transpile" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand transpile" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand transpile" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand transpile" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand transpile" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand transpile" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand transpile" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand transpile" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand transpile" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand transpile" -s o -l output -d 'Output file path (for single file transpilation)' -r -F
complete -c deno -n "__fish_deno_using_subcommand transpile" -l outdir -d 'Output directory for transpiled files' -r -f -a "(__fish_complete_directories)"
complete -c deno -n "__fish_deno_using_subcommand transpile" -l source-map -d 'Source map mode: none, inline, or separate' -r -f -a "none\t''
inline\t''
separate\t''"
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand transpile" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand transpile" -l declaration -d 'Generate .d.ts declaration files (requires type-checking via tsc)'
complete -c deno -n "__fish_deno_using_subcommand types" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand types" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand types" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand update" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand update" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand update" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand update" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand update" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand update" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand update" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand update" -l latest -d 'Consider the latest version, regardless of semver constraints'
complete -c deno -n "__fish_deno_using_subcommand update" -l compatible -d 'Only consider versions that satisfy semver requirements'
complete -c deno -n "__fish_deno_using_subcommand update" -s r -l recursive -d 'Include all workspace members'
complete -c deno -n "__fish_deno_using_subcommand update" -l lockfile-only -d 'Install only updating the lockfile'
complete -c deno -n "__fish_deno_using_subcommand update" -s i -l interactive -d 'Interactively select which dependencies to update'
complete -c deno -n "__fish_deno_using_subcommand update" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand upgrade" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l version -d 'The version to upgrade to' -r
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l output -d 'The path to output the updated version to' -r -F
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l checksum -d 'Verify the downloaded archive against the provided SHA256 checksum' -r
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l dry-run -d 'Perform all checks without replacing old exe'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -s f -l force -d 'Replace current exe even if not out-of-date'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l canary -d 'Upgrade to canary builds'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l rc -d 'Upgrade to a release candidate'
complete -c deno -n "__fish_deno_using_subcommand upgrade" -l no-delta -d 'Disable delta updates and always download the full archive'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand bump-version" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l start -d '[conventional-commits mode] Git ref to start from. Default: latest tag (git describe --tags --abbrev=0)' -r
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l base -d '[conventional-commits mode] Git ref to compare against. Default: current branch' -r
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l import-map -d 'Path to the import map to rewrite jsr: version constraints in. Defaults to the root deno.json (or its importMap target)' -r
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l release-notes -d '[conventional-commits mode] Path to the release notes file to prepend. Default: Releases.md' -r
complete -c deno -n "__fish_deno_using_subcommand bump-version" -s c -l config -d 'Explicit path to the manifest file to bump.   May point to a `deno.json`/`deno.jsonc` or a `package.json`. When   set, single-file mode is forced (workspace auto-detection is bypassed).   Useful when both `deno.json` and `package.json` exist in the same   directory.' -r -F
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -s w -l workspace -d 'Bump every package in the workspace (auto-detected at the workspace root)'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l no-workspace -d 'Disable workspace mode and only bump the deno.json/package.json in the current directory'
complete -c deno -n "__fish_deno_using_subcommand bump-version" -l dry-run -d 'Print the planned changes without writing any files'
complete -c deno -n "__fish_deno_using_subcommand vendor" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand vendor" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand vendor" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand why" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand why" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand why" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand why" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand why" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand why" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand why" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand x" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand x" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand x" -l no-check -d 'Skip type-checking. If the value of "remote" is supplied, diagnostic errors from remote modules will be ignored' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l import-map -d 'Load import map file from local file or remote URL   Docs: https://docs.deno.com/runtime/manual/basics/import_maps' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l node-modules-dir -d 'Selects the node_modules directory mode for npm packages (not a path). One of: auto (create a local node_modules directory and install npm packages into it), manual (use the existing local node_modules directory, do not modify it), none (do not use a local node_modules directory; resolve npm packages from the global cache). Defaults to auto when the flag is passed without a value.' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l node-modules-linker -d 'Sets the linker mode for npm packages (isolated or hoisted)' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l vendor -d 'Toggles local vendor folder usage for remote modules and a node_modules folder for npm packages' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand x" -l conditions -d 'Use this argument to specify custom conditions for npm package exports. You can also use DENO_CONDITIONS env var.  Docs: https://docs.deno.com/go/conditional-exports' -r
complete -c deno -n "__fish_deno_using_subcommand x" -s c -l config -d 'Configure different aspects of deno including TypeScript, linting, and code formatting.   Typically the configuration file will be called `deno.json` or `deno.jsonc` and   automatically detected; in that case this flag is not necessary.   Docs: https://docs.deno.com/go/config' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -s r -l reload -d 'Reload source code cache (recompile TypeScript). With no value, reloads everything. Pass a comma-separated list of specifiers to reload only those modules; npm: reloads all npm modules; npm:chalk reloads a single npm module; jsr:@std/http/file-server,jsr:@std/assert/assert-equals reloads specific modules.' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l lock -d 'Check the specified lock file. (If value is not provided, defaults to "./deno.lock")' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l frozen -d 'Error out if lockfile is out of date' -r -f -a "true\t''
false\t''"
complete -c deno -n "__fish_deno_using_subcommand x" -l cert -d 'Load certificate authority from PEM encoded file' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l unsafely-ignore-certificate-errors -d 'DANGER: Disables verification of TLS certificates' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l minimum-dependency-age -d '(Unstable) The age in minutes, ISO-8601 duration or RFC3339 absolute timestamp (e.g. \'120\' for two hours, \'P2D\' for two days, \'2025-09-16\' for cutoff date, \'2025-09-16T12:00:00+00:00\' for cutoff time, \'0\' to disable)' -r
complete -c deno -n "__fish_deno_using_subcommand x" -s P -l permission-set -r
complete -c deno -n "__fish_deno_using_subcommand x" -s R -l allow-read -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-read -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l ignore-read -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -s W -l allow-write -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-write -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -s N -l allow-net -r
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-net -r
complete -c deno -n "__fish_deno_using_subcommand x" -s E -l allow-env -r
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-env -r
complete -c deno -n "__fish_deno_using_subcommand x" -l ignore-env -r
complete -c deno -n "__fish_deno_using_subcommand x" -s S -l allow-sys -r
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-sys -r
complete -c deno -n "__fish_deno_using_subcommand x" -l allow-run -r
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-run -r
complete -c deno -n "__fish_deno_using_subcommand x" -l allow-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-ffi -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -s I -l allow-import -d 'Allow importing from remote hosts. Optionally specify allowed IP addresses and host names, with ports as necessary. Default value: deno.land:443,jsr.io:443,esm.sh:443,raw.esm.sh:443,cdn.jsdelivr.net:443,raw.githubusercontent.com:443,gist.githubusercontent.com:443' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-import -d 'Deny importing from remote hosts. Optionally specify denied IP addresses and host names, with ports as necessary.' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l inspect -d 'Activate inspector on host:port [default: 127.0.0.1:9229]. Host and port are optional. Using port 0 will assign a random free port.' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l inspect-brk -d 'Activate inspector on host:port, wait for debugger to connect and break at the start of user script' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l inspect-wait -d 'Activate inspector on host:port and wait for debugger to connect before running user code' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l inspect-publish-uid -r
complete -c deno -n "__fish_deno_using_subcommand x" -l allow-scripts -d 'Allow running npm lifecycle scripts for the given packages   Note: Scripts will only be executed when using a node_modules directory (`--node-modules-dir`)' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l location -d 'Value of globalThis.location used by some web APIs' -r -f
complete -c deno -n "__fish_deno_using_subcommand x" -l v8-flags -d 'To see a list of all available flags use --v8-flags=--help   Flags can also be set via the DENO_V8_FLAGS environment variable.   Any flags set with this flag are appended after the DENO_V8_FLAGS environment variable' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l seed -d 'Set the random number generator seed' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l trace-ops -d 'Trace low-level op calls' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l preload -d 'A list of files that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l require -d 'A list of CommonJS modules that will be executed before the main module' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l ignore-scripts -d 'Do not run npm lifecycle scripts for the given packages' -r
complete -c deno -n "__fish_deno_using_subcommand x" -s p -l package -d 'Package to install (use when the binary name differs from the package name)' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l check -d 'Enable type-checking. This subcommand does not type-check by default; pass --check=all to also type-check remote modules. Alternatively, use the \'deno check\' subcommand.' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l env-file -d 'Load environment variables from local file   Only the first environment variable with a given key is used.   Existing process environment variables are not overwritten, so if variables with the same names already exist in the environment, their values will be preserved.   Where multiple declarations for the same environment variable exist in your .env file, the first one encountered is applied. This is determined by the order of the files you pass as arguments.' -r -F
complete -c deno -n "__fish_deno_using_subcommand x" -l install-alias -d 'Creates a dx alias so you can run dx <command> instead of deno x <command>' -r
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand x" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand x" -l no-remote -d 'Do not resolve remote modules'
complete -c deno -n "__fish_deno_using_subcommand x" -l no-npm -d 'Do not resolve npm modules'
complete -c deno -n "__fish_deno_using_subcommand x" -l no-config -d 'Disable automatic loading of the configuration file'
complete -c deno -n "__fish_deno_using_subcommand x" -l no-lock -d 'Disable auto discovery of the lock file'
complete -c deno -n "__fish_deno_using_subcommand x" -s A -l allow-all -d 'Allow all permissions'
complete -c deno -n "__fish_deno_using_subcommand x" -l allow-hrtime
complete -c deno -n "__fish_deno_using_subcommand x" -l deny-hrtime
complete -c deno -n "__fish_deno_using_subcommand x" -l no-prompt
complete -c deno -n "__fish_deno_using_subcommand x" -l cached-only -d 'Require that remote dependencies are already cached'
complete -c deno -n "__fish_deno_using_subcommand x" -l enable-testing-features-do-not-use -d 'INTERNAL: Enable internal features used during integration testing'
complete -c deno -n "__fish_deno_using_subcommand x" -l eszip-internal-do-not-use
complete -c deno -n "__fish_deno_using_subcommand x" -s y -l yes -d 'Assume confirmation for all prompts'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable -d 'The `--unstable` flag has been deprecated. Use granular `--unstable-*` flags instead   To view the list of individual unstable feature flags, run this command again with --help=unstable'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-bare-node-builtins -d 'Enable unstable bare node builtins feature'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-broadcast-channel -d 'Enable unstable `BroadcastChannel` API'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-bundle -d 'Enable unstable bundle runtime API'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-byonm -d ''
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-cron -d 'Enable unstable `Deno.cron` API'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-detect-cjs -d 'Treats ambiguous .js, .jsx, .ts, .tsx files as CommonJS modules in more cases'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-ffi -d 'Enable unstable FFI APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-fs -d 'Enable unstable file system APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-http -d 'Enable unstable HTTP APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-kv -d 'Enable unstable KV APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-lazy-dynamic-imports -d 'Lazily loads statically analyzable dynamic imports when not running with type checking. Warning: This may change the order of semver specifier resolution.'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-lockfile-v5 -d 'Enable unstable lockfile v5'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-net -d 'enable unstable net APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-no-legacy-abort -d 'Enable abort signal in Deno.serve without legacy behavior. This will not abort the server when the request is handled successfully.'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-node-globals -d 'Deprecated. Node.js `setTimeout` and `setInterval` globals are now always enabled, so this flag has no effect.'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-npm-lazy-caching -d 'Enable unstable lazy caching of npm dependencies, downloading them only as needed (disabled: all npm packages in package.json are installed on startup; enabled: only npm packages that are actually referenced in an import are installed'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-otel -d 'Enable unstable OpenTelemetry features'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-process -d 'Enable unstable process APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-raw-imports -d 'Enable unstable \'bytes\' imports.'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-sloppy-imports -d 'Enable unstable resolving of specifiers by extension probing, .js to .ts, and directory probing'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-subdomain-wildcards -d 'Enable subdomain wildcards support for the `--allow-net` flag'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-temporal -d 'Enable unstable Temporal API'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-tsgo -d 'Enable unstable TypeScript Go integration'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-unsafe-proto -d 'Enable unsafe __proto__ support. This is a security risk.'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-vsock -d 'Enable unstable VSOCK APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-webgpu -d 'Enable unstable WebGPU APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -l unstable-worker-options -d 'Enable unstable Web Worker APIs'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "run"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "watch"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "serve"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "add"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "audit"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "remove"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "bench"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "bundle"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "cache"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "check"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "clean"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "compile"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "create"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "desktop"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "completions"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "coverage"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "doc"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "deploy"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "sandbox"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "eval"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "fmt"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "init"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "info"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "list"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "install"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "ci"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "json_reference"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "jupyter"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "approve-scripts"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "uninstall"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "outdated"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "link"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "unlink"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "lsp"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "lint"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "publish"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "pack"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "repl"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "task"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "test"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "transpile"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "types"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "update"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "upgrade"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "bump-version"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "vendor"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "why"
complete -c deno -n "__fish_deno_using_subcommand help; and not __fish_seen_subcommand_from run watch serve add audit remove bench bundle cache check clean compile create desktop completions coverage doc deploy sandbox eval fmt init info list install ci json_reference jupyter approve-scripts uninstall outdated link unlink lsp lint publish pack repl task test transpile types update upgrade bump-version vendor why x" -f -a "x"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from run" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from run" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from run" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from watch" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from watch" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from watch" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from serve" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from serve" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from serve" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from add" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from add" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from audit" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from audit" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from audit" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from remove" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from remove" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bench" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bench" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bench" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bundle" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bundle" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bundle" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from cache" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from cache" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from cache" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from check" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from check" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from check" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from clean" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from clean" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from clean" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from compile" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from compile" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from compile" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from create" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from create" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from create" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from desktop" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from desktop" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from desktop" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from completions" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from completions" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from completions" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from coverage" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from coverage" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from coverage" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from doc" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from doc" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from doc" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from deploy" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from deploy" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from deploy" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from sandbox" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from sandbox" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from sandbox" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from eval" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from eval" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from eval" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from fmt" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from fmt" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from fmt" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from init" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from init" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from init" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from info" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from info" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from info" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from list" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from list" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from install" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from install" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from ci" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from ci" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from ci" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from json_reference" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from json_reference" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from json_reference" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from jupyter" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from jupyter" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from jupyter" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from approve-scripts" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from approve-scripts" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from approve-scripts" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from uninstall" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from uninstall" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from outdated" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from outdated" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from outdated" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from link" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from link" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from link" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from unlink" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from unlink" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from unlink" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lsp" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lsp" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lsp" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lint" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lint" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from lint" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from publish" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from publish" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from publish" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from pack" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from pack" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from pack" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from repl" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from repl" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from repl" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from task" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from task" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from task" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from test" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from test" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from test" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from transpile" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from transpile" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from transpile" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from types" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from types" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from types" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from update" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from update" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from upgrade" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from upgrade" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bump-version" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bump-version" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from bump-version" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from vendor" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from vendor" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from vendor" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from why" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from why" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from why" -s q -l quiet -d 'Suppress diagnostic output'
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from x" -s h -l help -r -f -a "unstable\t''
full\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from x" -s L -l log-level -d 'Set log level' -r -f -a "trace\t''
debug\t''
info\t''"
complete -c deno -n "__fish_deno_using_subcommand help; and __fish_seen_subcommand_from x" -s q -l quiet -d 'Suppress diagnostic output'
