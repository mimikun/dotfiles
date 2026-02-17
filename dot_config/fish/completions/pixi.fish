# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pixi_global_optspecs
	string join \n h/help v/verbose q/quiet color= no-progress list V/version
end

function __fish_pixi_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pixi_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pixi_using_subcommand
	set -l cmd (__fish_pixi_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pixi -n "__fish_pixi_needs_command" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_needs_command" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_needs_command" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_needs_command" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_needs_command" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_needs_command" -l list -d 'List all installed commands (built-in and extensions)'
complete -c pixi -n "__fish_pixi_needs_command" -s V -l version -d 'Print version'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "add" -d 'Adds dependencies to the workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "a" -d 'Adds dependencies to the workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "auth" -d 'Login to prefix.dev or anaconda.org servers to access private channels'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "build" -d 'Build a conda package from a Pixi package.'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "clean" -d 'Cleanup the environments'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "completion" -d 'Generates a completion script for a shell'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "config" -d 'Configuration management'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "exec" -d 'Run a command and install it in a temporary environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "x" -d 'Run a command and install it in a temporary environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "global" -d 'Subcommand for global package management actions'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "g" -d 'Subcommand for global package management actions'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "info" -d 'Information about the system, workspace and environments for the current machine'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "init" -d 'Creates a new workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "import" -d 'Imports a file into an environment in an existing workspace.'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "install" -d 'Install an environment, both updating the lockfile and installing the environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "i" -d 'Install an environment, both updating the lockfile and installing the environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "list" -d 'List the packages of the current workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "ls" -d 'List the packages of the current workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "lock" -d 'Solve environment and update the lock file without installing the environments'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "reinstall" -d 'Re-install an environment, both updating the lockfile and re-installing the environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "remove" -d 'Removes dependencies from the workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "rm" -d 'Removes dependencies from the workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "run" -d 'Runs task in the pixi environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "r" -d 'Runs task in the pixi environment'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "search" -d 'Search a conda package'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "self-update" -d 'Update pixi to the latest version or a specific version'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "shell" -d 'Start a shell in a pixi environment, run `exit` to leave the shell'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "s" -d 'Start a shell in a pixi environment, run `exit` to leave the shell'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "shell-hook" -d 'Print the pixi environment activation script'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "task" -d 'Interact with tasks in the workspace'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "tree" -d 'Show a tree of workspace dependencies'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "t" -d 'Show a tree of workspace dependencies'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "update" -d 'The `update` command checks if there are newer versions of the dependencies and updates the `pixi.lock` file and environments accordingly'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "upgrade" -d 'Checks if there are newer versions of the dependencies and upgrades them in the lockfile and manifest file'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "upload" -d 'Upload conda packages to various channels'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "workspace" -d 'Modify the workspace configuration file through the command line'
complete -c pixi -n "__fish_pixi_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand add" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand add" -s p -l platform -d 'The platform for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -s g -l git -d 'The git url to use when adding a git dependency' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -s s -l subdir -d 'The subdirectory of the git repository to use' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand add" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand add" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand add" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand add" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand add" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l editable -d 'Whether the pypi requirement should be editable'
complete -c pixi -n "__fish_pixi_using_subcommand add" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand add" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand add" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand a" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand a" -s p -l platform -d 'The platform for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -s g -l git -d 'The git url to use when adding a git dependency' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -s s -l subdir -d 'The subdirectory of the git repository to use' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand a" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand a" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand a" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand a" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand a" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l editable -d 'Whether the pypi requirement should be editable'
complete -c pixi -n "__fish_pixi_using_subcommand a" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand a" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand a" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "login" -d 'Store authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and not __fish_seen_subcommand_from login logout help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l token -d 'The token to use (for authentication with prefix.dev)' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l username -d 'The username to use (for basic HTTP authentication)' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l password -d 'The password to use (for basic HTTP authentication)' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l conda-token -d 'The token to use on anaconda.org / quetz authentication' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l s3-access-key-id -d 'The S3 access key ID' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l s3-secret-access-key -d 'The S3 secret access key' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l s3-session-token -d 'The S3 session token' -r
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from login" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from logout" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from logout" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from logout" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from logout" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from logout" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d 'Store authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand build" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand build" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand build" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand build" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand build" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand build" -s t -l target-platform -d 'The target platform to build for (defaults to the current platform)' -r
complete -c pixi -n "__fish_pixi_using_subcommand build" -l build-platform -d 'The build platform to use for building (defaults to the current platform)' -r
complete -c pixi -n "__fish_pixi_using_subcommand build" -s o -l output-dir -d 'The output directory to place the built artifacts' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand build" -s b -l build-dir -d 'The directory to use for incremental builds artifacts' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand build" -l path -d 'The path to a directory containing a package manifest, or to a specific manifest file' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand build" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand build" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand build" -s c -l clean -d 'Whether to clean the build directory before building'
complete -c pixi -n "__fish_pixi_using_subcommand build" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand build" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand build" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand build" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s e -l environment -d 'The environment directory to remove' -r
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l activation-cache -d 'Only remove the activation cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l build -d 'Only remove the pixi-build cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and not __fish_seen_subcommand_from cache help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l pypi -d 'Clean only the pypi related cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l conda -d 'Clean only the conda related cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l mapping -d 'Clean only the mapping cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l exec -d 'Clean only `exec` cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l repodata -d 'Clean only the repodata cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l build-backends -d 'Clean only the build backends environments cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l build -d 'Clean only the build related cache'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -s y -l yes -d 'Answer yes to all questions'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from cache" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from help" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c pixi -n "__fish_pixi_using_subcommand clean; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand completion" -s s -l shell -d 'The shell to generate a completion script for' -r -f -a "bash\t'Bourne Again SHell (bash)'
elvish\t'Elvish shell'
fish\t'Friendly Interactive SHell (fish)'
nushell\t'Nushell'
powershell\t'PowerShell'
zsh\t'Z SHell (zsh)'"
complete -c pixi -n "__fish_pixi_using_subcommand completion" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand completion" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand completion" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand completion" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand completion" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "edit" -d 'Edit the configuration file'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "list" -d 'List configuration values'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "ls" -d 'List configuration values'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "append" -d 'Append a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "set" -d 'Set a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "unset" -d 'Unset a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand config; and not __fish_seen_subcommand_from edit list ls prepend append set unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -l json -d 'Output in JSON format'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -l json -d 'Output in JSON format'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from prepend" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from append" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from set" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s l -l local -d 'Operation on project-local configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s g -l global -d 'Operation on global configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s s -l system -d 'Operation on system configuration'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the configuration file'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "list" -d 'List configuration values'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "append" -d 'Append a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Unset a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s s -l spec -d 'Matchspecs of package to install. If this is not provided, the package is guessed from the command' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s w -l with -d 'Matchspecs of package to install, while also guessing a package from the command' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s p -l platform -d 'The platform to create the environment for' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l list -d 'Before executing the command, list packages in the environment Specify `--list=some_regex` to filter the shown packages' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l force-reinstall -d 'If specified a new environment is always created even if one already exists'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l no-modify-ps1 -d 'Disable modification of the PS1 prompt to indicate the temporary environment'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand exec" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand x" -s s -l spec -d 'Matchspecs of package to install. If this is not provided, the package is guessed from the command' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -s w -l with -d 'Matchspecs of package to install, while also guessing a package from the command' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -s p -l platform -d 'The platform to create the environment for' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -l list -d 'Before executing the command, list packages in the environment Specify `--list=some_regex` to filter the shown packages' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand x" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand x" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand x" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand x" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand x" -l force-reinstall -d 'If specified a new environment is always created even if one already exists'
complete -c pixi -n "__fish_pixi_using_subcommand x" -l no-modify-ps1 -d 'Disable modification of the PS1 prompt to indicate the temporary environment'
complete -c pixi -n "__fish_pixi_using_subcommand x" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand x" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand x" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand x" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand x" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand x" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand x" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "a" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "edit" -d 'Edit the global manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "i" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "rm" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "list" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "ls" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "s" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "e" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "shortcut" -d 'Interact with the shortcuts on your machine'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "update" -d 'Updates environments in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "tree" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "t" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from edit" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s p -l platform -d 'The platform to install the packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l force-reinstall -d 'Specifies that the environment should be reinstalled'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l no-shortcuts -d 'Specifies that no shortcuts should be created for the installed packages'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s p -l platform -d 'The platform to install the packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l force-reinstall -d 'Specifies that the environment should be reinstalled'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l no-shortcuts -d 'Specifies that no shortcuts should be created for the installed packages'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -s e -l environment -d 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "size\t''
name\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -s e -l environment -d 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "size\t''
name\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from sync" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from expose" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from e" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -f -a "add" -d 'Add a shortcut from an environment to your machine.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -f -a "remove" -d 'Remove shortcuts from your machine'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from shortcut" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l platform -d 'The platform to install the package for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l platform -d 'The platform to install the package for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from upgrade-all" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -s e -l environment -d 'The environment to list packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -s i -l invert -d 'Invert tree and show what depends on a given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from tree" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -s e -l environment -d 'The environment to list packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -s i -l invert -d 'Invert tree and show what depends on a given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from t" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the global manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "shortcut" -d 'Interact with the shortcuts on your machine'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "update" -d 'Updates environments in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "tree" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand global; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "a" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "edit" -d 'Edit the global manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "i" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "rm" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "list" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "ls" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "s" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "e" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "shortcut" -d 'Interact with the shortcuts on your machine'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "update" -d 'Updates environments in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "tree" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "t" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and not __fish_seen_subcommand_from add a edit install i uninstall remove rm list ls sync s expose e shortcut update upgrade upgrade-all tree t help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -s e -l environment -d 'Specifies the environment that the dependencies need to be added to' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from edit" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from edit" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from edit" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from edit" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from edit" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s p -l platform -d 'The platform to install the packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l force-reinstall -d 'Specifies that the environment should be reinstalled'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l no-shortcuts -d 'Specifies that no shortcuts should be created for the installed packages'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l git -d 'The git url, e.g. `https://github.com/user/repo.git`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l subdir -d 'The subdirectory within the git repository' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l path -d 'The path to the local package' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s p -l platform -d 'The platform to install the packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s e -l environment -d 'Ensures that all packages will be installed in the same environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l expose -d 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l with -d 'Add additional dependencies to the environment. Their executables will not be exposed' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l force-reinstall -d 'Specifies that the environment should be reinstalled'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l no-shortcuts -d 'Specifies that no shortcuts should be created for the installed packages'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -s e -l environment -d 'Specifies the environment that the dependencies need to be removed from' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -s e -l environment -d 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "size\t''
name\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -s e -l environment -d 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l sort-by -d 'Sorting strategy for the package table of an environment' -r -f -a "size\t''
name\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from sync" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from expose" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "add" -d 'Add exposed binaries from an environment to your global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "remove" -d 'Remove exposed binaries from the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from e" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -f -a "add" -d 'Add a shortcut from an environment to your machine.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -f -a "remove" -d 'Remove shortcuts from your machine'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from shortcut" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l platform -d 'The platform to install the package for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l platform -d 'The platform to install the package for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from upgrade-all" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -s e -l environment -d 'The environment to list packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -s i -l invert -d 'Invert tree and show what depends on a given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from tree" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -s e -l environment -d 'The environment to list packages for' -r
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -s i -l invert -d 'Invert tree and show what depends on a given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from t" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "add" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit the global manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "shortcut" -d 'Interact with the shortcuts on your machine'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "update" -d 'Updates environments in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "tree" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand g; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand info" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand info" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand info" -l extended -d 'Show cache and environment size'
complete -c pixi -n "__fish_pixi_using_subcommand info" -l json -d 'Whether to show the output as JSON or not'
complete -c pixi -n "__fish_pixi_using_subcommand info" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand info" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand info" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand info" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand init" -s c -l channel -d 'Channel to use in the workspace' -r
complete -c pixi -n "__fish_pixi_using_subcommand init" -s p -l platform -d 'Platforms that the workspace supports' -r
complete -c pixi -n "__fish_pixi_using_subcommand init" -s i -l import -d 'Environment.yml file to bootstrap the workspace' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand init" -l format -d 'The manifest format to create' -r -f -a "pixi\t''
pyproject\t''
mojoproject\t''"
complete -c pixi -n "__fish_pixi_using_subcommand init" -s s -l scm -d 'Source Control Management used for this workspace' -r -f -a "github\t''
gitlab\t''
codeberg\t''"
complete -c pixi -n "__fish_pixi_using_subcommand init" -l conda-pypi-map -d 'Set a mapping between conda channels and pypi channels' -r
complete -c pixi -n "__fish_pixi_using_subcommand init" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand init" -l pyproject-toml -d 'Create a pyproject.toml manifest instead of a pixi.toml manifest'
complete -c pixi -n "__fish_pixi_using_subcommand init" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand init" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand init" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand init" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand import" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand import" -l format -d 'Which format to interpret the file as' -r -f -a "conda-env\t''
pypi-txt\t''"
complete -c pixi -n "__fish_pixi_using_subcommand import" -s p -l platform -d 'The platforms for the imported environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -s e -l environment -d 'A name for the created environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -s f -l feature -d 'A name for the created feature' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand import" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand import" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand import" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand import" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand import" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand import" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand import" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand import" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand import" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand import" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand import" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand install" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand install" -s e -l environment -d 'The environment to install' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand install" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand install" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand install" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l skip -d 'Skip installation of specific packages present in the lockfile. This uses a soft exclusion: the package will be skipped but its dependencies are installed' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l skip-with-deps -d 'Skip a package and its entire dependency subtree. This performs a hard exclusion: the package and its dependencies are not installed unless reachable from another non-skipped root' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l only -d 'Install and build only these package(s) and their dependencies. Can be passed multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand install" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand install" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand install" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand install" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand install" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand install" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand install" -s a -l all -d 'Install all environments'
complete -c pixi -n "__fish_pixi_using_subcommand install" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand install" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand install" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand install" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand i" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand i" -s e -l environment -d 'The environment to install' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand i" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand i" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand i" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l skip -d 'Skip installation of specific packages present in the lockfile. This uses a soft exclusion: the package will be skipped but its dependencies are installed' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l skip-with-deps -d 'Skip a package and its entire dependency subtree. This performs a hard exclusion: the package and its dependencies are not installed unless reachable from another non-skipped root' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l only -d 'Install and build only these package(s) and their dependencies. Can be passed multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand i" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand i" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand i" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand i" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand i" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand i" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand i" -s a -l all -d 'Install all environments'
complete -c pixi -n "__fish_pixi_using_subcommand i" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand i" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand i" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand i" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c pixi -n "__fish_pixi_using_subcommand list" -l sort-by -d 'Sorting strategy' -r -f -a "size\t''
name\t''
kind\t''"
complete -c pixi -n "__fish_pixi_using_subcommand list" -l fields -d 'Select which fields to display and in what order (comma-separated)' -r -f -a "arch\t''
build\t''
build-number\t''
constrains\t''
depends\t''
file-name\t''
is-editable\t''
kind\t''
license\t''
license-family\t''
md5\t''
name\t''
noarch\t''
platform\t''
requested-spec\t''
sha256\t''
size\t''
source\t''
subdir\t''
timestamp\t''
track-features\t''
url\t''
version\t''"
complete -c pixi -n "__fish_pixi_using_subcommand list" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand list" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand list" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand list" -l json -d 'Whether to output in json format'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand list" -s x -l explicit -d 'Only list packages that are explicitly defined in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand list" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand list" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand list" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l sort-by -d 'Sorting strategy' -r -f -a "size\t''
name\t''
kind\t''"
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l fields -d 'Select which fields to display and in what order (comma-separated)' -r -f -a "arch\t''
build\t''
build-number\t''
constrains\t''
depends\t''
file-name\t''
is-editable\t''
kind\t''
license\t''
license-family\t''
md5\t''
name\t''
noarch\t''
platform\t''
requested-spec\t''
sha256\t''
size\t''
source\t''
subdir\t''
timestamp\t''
track-features\t''
url\t''
version\t''"
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l json -d 'Whether to output in json format'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s x -l explicit -d 'Only list packages that are explicitly defined in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand lock" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand lock" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -l json -d 'Output the changes in JSON format'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -l check -d 'Check if any changes have been made to the lock file. If yes, exit with a non-zero code'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand lock" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s e -l environment -d 'The environment to install' -r
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s a -l all -d 'Install all environments'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand reinstall" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s p -l platform -d 'The platform for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s g -l git -d 'The git url to use when adding a git dependency' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s s -l subdir -d 'The subdirectory of the git repository to use' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s p -l platform -d 'The platform for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s f -l feature -d 'The feature for which the dependency should be modified' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s g -l git -d 'The git url to use when adding a git dependency' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l branch -d 'The git branch' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l tag -d 'The git tag' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l rev -d 'The git revision' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s s -l subdir -d 'The subdirectory of the git repository to use' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l host -d 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l build -d 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l pypi -d 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand run" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand run" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand run" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand run" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand run" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand run" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand run" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand run" -s e -l environment -d 'The environment to run the task in' -r
complete -c pixi -n "__fish_pixi_using_subcommand run" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand run" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l force-activate -d 'Do not use the environment activation cache. (default: true except in experimental mode)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l no-completions -d 'Do not source the autocompletion scripts from the environment'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l clean-env -d 'Use a clean environment to run the task'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l skip-deps -d 'Don\'t run the dependencies of the task (\'depends-on\' field in the task definition)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -s n -l dry-run -d 'Run the task in dry-run mode (only print the command that would run)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l help
complete -c pixi -n "__fish_pixi_using_subcommand run" -s h
complete -c pixi -n "__fish_pixi_using_subcommand run" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand run" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand r" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand r" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand r" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand r" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand r" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand r" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand r" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand r" -s e -l environment -d 'The environment to run the task in' -r
complete -c pixi -n "__fish_pixi_using_subcommand r" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand r" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l force-activate -d 'Do not use the environment activation cache. (default: true except in experimental mode)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l no-completions -d 'Do not source the autocompletion scripts from the environment'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l clean-env -d 'Use a clean environment to run the task'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l skip-deps -d 'Don\'t run the dependencies of the task (\'depends-on\' field in the task definition)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -s n -l dry-run -d 'Run the task in dry-run mode (only print the command that would run)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l help
complete -c pixi -n "__fish_pixi_using_subcommand r" -s h
complete -c pixi -n "__fish_pixi_using_subcommand r" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand r" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand search" -s c -l channel -d 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times' -r
complete -c pixi -n "__fish_pixi_using_subcommand search" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand search" -s p -l platform -d 'The platform to search for, defaults to current platform' -r
complete -c pixi -n "__fish_pixi_using_subcommand search" -s l -l limit -d 'Limit the number of search results' -r
complete -c pixi -n "__fish_pixi_using_subcommand search" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand search" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand search" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand search" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand search" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l version -d 'The desired version (to downgrade or upgrade to)' -r
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l dry-run -d 'Only show release notes, do not modify the binary'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l force -d 'Force download the desired version when not exactly same with the current. If no desired version, always replace with the latest version'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l no-release-note -d 'Skip printing the release notes'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand self-update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell" -s e -l environment -d 'The environment to activate in the shell' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "true\t''
false\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l force-activate -d 'Do not use the environment activation cache. (default: true except in experimental mode)'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l no-completions -d 'Do not source the autocompletion scripts from the environment'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand shell" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand s" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand s" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand s" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand s" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand s" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand s" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand s" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand s" -s e -l environment -d 'The environment to activate in the shell' -r
complete -c pixi -n "__fish_pixi_using_subcommand s" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "true\t''
false\t''"
complete -c pixi -n "__fish_pixi_using_subcommand s" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand s" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l force-activate -d 'Do not use the environment activation cache. (default: true except in experimental mode)'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l no-completions -d 'Do not source the autocompletion scripts from the environment'
complete -c pixi -n "__fish_pixi_using_subcommand s" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand s" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand s" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand s" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s s -l shell -d 'Sets the shell, options: [`bash`,  `zsh`,  `xonsh`,  `cmd`, `powershell`,  `fish`,  `nushell`]' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s e -l environment -d 'The environment to activate in the script' -r
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l change-ps1 -d 'Do not change the PS1 variable when starting a prompt' -r -f -a "true\t''
false\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l as-is -d 'Shorthand for the combination of --no-install and --frozen'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l force-activate -d 'Do not use the environment activation cache. (default: true except in experimental mode)'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l no-completions -d 'Do not source the autocompletion scripts from the environment'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l json -d 'Emit the environment variables set by running the activation as JSON'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand shell-hook" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "add" -d 'Add a command to the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "a" -d 'Add a command to the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "remove" -d 'Remove a command from the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "rm" -d 'Remove a command from the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "alias" -d 'Alias another specific command'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "list" -d 'List all tasks in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "ls" -d 'List all tasks in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and not __fish_seen_subcommand_from add a remove rm alias list ls help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l depends-on -d 'Depends on these other commands' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s p -l platform -d 'The platform for which the task should be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s f -l feature -d 'The feature for which the task should be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l cwd -d 'The working directory relative to the root of the workspace' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l env -d 'The environment variable to set, use --env key=value multiple times for more than one variable' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l default-environment -d 'Add a default environment for the task' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l description -d 'A description of the task to be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l arg -d 'The arguments to pass to the task' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l clean-env -d 'Isolate the task from the shell environment, and only use the pixi environment to run the task'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from add" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l depends-on -d 'Depends on these other commands' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s p -l platform -d 'The platform for which the task should be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s f -l feature -d 'The feature for which the task should be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l cwd -d 'The working directory relative to the root of the workspace' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l env -d 'The environment variable to set, use --env key=value multiple times for more than one variable' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l default-environment -d 'Add a default environment for the task' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l description -d 'A description of the task to be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l arg -d 'The arguments to pass to the task' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l clean-env -d 'Isolate the task from the shell environment, and only use the pixi environment to run the task'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from a" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s p -l platform -d 'The platform for which the task should be removed' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s f -l feature -d 'The feature for which the task should be removed' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from remove" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s p -l platform -d 'The platform for which the task should be removed' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s f -l feature -d 'The feature for which the task should be removed' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from rm" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -s p -l platform -d 'The platform for which the alias should be added' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -l description -d 'The description of the alias task' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from alias" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s e -l environment -d 'The environment the list should be generated for. If not specified, the default environment is used' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s s -l summary -d 'Tasks available for this machine per environment'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -l machine-readable -d 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -l json -d 'List as json instead of a tree If not specified, the default environment is used'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s e -l environment -d 'The environment the list should be generated for. If not specified, the default environment is used' -r
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s s -l summary -d 'Tasks available for this machine per environment'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -l machine-readable -d 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -l json -d 'List as json instead of a tree If not specified, the default environment is used'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from ls" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a command to the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a command from the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "alias" -d 'Alias another specific command'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all tasks in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s p -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s i -l invert -d 'Invert tree and show what depends on given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand tree" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand t" -s p -l platform -d 'The platform to list packages for. Defaults to the current platform' -r
complete -c pixi -n "__fish_pixi_using_subcommand t" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand t" -s e -l environment -d 'The environment to list packages for. Defaults to the default environment' -r
complete -c pixi -n "__fish_pixi_using_subcommand t" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand t" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand t" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand t" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand t" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand t" -s i -l invert -d 'Invert tree and show what depends on given package in the regex argument'
complete -c pixi -n "__fish_pixi_using_subcommand t" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand t" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand t" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand t" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand update" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand update" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand update" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand update" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand update" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand update" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand update" -s e -l environment -d 'The environments to update. If none is specified, all environments are updated' -r
complete -c pixi -n "__fish_pixi_using_subcommand update" -s p -l platform -d 'The platforms to update. If none is specified, all platforms are updated' -r
complete -c pixi -n "__fish_pixi_using_subcommand update" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand update" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l no-install -d 'Don\'t install the (solve) environments needed for pypi-dependencies solving'
complete -c pixi -n "__fish_pixi_using_subcommand update" -s n -l dry-run -d 'Don\'t actually write the lockfile or update any environment'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l json -d 'Output the changes in JSON format'
complete -c pixi -n "__fish_pixi_using_subcommand update" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand update" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand update" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand update" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l auth-file -d 'Path to the file containing the authentication token' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l concurrent-downloads -d 'Max concurrent network requests, default is `50`' -r
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l concurrent-solves -d 'Max concurrent solves, default is the number of CPUs' -r
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l pinning-strategy -d 'Set pinning strategy' -r -f -a "semver\t'Default semver strategy e.g. `1.2.3` becomes `>=1.2.3, <2` but `0.1.0` becomes `>=0.1.0, <0.2`'
minor\t'Pin the latest minor e.g. `1.2.3` becomes `>=1.2.3, <1.3`'
major\t'Pin the latest major e.g. `1.2.3` becomes `>=1.2.3, <2`'
latest-up\t'Pin to the latest version or higher. e.g. `1.2.3` becomes `>=1.2.3`'
exact-version\t'Pin the version chosen by the solver. e.g. `1.2.3` becomes `==1.2.3`'
no-pin\t'No pinning, keep the requirement empty. e.g. `1.2.3` becomes `*`'"
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l pypi-keyring-provider -d 'Specifies whether to use the keyring to look up credentials for PyPI' -r -f -a "disabled\t''
subprocess\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l tls-root-certs -d 'Which TLS root certificates to use: \'webpki\' (bundled Mozilla roots), \'native\' (system store), or \'all\' (both)' -r
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s f -l feature -d 'The feature to update' -r
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l exclude -d 'The packages which should be excluded' -r
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l no-install -d 'Don\'t modify the environment, only modify the lock-file'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l no-lockfile-update -d 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l frozen -d 'Install the environment as defined in the lockfile, doesn\'t update lockfile if it isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l locked -d 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn\'t up-to-date with the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l run-post-link-scripts -d 'Run post-link scripts (insecure)'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l tls-no-verify -d 'Do not verify the TLS certificate of the server'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l use-environment-activation-cache -d 'Use environment activation cache (experimental)'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l json -d 'Output the changes in JSON format'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s n -l dry-run -d 'Only show the changes that would be made, without actually updating the manifest, lock file, or environment'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upgrade" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -l allow-insecure-host -d 'List of hosts for which SSL certificate verification should be skipped' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -l auth-file -d 'Path to an auth-file to read authentication information from' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "quetz" -d 'Upload to a Quetz server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "artifactory" -d 'Options for uploading to a Artifactory channel. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "prefix" -d 'Options for uploading to a prefix.dev server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "anaconda" -d 'Options for uploading to a Anaconda.org server'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "s3" -d 'Options for uploading to S3'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "conda-forge" -d 'Options for uploading to conda-forge'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and not __fish_seen_subcommand_from quetz artifactory prefix anaconda s3 conda-forge help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s u -l url -d 'The URL to your Quetz server' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s c -l channel -d 'The URL to your channel' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s a -l api-key -d 'The Quetz API key, if none is provided, the token is read from the keychain / auth-file' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from quetz" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s u -l url -d 'The URL to your Artifactory server' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s c -l channel -d 'The URL to your channel' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -l username -d 'Your Artifactory username' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -l password -d 'Your Artifactory password' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s t -l token -d 'Your Artifactory token' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from artifactory" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s u -l url -d 'The URL to the prefix.dev server (only necessary for self-hosted instances)' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s c -l channel -d 'The channel to upload the package to' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s a -l api-key -d 'The prefix.dev API key, if none is provided, the token is read from the keychain / auth-file' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l attestation -d 'Upload an attestation file alongside the package. Note: if you add an attestation, you can _only_ upload a single package. Mutually exclusive with --generate-attestation' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l generate-attestation -d 'Automatically generate attestation using cosign in CI. Mutually exclusive with --attestation'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l store-github-attestation -d 'Also store the generated attestation to GitHub\'s attestation API. Requires `GITHUB_TOKEN` environment variable and only works in GitHub Actions. The attestation will be associated with the current repository'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s s -l skip-existing -d 'Skip upload if package already exists'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l force -d 'Force overwrite existing packages'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from prefix" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s o -l owner -d 'The owner of the distribution (e.g. conda-forge or your username)' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s c -l channel -d 'The channel / label to upload the package to (e.g. main / rc)' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s a -l api-key -d 'The Anaconda API key, if none is provided, the token is read from the keychain / auth-file' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s u -l url -d 'The URL to the Anaconda server' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s f -l force -d 'Replace files on conflict'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from anaconda" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -s c -l channel -d 'The channel URL in the S3 bucket to upload the package to, e.g., `s3://my-bucket/my-channel`' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l endpoint-url -d 'The endpoint URL of the S3 backend' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l region -d 'The region of the S3 backend' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l access-key-id -d 'The access key ID for the S3 bucket' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l secret-access-key -d 'The secret access key for the S3 bucket' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l session-token -d 'The session token for the S3 bucket' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l addressing-style -d 'How to address the bucket' -r -f -a "virtual-host\t''
path\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l force-path-style -d '[deprecated] Whether to use path-style S3 URLs' -r -f -a "true\t''
false\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l force -d 'Replace files if it already exists'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from s3" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l staging-token -d 'The Anaconda API key' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l feedstock -d 'The feedstock name' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l feedstock-token -d 'The feedstock token' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l staging-channel -d 'The staging channel name' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l anaconda-url -d 'The Anaconda Server URL' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l validation-endpoint -d 'The validation endpoint url' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l provider -d 'The CI provider' -r
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l dry-run -d 'Dry run, don\'t actually upload anything'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from conda-forge" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "quetz" -d 'Upload to a Quetz server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "artifactory" -d 'Options for uploading to a Artifactory channel. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "prefix" -d 'Options for uploading to a prefix.dev server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "anaconda" -d 'Options for uploading to a Anaconda.org server'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "s3" -d 'Options for uploading to S3'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "conda-forge" -d 'Options for uploading to conda-forge'
complete -c pixi -n "__fish_pixi_using_subcommand upload; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "channel" -d 'Commands to manage workspace channels'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "description" -d 'Commands to manage workspace description'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "platform" -d 'Commands to manage workspace platforms'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "version" -d 'Commands to manage workspace version'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "environment" -d 'Commands to manage workspace environments'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "feature" -d 'Commands to manage workspace features'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "export" -d 'Commands to export workspaces to other formats'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "name" -d 'Commands to manage workspace name'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "system-requirements" -d 'Commands to manage workspace system requirements'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "requires-pixi" -d 'Commands to manage the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and not __fish_seen_subcommand_from channel description platform version environment feature export name system-requirements requires-pixi help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "add" -d 'Adds a channel to the manifest and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "a" -d 'Adds a channel to the manifest and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "list" -d 'List the channels in the manifest'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "ls" -d 'List the channels in the manifest'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "remove" -d 'Remove channel(s) from the manifest and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "rm" -d 'Remove channel(s) from the manifest and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from channel" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -f -a "get" -d 'Get the workspace description'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -f -a "set" -d 'Set the workspace description'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from description" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "add" -d 'Adds a platform(s) to the workspace file and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "a" -d 'Adds a platform(s) to the workspace file and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "list" -d 'List the platforms in the workspace file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "ls" -d 'List the platforms in the workspace file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "remove" -d 'Remove platform(s) from the workspace file and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "rm" -d 'Remove platform(s) from the workspace file and updates the lockfile'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from platform" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "get" -d 'Get the workspace version'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "set" -d 'Set the workspace version'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "major" -d 'Bump the workspace version to MAJOR'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "minor" -d 'Bump the workspace version to MINOR'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "patch" -d 'Bump the workspace version to PATCH'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from version" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "add" -d 'Adds an environment to the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "a" -d 'Adds an environment to the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "list" -d 'List the environments in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "ls" -d 'List the environments in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "remove" -d 'Remove an environment from the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "rm" -d 'Remove an environment from the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from environment" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -f -a "list" -d 'List the features in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -f -a "ls" -d 'List the features in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -f -a "remove" -d 'Remove a feature from the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -f -a "rm" -d 'Remove a feature from the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from feature" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -f -a "conda-explicit-spec" -d 'Export workspace environment to a conda explicit specification file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -f -a "ces" -d 'Export workspace environment to a conda explicit specification file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -f -a "conda-environment" -d 'Export workspace environment to a conda environment.yaml file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from export" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -f -a "get" -d 'Get the workspace name'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -f -a "set" -d 'Set the workspace name'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from name" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -f -a "add" -d 'Adds an environment to the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -f -a "a" -d 'Adds an environment to the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -f -a "list" -d 'List the environments in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -f -a "ls" -d 'List the environments in the manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from system-requirements" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -s m -l manifest-path -d 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory' -r -F
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -l color -d 'Whether the log needs to be colored' -r -f -a "always\t''
never\t''
auto\t''"
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -s h -l help -d 'Display help information'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -s v -l verbose -d 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -s q -l quiet -d 'Decrease logging verbosity (quiet mode)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -l no-progress -d 'Hide all progress bars, always turned on if stderr is not a terminal'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -f -a "get" -d 'Get the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -f -a "set" -d 'Set the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -f -a "unset" -d 'Remove the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -f -a "verify" -d 'Verify the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from requires-pixi" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "channel" -d 'Commands to manage workspace channels'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "description" -d 'Commands to manage workspace description'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "platform" -d 'Commands to manage workspace platforms'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "version" -d 'Commands to manage workspace version'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "environment" -d 'Commands to manage workspace environments'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "feature" -d 'Commands to manage workspace features'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "export" -d 'Commands to export workspaces to other formats'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "name" -d 'Commands to manage workspace name'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "system-requirements" -d 'Commands to manage workspace system requirements'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "requires-pixi" -d 'Commands to manage the pixi minimum version requirement'
complete -c pixi -n "__fish_pixi_using_subcommand workspace; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "add" -d 'Adds dependencies to the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "auth" -d 'Login to prefix.dev or anaconda.org servers to access private channels'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "build" -d 'Build a conda package from a Pixi package.'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "clean" -d 'Cleanup the environments'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "completion" -d 'Generates a completion script for a shell'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "config" -d 'Configuration management'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "exec" -d 'Run a command and install it in a temporary environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "global" -d 'Subcommand for global package management actions'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "info" -d 'Information about the system, workspace and environments for the current machine'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "init" -d 'Creates a new workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "import" -d 'Imports a file into an environment in an existing workspace.'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "install" -d 'Install an environment, both updating the lockfile and installing the environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "list" -d 'List the packages of the current workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "lock" -d 'Solve environment and update the lock file without installing the environments'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "reinstall" -d 'Re-install an environment, both updating the lockfile and re-installing the environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "remove" -d 'Removes dependencies from the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "run" -d 'Runs task in the pixi environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "search" -d 'Search a conda package'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "self-update" -d 'Update pixi to the latest version or a specific version'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "shell" -d 'Start a shell in a pixi environment, run `exit` to leave the shell'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "shell-hook" -d 'Print the pixi environment activation script'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "task" -d 'Interact with tasks in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "tree" -d 'Show a tree of workspace dependencies'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "update" -d 'The `update` command checks if there are newer versions of the dependencies and updates the `pixi.lock` file and environments accordingly'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "upgrade" -d 'Checks if there are newer versions of the dependencies and upgrades them in the lockfile and manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "upload" -d 'Upload conda packages to various channels'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "workspace" -d 'Modify the workspace configuration file through the command line'
complete -c pixi -n "__fish_pixi_using_subcommand help; and not __fish_seen_subcommand_from add auth build clean completion config exec global info init import install list lock reinstall remove run search self-update shell shell-hook task tree update upgrade upload workspace help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d 'Store authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "logout" -d 'Remove authentication information for a given host'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from clean" -f -a "cache" -d 'Clean the cache of your system which are touched by pixi'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "edit" -d 'Edit the configuration file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "list" -d 'List configuration values'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "prepend" -d 'Prepend a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "append" -d 'Append a value to a list configuration key'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Set a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "unset" -d 'Unset a configuration value'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "add" -d 'Adds dependencies to an environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "edit" -d 'Edit the global manifest file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "install" -d 'Installs the defined packages in a globally accessible location and exposes their command line applications.'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "uninstall" -d 'Uninstalls environments from the global environment.'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "remove" -d 'Removes dependencies from an environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "list" -d 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "sync" -d 'Sync global manifest with installed environments'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "expose" -d 'Interact with the exposure of binaries in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "shortcut" -d 'Interact with the shortcuts on your machine'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "update" -d 'Updates environments in the global environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "upgrade" -d 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "upgrade-all" -d 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from global" -f -a "tree" -d 'Show a tree of dependencies for a specific global environment'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "add" -d 'Add a command to the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "remove" -d 'Remove a command from the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "alias" -d 'Alias another specific command'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "list" -d 'List all tasks in the workspace'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "quetz" -d 'Upload to a Quetz server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "artifactory" -d 'Options for uploading to a Artifactory channel. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "prefix" -d 'Options for uploading to a prefix.dev server. Authentication is used from the keychain / auth-file'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "anaconda" -d 'Options for uploading to a Anaconda.org server'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "s3" -d 'Options for uploading to S3'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from upload" -f -a "conda-forge" -d 'Options for uploading to conda-forge'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "channel" -d 'Commands to manage workspace channels'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "description" -d 'Commands to manage workspace description'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "platform" -d 'Commands to manage workspace platforms'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "version" -d 'Commands to manage workspace version'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "environment" -d 'Commands to manage workspace environments'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "feature" -d 'Commands to manage workspace features'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "export" -d 'Commands to export workspaces to other formats'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "name" -d 'Commands to manage workspace name'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "system-requirements" -d 'Commands to manage workspace system requirements'
complete -c pixi -n "__fish_pixi_using_subcommand help; and __fish_seen_subcommand_from workspace" -f -a "requires-pixi" -d 'Commands to manage the pixi minimum version requirement'
complete -c pixi -n "__fish_seen_subcommand_from run; or __fish_seen_subcommand_from r" -f -a "(string split ' ' (pixi task list --machine-readable  2> /dev/null))"
