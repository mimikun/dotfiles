# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_uv_global_optspecs
	string join \n n/no-cache cache-dir= python-preference= allow-python-downloads no-python-downloads python-fetch= q/quiet v/verbose no-color color= native-tls no-native-tls offline no-offline preview no-preview isolated show-settings no-progress directory= config-file= no-config h/help V/version
end

function __fish_uv_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_uv_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_uv_using_subcommand
	set -l cmd (__fish_uv_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c uv -n "__fish_uv_needs_command" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_needs_command" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_needs_command" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_needs_command" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_needs_command" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_needs_command" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_needs_command" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_needs_command" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_needs_command" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_needs_command" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_needs_command" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_needs_command" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_needs_command" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_needs_command" -l no-native-tls
complete -c uv -n "__fish_uv_needs_command" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_needs_command" -l no-offline
complete -c uv -n "__fish_uv_needs_command" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_needs_command" -l no-preview
complete -c uv -n "__fish_uv_needs_command" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_needs_command" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_needs_command" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_needs_command" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_needs_command" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_needs_command" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_needs_command" -f -a "run" -d 'Run a command or script'
complete -c uv -n "__fish_uv_needs_command" -f -a "init" -d 'Create a new project'
complete -c uv -n "__fish_uv_needs_command" -f -a "add" -d 'Add dependencies to the project'
complete -c uv -n "__fish_uv_needs_command" -f -a "remove" -d 'Remove dependencies from the project'
complete -c uv -n "__fish_uv_needs_command" -f -a "sync" -d 'Update the project\'s environment'
complete -c uv -n "__fish_uv_needs_command" -f -a "lock" -d 'Update the project\'s lockfile'
complete -c uv -n "__fish_uv_needs_command" -f -a "tree" -d 'Display the project\'s dependency tree'
complete -c uv -n "__fish_uv_needs_command" -f -a "tool" -d 'Run and install commands provided by Python packages'
complete -c uv -n "__fish_uv_needs_command" -f -a "python" -d 'Manage Python versions and installations'
complete -c uv -n "__fish_uv_needs_command" -f -a "pip" -d 'Manage Python packages with a pip-compatible interface'
complete -c uv -n "__fish_uv_needs_command" -f -a "venv" -d 'Create a virtual environment'
complete -c uv -n "__fish_uv_needs_command" -f -a "cache" -d 'Manage uv\'s cache'
complete -c uv -n "__fish_uv_needs_command" -f -a "self" -d 'Manage the uv executable'
complete -c uv -n "__fish_uv_needs_command" -f -a "clean" -d 'Clear the cache, removing all entries or those linked to specific packages'
complete -c uv -n "__fish_uv_needs_command" -f -a "version" -d 'Display uv\'s version'
complete -c uv -n "__fish_uv_needs_command" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c uv -n "__fish_uv_needs_command" -f -a "help" -d 'Display documentation for a command'
complete -c uv -n "__fish_uv_using_subcommand run" -l extra -d 'Include optional dependencies from the extra group name' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l with -d 'Run with the given packages installed' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand run" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l package -d 'Run the command in a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s p -l python -d 'The Python interpreter to use for the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand run" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand run" -l dev -d 'Include development dependencies'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-dev -d 'Omit development dependencies'
complete -c uv -n "__fish_uv_using_subcommand run" -l isolated -d 'Run the command in an isolated virtual environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand run" -l frozen -d 'Run without updating the `uv.lock` file'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand run" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand run" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand run" -l pre
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand run" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand run" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand run" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand run" -l build
complete -c uv -n "__fish_uv_using_subcommand run" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand run" -l binary
complete -c uv -n "__fish_uv_using_subcommand run" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand run" -l no-project -d 'Avoid discovering the project or workspace'
complete -c uv -n "__fish_uv_using_subcommand run" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand run" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand run" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand run" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand run" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand run" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand run" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand run" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand run" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand run" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand run" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand init" -l name -d 'The name of the project' -r
complete -c uv -n "__fish_uv_using_subcommand init" -s p -l python -d 'The Python interpreter to use to determine the minimum supported Python version.' -r
complete -c uv -n "__fish_uv_using_subcommand init" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand init" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand init" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand init" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l virtual -d 'Create a virtual workspace instead of a project'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-readme -d 'Do not create a `README.md` file'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-workspace -d 'Avoid discovering a workspace'
complete -c uv -n "__fish_uv_using_subcommand init" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand init" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand init" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand init" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand init" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand init" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand init" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand init" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand init" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand init" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand init" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand add" -s r -l requirements -d 'Add all packages listed in the given `requirements.txt` files' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l optional -d 'Add the requirements to the specified optional dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l rev -d 'Commit to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l tag -d 'Tag to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l branch -d 'Branch to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l extra -d 'Extras to enable for the dependency' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand add" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l package -d 'Add the dependency to a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l script -d 'Add the dependency to the specified Python script, rather than to a project' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -s p -l python -d 'The Python interpreter to use for resolving and syncing.' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand add" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l dev -d 'Add the requirements as development dependencies'
complete -c uv -n "__fish_uv_using_subcommand add" -l editable
complete -c uv -n "__fish_uv_using_subcommand add" -l no-editable -d 'Don\'t add the requirements as editables'
complete -c uv -n "__fish_uv_using_subcommand add" -l raw-sources -d 'Add source requirements to `project.dependencies`, rather than `tool.uv.sources`'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-sync -d 'Avoid syncing the virtual environment after re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand add" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand add" -l frozen -d 'Add dependencies without re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand add" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand add" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand add" -l pre
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand add" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand add" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand add" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand add" -l build
complete -c uv -n "__fish_uv_using_subcommand add" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand add" -l binary
complete -c uv -n "__fish_uv_using_subcommand add" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand add" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand add" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand add" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand add" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand add" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand add" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand add" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand add" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand add" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand add" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand add" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand remove" -l optional -d 'Remove the packages from the specified optional dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l package -d 'Remove the dependencies from a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l script -d 'Remove the dependency from the specified Python script, rather than from a project' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -s p -l python -d 'The Python interpreter to use for resolving and syncing.' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand remove" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l dev -d 'Remove the packages from the development dependencies'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-sync -d 'Avoid syncing the virtual environment after re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand remove" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand remove" -l frozen -d 'Remove dependencies without re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand remove" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand remove" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand remove" -l pre
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand remove" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand remove" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand remove" -l build
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand remove" -l binary
complete -c uv -n "__fish_uv_using_subcommand remove" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand remove" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand remove" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand remove" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand remove" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand remove" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand remove" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand remove" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand remove" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand remove" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand remove" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand remove" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand sync" -l extra -d 'Include optional dependencies from the extra group name' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l package -d 'Sync for a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s p -l python -d 'The Python interpreter to use for the project environment.' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand sync" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand sync" -l dev -d 'Include development dependencies'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-dev -d 'Omit development dependencies'
complete -c uv -n "__fish_uv_using_subcommand sync" -l inexact -d 'Do not remove extraneous packages present in the environment'
complete -c uv -n "__fish_uv_using_subcommand sync" -l exact -d 'Perform an exact sync, removing extraneous packages'
complete -c uv -n "__fish_uv_using_subcommand sync" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand sync" -l frozen -d 'Sync without updating the `uv.lock` file'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand sync" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand sync" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand sync" -l pre
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand sync" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand sync" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand sync" -l build
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand sync" -l binary
complete -c uv -n "__fish_uv_using_subcommand sync" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand sync" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand sync" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand sync" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand sync" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand sync" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand sync" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand sync" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand sync" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand sync" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand sync" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand sync" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand lock" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s p -l python -d 'The Python interpreter to use during resolution.' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand lock" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand lock" -l frozen -d 'Assert that a `uv.lock` exists, without updating it'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand lock" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand lock" -l pre
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l build
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand lock" -l binary
complete -c uv -n "__fish_uv_using_subcommand lock" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand lock" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand lock" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand lock" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand lock" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand lock" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand lock" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand lock" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand lock" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand lock" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand lock" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand lock" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tree" -s d -l depth -d 'Maximum display depth of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l prune -d 'Prune the given package from the display of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l package -d 'Display only the specified packages' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-version -d 'The Python version to use when filtering the tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-platform -d 'The platform to use when filtering the tree' -r -f -a "{windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows',linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux',macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS',x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target',i686-pc-windows-msvc\t'A 32-bit x86 Windows target',x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`',aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices',x86_64-apple-darwin\t'An x86 macOS target',aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`',aarch64-unknown-linux-musl\t'An ARM64 Linux target',x86_64-unknown-linux-musl\t'An `x86_64` Linux target',x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform',x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform',x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform',aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform',aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform',aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -s p -l python -d 'The Python interpreter to use for locking and filtering.' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tree" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l universal -d 'Show a platform-independent dependency tree'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-dedupe -d 'Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated'
complete -c uv -n "__fish_uv_using_subcommand tree" -l invert -d 'Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package'
complete -c uv -n "__fish_uv_using_subcommand tree" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand tree" -l frozen -d 'Display the requirements without locking the project'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tree" -l build
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tree" -l binary
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tree" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand tree" -l pre
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tree" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand tree" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tree" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tree" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tree" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tree" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tree" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tree" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tree" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tree" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tree" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tree" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "run" -d 'Run a command provided by a Python package'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "uvx" -d 'Run a command provided by a Python package.'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "install" -d 'Install commands provided by a Python package'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "upgrade" -d 'Upgrade installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "list" -d 'List installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "uninstall" -d 'Uninstall a tool'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "update-shell" -d 'Ensure that the tool executable directory is on the `PATH`'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -f -a "dir" -d 'Show the path to the uv tools directory'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l from -d 'Use the given package to provide the command' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l with -d 'Run with the given packages installed' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s p -l python -d 'The Python interpreter to use to build the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l isolated -d 'Run the tool in an isolated virtual environment, ignoring any already-installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l pre
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l from -d 'Use the given package to provide the command' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l with -d 'Run with the given packages installed' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s p -l python -d 'The Python interpreter to use to build the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l isolated -d 'Run the tool in an isolated virtual environment, ignoring any already-installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l pre
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l from -d 'The package to install commands from' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l with -d 'Include the following extra requirements' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l with-requirements -d 'Run all requirements listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s p -l python -d 'The Python interpreter to use to build the tool environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s e -l editable
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l pre
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l force -d 'Force installation of the tool'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l all -d 'Upgrade all tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l pre
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l python-preference -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l show-paths -d 'Whether to display the path to each tool environment and installed executable'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-python-downloads
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l all -d 'Uninstall all tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l bin -d 'Show the directory into which `uv tool` will install executables.'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "list" -d 'List the available Python installations'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "install" -d 'Download and install Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "find" -d 'Search for a Python installation'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "pin" -d 'Pin to a specific Python version'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "dir" -d 'Show the uv Python installation directory'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "uninstall" -d 'Uninstall Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l all-versions -d 'List all Python versions, including old patch versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l all-platforms -d 'List Python downloads for all platforms'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l only-installed -d 'Only show installed Python versions, exclude available downloads'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s r -l reinstall -d 'Reinstall the requested Python version, if it\'s already installed'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l resolved -d 'Write the resolved Python interpreter path instead of the request'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-resolved
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-workspace -d 'Avoid validating the Python pin is compatible with the workspace'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l all -d 'Uninstall all managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "compile" -d 'Compile a `requirements.in` file to a `requirements.txt` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "sync" -d 'Sync an environment with a `requirements.txt` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "install" -d 'Install packages into an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "uninstall" -d 'Uninstall packages from an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "freeze" -d 'List, in requirements format, packages installed in an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "list" -d 'List, in tabular format, packages installed in an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "show" -d 'Show information about one or more installed packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "tree" -d 'Display the dependency tree for an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "check" -d 'Verify installed packages have compatible dependencies'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s c -l constraint -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l override -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s b -l build-constraint -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l extra -d 'Include optional dependencies from the extra group name; may be provided more than once' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s o -l output-file -d 'Write the compiled requirements to the given `requirements.txt` file' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l annotation-style -d 'The style of the annotation comments included in the output file, used to indicate the source of each package' -r -f -a "{line\t'Render the annotations on a single, comma-separated line',split\t'Render each annotation on its own line'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l custom-compile-command -d 'The header comment to include at the top of the output file generated by `uv pip compile`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python -d 'The Python interpreter to use during resolution.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s p -l python-version -d 'The Python version to use for resolution' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-platform -d 'The platform for which requirements should be resolved' -r -f -a "{windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows',linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux',macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS',x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target',i686-pc-windows-msvc\t'A 32-bit x86 Windows target',x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`',aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices',x86_64-apple-darwin\t'An x86 macOS target',aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`',aarch64-unknown-linux-musl\t'An ARM64 Linux target',x86_64-unknown-linux-musl\t'An `x86_64` Linux target',x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform',x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform',x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform',aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform',aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform',aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-package -d 'Specify a package to omit from the output resolution. Its dependencies will still be included in the resolution. Equivalent to pip-compile\'s `--unsafe-package` option' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l resolver -r -f -a "{backtracking\t'',legacy\t''}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l max-rounds -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l client-cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l trusted-host -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l config -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l pip-args -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l pre
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-deps -d 'Ignore package dependencies, instead only add those packages explicitly listed on the command line to the resulting the requirements file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l deps
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-strip-extras -d 'Include extras in the output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l strip-extras
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-strip-markers -d 'Include environment markers in the output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l strip-markers
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-annotate -d 'Exclude comment annotations indicating the source of each package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l annotate
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-header -d 'Exclude the comment header at the top of the generated output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l header
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l system -d 'Install packages into the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l generate-hashes -d 'Include distribution hashes in the output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-generate-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l build
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l universal -d 'Perform a universal resolution, attempting to generate a single `requirements.txt` output file that is compatible with all operating systems, architectures, and Python implementations'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-universal
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-index-url -d 'Include `--index-url` and `--extra-index-url` entries in the generated output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-index-url
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-find-links -d 'Include `--find-links` entries in the generated output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-find-links
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-build-options -d 'Include `--no-binary` and `--only-binary` entries in the generated output file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-build-options
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-marker-expression -d 'Whether to emit a marker string indicating when it is known that the resulting set of pinned dependencies is valid'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-marker-expression
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-index-annotation -d 'Include comment annotations indicating the index used to resolve each package (e.g., `# from https://pypi.org/simple`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-index-annotation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l allow-unsafe
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-allow-unsafe
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l reuse-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-reuse-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-trusted-host
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-trusted-host
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-config
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l emit-options
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-options
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s c -l constraint -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s b -l build-constraint -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s p -l python -d 'The Python interpreter into which packages should be installed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l target -d 'Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l prefix -d 'Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-version -d 'The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-platform -d 'The platform for which requirements should be installed' -r -f -a "{windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows',linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux',macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS',x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target',i686-pc-windows-msvc\t'A 32-bit x86 Windows target',x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`',aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices',x86_64-apple-darwin\t'An x86 macOS target',aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`',aarch64-unknown-linux-musl\t'An ARM64 Linux target',x86_64-unknown-linux-musl\t'An `x86_64` Linux target',x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform',x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform',x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform',aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform',aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform',aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l trusted-host -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-executable -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l client-cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l config -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l pip-args -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l require-hashes -d 'Require a matching hash for each requirement'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-require-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l verify-hashes -d 'Validate any hashes provided in the requirements file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-verify-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l system -d 'Install packages into the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l build
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l allow-empty-requirements -d 'Allow sync of empty requirements, which will clear the environment of all packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-allow-empty-requirements
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l strict -d 'Validate the Python environment after completing the installation, to detect and with missing dependencies or other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l dry-run -d 'Perform a dry run, i.e., don\'t actually install anything but resolve the dependencies and print the resulting plan'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s a -l ask
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l user
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-config
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s r -l requirement -d 'Install all packages listed in the given `requirements.txt` files' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s e -l editable -d 'Install the editable package based on the provided local file path' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s c -l constraint -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l override -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s b -l build-constraint -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l extra -d 'Include optional dependencies from the extra group name; may be provided more than once' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "{highest\t'Resolve the highest compatible version of each package',lowest\t'Resolve the lowest compatible version of each package',lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "{disallow\t'Disallow all pre-release versions',allow\t'Allow all pre-release versions',if-necessary\t'Allow pre-release versions if all versions of a package are pre-release',explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements',if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s p -l python -d 'The Python interpreter into which packages should be installed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l target -d 'Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l prefix -d 'Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-version -d 'The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-platform -d 'The platform for which requirements should be installed' -r -f -a "{windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows',linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux',macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS',x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target',i686-pc-windows-msvc\t'A 32-bit x86 Windows target',x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`',aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices',x86_64-apple-darwin\t'An x86 macOS target',aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`',aarch64-unknown-linux-musl\t'An ARM64 Linux target',x86_64-unknown-linux-musl\t'An `x86_64` Linux target',x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform',x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform',x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform',aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform',aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform',aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l pre
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-deps -d 'Ignore package dependencies, instead only installing those packages explicitly listed on the command line or in the requirements files'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l deps
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l require-hashes -d 'Require a matching hash for each requirement'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-require-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l verify-hashes -d 'Validate any hashes provided in the requirements file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-verify-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l system -d 'Install packages into the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l build
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l strict -d 'Validate the Python environment after completing the installation, to detect and with missing dependencies or other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l dry-run -d 'Perform a dry run, i.e., don\'t actually install anything but resolve the dependencies and print the resulting plan'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l user
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s r -l requirement -d 'Uninstall all packages listed in the given requirements files' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s p -l python -d 'The Python interpreter from which packages should be uninstalled.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l keyring-provider -d 'Attempt to use `keyring` for authentication for remote requirements files' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l target -d 'Uninstall packages from the specified `--target` directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l prefix -d 'Uninstall packages from the specified `--prefix` directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l system -d 'Use the system Python to uninstall packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l exclude-editable -d 'Exclude any editable packages from output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l exclude -d 'Exclude the specified package(s) from the output' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l format -d 'Select the output format between: `columns` (default), `freeze`, or `json`' -r -f -a "{columns\t'Display the list of packages in a human-readable table',freeze\t'Display the list of packages in a `pip freeze`-like format, with one package per line alongside its version',json\t'Display the list of packages in a machine-readable JSON format'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s e -l editable -d 'Only include editable projects'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l exclude-editable -d 'Exclude any editable packages from output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l outdated
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s p -l python -d 'The Python interpreter to find the package in.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l system -d 'Show a package in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s d -l depth -d 'Maximum display depth of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l prune -d 'Prune the given package from the display of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l package -d 'Display only the specified packages' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l show-version-specifiers -d 'Show the version constraint(s) imposed on each package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-dedupe -d 'Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l invert -d 'Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s p -l python -d 'The Python interpreter for which packages should be checked.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l system -d 'Check packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand venv" -s p -l python -d 'The Python interpreter to use for the virtual environment.' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l prompt -d 'Provide an alternative prompt prefix for the virtual environment.' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -s i -l index-url -d 'The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l extra-index-url -d 'Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "{first-index\t'Only use results from the first index that returns a match for a given package name',unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next',unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "{disabled\t'Do not use keyring for credential lookup',subprocess\t'Use the `keyring` command for credential lookup'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "{clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory',copy\t'Copy packages from the wheel into the `site-packages` directory',hardlink\t'Hard link packages from the wheel into the `site-packages` directory',symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand venv" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l system -d 'Ignore virtual environments when searching for the Python interpreter'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-system -d 'This flag is included for compatibility only, it has no effect'
complete -c uv -n "__fish_uv_using_subcommand venv" -l seed -d 'Install seed packages (one or more of: `pip`, `setuptools`, and `wheel`) into the virtual environment'
complete -c uv -n "__fish_uv_using_subcommand venv" -l allow-existing -d 'Preserve any existing files or directories at the target path'
complete -c uv -n "__fish_uv_using_subcommand venv" -l system-site-packages -d 'Give the virtual environment access to the system site packages directory'
complete -c uv -n "__fish_uv_using_subcommand venv" -l relocatable -d 'Make the virtual environment relocatable'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand venv" -l clear
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-seed
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-pip
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-setuptools
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-wheel
complete -c uv -n "__fish_uv_using_subcommand venv" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand venv" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand venv" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand venv" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand venv" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand venv" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand venv" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand venv" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand venv" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand venv" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand venv" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "clean" -d 'Clear the cache, removing all entries or those linked to specific packages'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "prune" -d 'Prune all unreachable objects from the cache'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "dir" -d 'Show the cache directory'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l ci -d 'Optimize the cache for persistence in a continuous integration environment, like GitHub Actions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update" -f -a "update" -d 'Update uv to the latest version'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand clean" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand clean" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand clean" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand clean" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand clean" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand clean" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand clean" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand clean" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand clean" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand clean" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand clean" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand clean" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand clean" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand clean" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand version" -l output-format -r -f -a "{text\t'Display the version as plain text',json\t'Display the version as JSON'}"
complete -c uv -n "__fish_uv_using_subcommand version" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand version" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand version" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand version" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand version" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand version" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand version" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand version" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand version" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand version" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand version" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand version" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand version" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand version" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l cache-dir -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l python-preference -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l color -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l config-file -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -s n -l no-cache
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-python-downloads
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -s q -l quiet
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -s v -l verbose
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l native-tls
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l offline
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-progress
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-config
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -s h -l help
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -s V -l version
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand help" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l python-preference -d 'Whether to prefer uv-managed or system Python installations' -r -f -a "{only-managed\t'Only use managed Python installations; never use system Python installations',managed\t'Prefer managed Python installations over system Python installations',system\t'Prefer system Python installations over managed Python installations',only-system\t'Only use system Python installations; never use managed Python installations'}"
complete -c uv -n "__fish_uv_using_subcommand help" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "{automatic\t'Automatically download managed Python installations when needed',manual\t'Do not automatically download managed Python installations; require explicit installation',never\t'Do not ever allow Python downloads'}"
complete -c uv -n "__fish_uv_using_subcommand help" -l color -d 'Control colors in output' -r -f -a "{auto\t'Enables colored output only when the output is going to a terminal or TTY with support',always\t'Enables colored output regardless of the detected environment',never\t'Disables colored output'}"
complete -c uv -n "__fish_uv_using_subcommand help" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l no-pager -d 'Disable pager when printing help'
complete -c uv -n "__fish_uv_using_subcommand help" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand help" -l allow-python-downloads -d 'Allow automatically downloading Python when required'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-python-downloads -d 'Disable automatic downloads of Python'
complete -c uv -n "__fish_uv_using_subcommand help" -s q -l quiet -d 'Do not print any output'
complete -c uv -n "__fish_uv_using_subcommand help" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand help" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand help" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand help" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand help" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand help" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand help" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand help" -s V -l version -d 'Display the uv version'
