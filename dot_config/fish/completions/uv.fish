# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_uv_global_optspecs
	string join \n n/no-cache cache-dir= python-preference= managed-python no-managed-python allow-python-downloads no-python-downloads python-fetch= q/quiet v/verbose no-color color= native-tls no-native-tls offline no-offline allow-insecure-host= preview no-preview isolated show-settings no-progress no-installer-metadata directory= project= config-file= no-config h/help V/version
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
complete -c uv -n "__fish_uv_needs_command" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_needs_command" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_needs_command" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_needs_command" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_needs_command" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_needs_command" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_needs_command" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_needs_command" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_needs_command" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_needs_command" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_needs_command" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_needs_command" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_needs_command" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_needs_command" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_needs_command" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_needs_command" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_needs_command" -s V -l version -d 'Display the uv version'
complete -c uv -n "__fish_uv_needs_command" -f -a "run" -d 'Run a command or script'
complete -c uv -n "__fish_uv_needs_command" -f -a "init" -d 'Create a new project'
complete -c uv -n "__fish_uv_needs_command" -f -a "add" -d 'Add dependencies to the project'
complete -c uv -n "__fish_uv_needs_command" -f -a "remove" -d 'Remove dependencies from the project'
complete -c uv -n "__fish_uv_needs_command" -f -a "sync" -d 'Update the project\'s environment'
complete -c uv -n "__fish_uv_needs_command" -f -a "lock" -d 'Update the project\'s lockfile'
complete -c uv -n "__fish_uv_needs_command" -f -a "export" -d 'Export the project\'s lockfile to an alternate format'
complete -c uv -n "__fish_uv_needs_command" -f -a "tree" -d 'Display the project\'s dependency tree'
complete -c uv -n "__fish_uv_needs_command" -f -a "tool" -d 'Run and install commands provided by Python packages'
complete -c uv -n "__fish_uv_needs_command" -f -a "python" -d 'Manage Python versions and installations'
complete -c uv -n "__fish_uv_needs_command" -f -a "pip" -d 'Manage Python packages with a pip-compatible interface'
complete -c uv -n "__fish_uv_needs_command" -f -a "venv" -d 'Create a virtual environment'
complete -c uv -n "__fish_uv_needs_command" -f -a "build" -d 'Build Python packages into source distributions and wheels'
complete -c uv -n "__fish_uv_needs_command" -f -a "publish" -d 'Upload distributions to an index'
complete -c uv -n "__fish_uv_needs_command" -f -a "build-backend" -d 'The implementation of the build backend'
complete -c uv -n "__fish_uv_needs_command" -f -a "cache" -d 'Manage uv\'s cache'
complete -c uv -n "__fish_uv_needs_command" -f -a "self" -d 'Manage the uv executable'
complete -c uv -n "__fish_uv_needs_command" -f -a "clean" -d 'Clear the cache, removing all entries or those linked to specific packages'
complete -c uv -n "__fish_uv_needs_command" -f -a "version" -d 'Read or update the project\'s version'
complete -c uv -n "__fish_uv_needs_command" -f -a "generate-shell-completion" -d 'Generate shell completion'
complete -c uv -n "__fish_uv_needs_command" -f -a "help" -d 'Display documentation for a command'
complete -c uv -n "__fish_uv_using_subcommand run" -l extra -d 'Include optional dependencies from the specified extra name' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-extra -d 'Exclude the specified optional dependencies, if `--all-extras` is supplied' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l group -d 'Include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-group -d 'Disable the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l only-group -d 'Only include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l env-file -d 'Load environment variables from a `.env` file' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l with -d 'Run with the given packages installed' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l with-editable -d 'Run with the given packages installed in editable mode' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand run" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand run" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand run" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand run" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand run" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l package -d 'Run the command in a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand run" -s p -l python -d 'The Python interpreter to use for the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l max-recursion-depth -d 'Number of times that `uv run` will allow recursive invocations' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand run" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand run" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand run" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand run" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand run" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand run" -l dev -d 'Include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-dev -d 'Disable the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-default-groups -d 'Ignore the default dependency groups'
complete -c uv -n "__fish_uv_using_subcommand run" -l all-groups -d 'Include dependencies from all dependency groups'
complete -c uv -n "__fish_uv_using_subcommand run" -s m -l module -d 'Run a Python module'
complete -c uv -n "__fish_uv_using_subcommand run" -l only-dev -d 'Only include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-editable -d 'Install any editable dependencies, including the project and any workspace members, as non-editable'
complete -c uv -n "__fish_uv_using_subcommand run" -l inexact -d 'Do not remove extraneous packages present in the environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l exact -d 'Perform an exact sync, removing extraneous packages'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-env-file -d 'Avoid reading environment variables from a `.env` file'
complete -c uv -n "__fish_uv_using_subcommand run" -l isolated -d 'Run the command in an isolated virtual environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l active -d 'Prefer the active virtual environment over the project\'s virtual environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-active -d 'Prefer project\'s virtual environment over an active environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-sync -d 'Avoid syncing the virtual environment'
complete -c uv -n "__fish_uv_using_subcommand run" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand run" -l frozen -d 'Run without updating the `uv.lock` file'
complete -c uv -n "__fish_uv_using_subcommand run" -s s -l script -d 'Run the given path as a Python script'
complete -c uv -n "__fish_uv_using_subcommand run" -l gui-script -d 'Run the given path as a Python GUI script'
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
complete -c uv -n "__fish_uv_using_subcommand run" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand run" -l build
complete -c uv -n "__fish_uv_using_subcommand run" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand run" -l binary
complete -c uv -n "__fish_uv_using_subcommand run" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand run" -l all-packages -d 'Run the command with all workspace members installed'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-project -d 'Avoid discovering the project or workspace'
complete -c uv -n "__fish_uv_using_subcommand run" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand run" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand run" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand run" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand run" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand run" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand run" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand run" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand init" -l name -d 'The name of the project' -r
complete -c uv -n "__fish_uv_using_subcommand init" -l description -d 'Set the project description' -r
complete -c uv -n "__fish_uv_using_subcommand init" -l vcs -d 'Initialize a version control system for the project' -r -f -a "git\t'Use Git for version control'
none\t'Do not use any version control system'"
complete -c uv -n "__fish_uv_using_subcommand init" -l build-backend -d 'Initialize a build-backend of choice for the project' -r -f -a "hatch\t'Use [hatchling](https://pypi.org/project/hatchling) as the project build backend'
flit\t'Use [flit-core](https://pypi.org/project/flit-core) as the project build backend'
pdm\t'Use [pdm-backend](https://pypi.org/project/pdm-backend) as the project build backend'
poetry\t'Use [poetry-core](https://pypi.org/project/poetry-core) as the project build backend'
setuptools\t'Use [setuptools](https://pypi.org/project/setuptools) as the project build backend'
maturin\t'Use [maturin](https://pypi.org/project/maturin) as the project build backend'
scikit\t'Use [scikit-build-core](https://pypi.org/project/scikit-build-core) as the project build backend'"
complete -c uv -n "__fish_uv_using_subcommand init" -l author-from -d 'Fill in the `authors` field in the `pyproject.toml`' -r -f -a "auto\t'Fetch the author information from some sources (e.g., Git) automatically'
git\t'Fetch the author information from Git configuration only'
none\t'Do not infer the author information'"
complete -c uv -n "__fish_uv_using_subcommand init" -s p -l python -d 'The Python interpreter to use to determine the minimum supported Python version.' -r
complete -c uv -n "__fish_uv_using_subcommand init" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand init" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand init" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand init" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand init" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand init" -l bare -d 'Only create a `pyproject.toml`'
complete -c uv -n "__fish_uv_using_subcommand init" -l virtual -d 'Create a virtual project, rather than a package'
complete -c uv -n "__fish_uv_using_subcommand init" -l package -d 'Set up the project to be built as a Python package'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-package -d 'Do not set up the project to be built as a Python package'
complete -c uv -n "__fish_uv_using_subcommand init" -l app -d 'Create a project for an application'
complete -c uv -n "__fish_uv_using_subcommand init" -l lib -d 'Create a project for a library'
complete -c uv -n "__fish_uv_using_subcommand init" -l script -d 'Create a script'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-description -d 'Disable the description for the project'
complete -c uv -n "__fish_uv_using_subcommand init" -l backend -d 'Invalid option name for build backend'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-readme -d 'Do not create a `README.md` file'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-pin-python -d 'Do not create a `.python-version` file for the project'
complete -c uv -n "__fish_uv_using_subcommand init" -l pin-python -d 'Create a `.python-version` file for the project'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-workspace -d 'Avoid discovering a workspace and create a standalone project'
complete -c uv -n "__fish_uv_using_subcommand init" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand init" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand init" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand init" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand init" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand init" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand init" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand add" -s r -l requirements -d 'Add all packages listed in the given `requirements.txt` files' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s m -l marker -d 'Apply this marker to all added packages' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l optional -d 'Add the requirements to the package\'s optional dependencies for the specified extra' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l group -d 'Add the requirements to the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l rev -d 'Commit to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l tag -d 'Tag to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l branch -d 'Branch to use when adding a dependency from Git' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l extra -d 'Extras to enable for the dependency' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand add" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand add" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand add" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand add" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand add" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand add" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l package -d 'Add the dependency to a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l script -d 'Add the dependency to the specified Python script, rather than to a project' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -s p -l python -d 'The Python interpreter to use for resolving and syncing.' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand add" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand add" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand add" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand add" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand add" -l dev -d 'Add the requirements to the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand add" -l editable -d 'Add the requirements as editable'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-editable
complete -c uv -n "__fish_uv_using_subcommand add" -l raw-sources -d 'Add source requirements to `project.dependencies`, rather than `tool.uv.sources`'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-sync -d 'Avoid syncing the virtual environment'
complete -c uv -n "__fish_uv_using_subcommand add" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand add" -l frozen -d 'Add dependencies without re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand add" -l active -d 'Prefer the active virtual environment over the project\'s virtual environment'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-active -d 'Prefer project\'s virtual environment over an active environment'
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
complete -c uv -n "__fish_uv_using_subcommand add" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand add" -l build
complete -c uv -n "__fish_uv_using_subcommand add" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand add" -l binary
complete -c uv -n "__fish_uv_using_subcommand add" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand add" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand add" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand add" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand add" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand add" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand add" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand add" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand remove" -l optional -d 'Remove the packages from the project\'s optional dependencies for the specified extra' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l group -d 'Remove the packages from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand remove" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l package -d 'Remove the dependencies from a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l script -d 'Remove the dependency from the specified Python script, rather than from a project' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -s p -l python -d 'The Python interpreter to use for resolving and syncing.' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand remove" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand remove" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand remove" -l dev -d 'Remove the packages from the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-sync -d 'Avoid syncing the virtual environment after re-locking the project'
complete -c uv -n "__fish_uv_using_subcommand remove" -l active -d 'Prefer the active virtual environment over the project\'s virtual environment'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-active -d 'Prefer project\'s virtual environment over an active environment'
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
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand remove" -l build
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand remove" -l binary
complete -c uv -n "__fish_uv_using_subcommand remove" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand remove" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand remove" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand remove" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand remove" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand remove" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand remove" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand sync" -l extra -d 'Include optional dependencies from the specified extra name' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-extra -d 'Exclude the specified optional dependencies, if `--all-extras` is supplied' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l group -d 'Include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-group -d 'Disable the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l only-group -d 'Only include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-install-package -d 'Do not install the given package(s)' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand sync" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l package -d 'Sync for a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l script -d 'Sync the environment for a Python script, rather than the current project' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -s p -l python -d 'The Python interpreter to use for the project environment.' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand sync" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand sync" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand sync" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand sync" -l dev -d 'Include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-dev -d 'Disable the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand sync" -l only-dev -d 'Only include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-default-groups -d 'Ignore the default dependency groups'
complete -c uv -n "__fish_uv_using_subcommand sync" -l all-groups -d 'Include dependencies from all dependency groups'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-editable -d 'Install any editable dependencies, including the project and any workspace members, as non-editable'
complete -c uv -n "__fish_uv_using_subcommand sync" -l inexact -d 'Do not remove extraneous packages present in the environment'
complete -c uv -n "__fish_uv_using_subcommand sync" -l exact -d 'Perform an exact sync, removing extraneous packages'
complete -c uv -n "__fish_uv_using_subcommand sync" -l active -d 'Sync dependencies to the active virtual environment'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-active -d 'Prefer project\'s virtual environment over an active environment'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-install-project -d 'Do not install the current project'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-install-workspace -d 'Do not install any workspace members, including the root project'
complete -c uv -n "__fish_uv_using_subcommand sync" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand sync" -l frozen -d 'Sync without updating the `uv.lock` file'
complete -c uv -n "__fish_uv_using_subcommand sync" -l dry-run -d 'Perform a dry run, without writing the lockfile or modifying the project environment'
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
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand sync" -l build
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand sync" -l binary
complete -c uv -n "__fish_uv_using_subcommand sync" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand sync" -l all-packages -d 'Sync all packages in the workspace'
complete -c uv -n "__fish_uv_using_subcommand sync" -l check -d 'Check if the Python environment is synchronized with the project'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-check
complete -c uv -n "__fish_uv_using_subcommand sync" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand sync" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand sync" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand sync" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand sync" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand sync" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand lock" -l script -d 'Lock the specified Python script, rather than the current project' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand lock" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -s p -l python -d 'The Python interpreter to use during resolution.' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand lock" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand lock" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand lock" -l check -d 'Check if the lockfile is up-to-date'
complete -c uv -n "__fish_uv_using_subcommand lock" -l check-exists -d 'Assert that a `uv.lock` exists without checking if it is up-to-date'
complete -c uv -n "__fish_uv_using_subcommand lock" -l dry-run -d 'Perform a dry run, without writing the lockfile'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand lock" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand lock" -l pre
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l build
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand lock" -l binary
complete -c uv -n "__fish_uv_using_subcommand lock" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand lock" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand lock" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand lock" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand lock" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand lock" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand lock" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand export" -l format -d 'The format to which `uv.lock` should be exported' -r -f -a "requirements.txt\t'Export in `requirements.txt` format'
pylock.toml\t'Export in `pylock.toml` format'"
complete -c uv -n "__fish_uv_using_subcommand export" -l package -d 'Export the dependencies for a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l prune -d 'Prune the given package from the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l extra -d 'Include optional dependencies from the specified extra name' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l no-extra -d 'Exclude the specified optional dependencies, if `--all-extras` is supplied' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l group -d 'Include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l no-group -d 'Disable the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l only-group -d 'Only include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand export" -s o -l output-file -d 'Write the exported requirements to the given file' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -l no-emit-package -d 'Do not emit the given package(s)' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand export" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand export" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand export" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand export" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand export" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand export" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand export" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand export" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand export" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l script -d 'Export the dependencies for the specified PEP 723 Python script, rather than the current project' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -s p -l python -d 'The Python interpreter to use during resolution.' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand export" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand export" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand export" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand export" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand export" -l all-packages -d 'Export the entire workspace'
complete -c uv -n "__fish_uv_using_subcommand export" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand export" -l dev -d 'Include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-dev -d 'Disable the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand export" -l only-dev -d 'Only include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-default-groups -d 'Ignore the default dependency groups'
complete -c uv -n "__fish_uv_using_subcommand export" -l all-groups -d 'Include dependencies from all dependency groups'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-annotate -d 'Exclude comment annotations indicating the source of each package'
complete -c uv -n "__fish_uv_using_subcommand export" -l annotate
complete -c uv -n "__fish_uv_using_subcommand export" -l no-header -d 'Exclude the comment header at the top of the generated output file'
complete -c uv -n "__fish_uv_using_subcommand export" -l header
complete -c uv -n "__fish_uv_using_subcommand export" -l no-editable -d 'Install any editable dependencies, including the project and any workspace members, as non-editable'
complete -c uv -n "__fish_uv_using_subcommand export" -l hashes -d 'Include hashes for all dependencies'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-hashes -d 'Omit hashes in the generated output'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-emit-project -d 'Do not emit the current project'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-emit-workspace -d 'Do not emit any workspace members, including the root project'
complete -c uv -n "__fish_uv_using_subcommand export" -l locked -d 'Assert that the `uv.lock` will remain unchanged'
complete -c uv -n "__fish_uv_using_subcommand export" -l frozen -d 'Do not update the `uv.lock` before exporting'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand export" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand export" -l pre
complete -c uv -n "__fish_uv_using_subcommand export" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand export" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand export" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand export" -l build
complete -c uv -n "__fish_uv_using_subcommand export" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand export" -l binary
complete -c uv -n "__fish_uv_using_subcommand export" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand export" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand export" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand export" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand export" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand export" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand export" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand export" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand export" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand export" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand export" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand export" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand export" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tree" -s d -l depth -d 'Maximum display depth of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l prune -d 'Prune the given package from the display of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l package -d 'Display only the specified packages' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l group -d 'Include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-group -d 'Disable the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l only-group -d 'Only include dependencies from the specified dependency group' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand tree" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l script -d 'Show the dependency tree the specified PEP 723 Python script, rather than the current project' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-version -d 'The Python version to use when filtering the tree' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-platform -d 'The platform to use when filtering the tree' -r -f -a "windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows'
linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux'
macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS'
x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target'
i686-pc-windows-msvc\t'A 32-bit x86 Windows target'
x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`'
aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices'
x86_64-apple-darwin\t'An x86 macOS target'
aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`'
aarch64-unknown-linux-musl\t'An ARM64 Linux target'
x86_64-unknown-linux-musl\t'An `x86_64` Linux target'
x86_64-manylinux2014\t'An `x86_64` target for the `manylinux2014` platform. Equivalent to `x86_64-manylinux_2_17`'
x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform'
x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform'
x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform'
x86_64-manylinux_2_32\t'An `x86_64` target for the `manylinux_2_32` platform'
x86_64-manylinux_2_33\t'An `x86_64` target for the `manylinux_2_33` platform'
x86_64-manylinux_2_34\t'An `x86_64` target for the `manylinux_2_34` platform'
x86_64-manylinux_2_35\t'An `x86_64` target for the `manylinux_2_35` platform'
x86_64-manylinux_2_36\t'An `x86_64` target for the `manylinux_2_36` platform'
x86_64-manylinux_2_37\t'An `x86_64` target for the `manylinux_2_37` platform'
x86_64-manylinux_2_38\t'An `x86_64` target for the `manylinux_2_38` platform'
x86_64-manylinux_2_39\t'An `x86_64` target for the `manylinux_2_39` platform'
x86_64-manylinux_2_40\t'An `x86_64` target for the `manylinux_2_40` platform'
aarch64-manylinux2014\t'An ARM64 target for the `manylinux2014` platform. Equivalent to `aarch64-manylinux_2_17`'
aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform'
aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform'
aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'
aarch64-manylinux_2_32\t'An ARM64 target for the `manylinux_2_32` platform'
aarch64-manylinux_2_33\t'An ARM64 target for the `manylinux_2_33` platform'
aarch64-manylinux_2_34\t'An ARM64 target for the `manylinux_2_34` platform'
aarch64-manylinux_2_35\t'An ARM64 target for the `manylinux_2_35` platform'
aarch64-manylinux_2_36\t'An ARM64 target for the `manylinux_2_36` platform'
aarch64-manylinux_2_37\t'An ARM64 target for the `manylinux_2_37` platform'
aarch64-manylinux_2_38\t'An ARM64 target for the `manylinux_2_38` platform'
aarch64-manylinux_2_39\t'An ARM64 target for the `manylinux_2_39` platform'
aarch64-manylinux_2_40\t'An ARM64 target for the `manylinux_2_40` platform'"
complete -c uv -n "__fish_uv_using_subcommand tree" -s p -l python -d 'The Python interpreter to use for locking and filtering.' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tree" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tree" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tree" -l universal -d 'Show a platform-independent dependency tree'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-dedupe -d 'Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated'
complete -c uv -n "__fish_uv_using_subcommand tree" -l invert -d 'Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package'
complete -c uv -n "__fish_uv_using_subcommand tree" -l outdated -d 'Show the latest available version of each package in the tree'
complete -c uv -n "__fish_uv_using_subcommand tree" -l dev -d 'Include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand tree" -l only-dev -d 'Only include the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-dev -d 'Disable the development dependency group'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-default-groups -d 'Ignore the default dependency groups'
complete -c uv -n "__fish_uv_using_subcommand tree" -l all-groups -d 'Include dependencies from all dependency groups'
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
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand tree" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tree" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tree" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tree" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tree" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tree" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and not __fish_seen_subcommand_from run uvx install upgrade list uninstall update-shell dir" -s h -l help -d 'Display the concise help for this command'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l with-editable -d 'Run with the given packages installed in editable mode' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l overrides -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l env-file -d 'Load environment variables from a `.env` file' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s p -l python -d 'The Python interpreter to use to build the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l generate-shell-completion -r -f -a "bash\t''
elvish\t''
fish\t''
nushell\t''
powershell\t''
zsh\t''"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l isolated -d 'Run the tool in an isolated virtual environment, ignoring any already-installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-env-file -d 'Avoid reading environment variables from a `.env` file'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from run" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l from -d 'Use the given package to provide the command' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l with -d 'Run with the given packages installed' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l with-editable -d 'Run with the given packages installed in editable mode' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l with-requirements -d 'Run with all packages listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l overrides -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l env-file -d 'Load environment variables from a `.env` file' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s p -l python -d 'The Python interpreter to use to build the run environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l generate-shell-completion -r -f -a "bash\t''
elvish\t''
fish\t''
nushell\t''
powershell\t''
zsh\t''"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l isolated -d 'Run the tool in an isolated virtual environment, ignoring any already-installed tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-env-file -d 'Avoid reading environment variables from a `.env` file'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l show-resolution -d 'Whether to show resolver and installer output from any environment modifications'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s V -l version -d 'Display the uvx version'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uvx" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l from -d 'The package to install commands from' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l with -d 'Include the following extra requirements' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l with-requirements -d 'Run all requirements listed in the given `requirements.txt` files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l with-editable -d 'Include the given packages in editable mode' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l overrides -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s p -l python -d 'The Python interpreter to use to build the tool environment.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s e -l editable -d 'Install the target package in editable mode, such that changes in the package\'s source directory are reflected without reinstallation'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l force -d 'Force installation of the tool'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s p -l python -d 'Upgrade a tool, and specify it to use the given Python interpreter to build its environment. Use with `--all` to apply to all tools.' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l all -d 'Upgrade all tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l pre
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l build
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l binary
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l show-paths -d 'Whether to display the path to each tool environment and installed executable'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l show-version-specifiers -d 'Whether to display the version specifier(s) used to install each tool'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-python-downloads
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l all -d 'Uninstall all tools'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from update-shell" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l bin -d 'Show the directory into which `uv tool` will install executables.'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand tool; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "list" -d 'List the available Python installations'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "install" -d 'Download and install Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "find" -d 'Search for a Python installation'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "pin" -d 'Pin to a specific Python version'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "dir" -d 'Show the uv Python installation directory'
complete -c uv -n "__fish_uv_using_subcommand python; and not __fish_seen_subcommand_from list install find pin dir uninstall" -f -a "uninstall" -d 'Uninstall Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l output-format -d 'Select the output format' -r -f -a "text\t'Plain text (for humans)'
json\t'JSON (for computers)'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l all-versions -d 'List all Python versions, including old patch versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l all-platforms -d 'List Python downloads for all platforms'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l all-arches -d 'List Python downloads for all architectures'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l only-installed -d 'Only show installed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l only-downloads -d 'Only show available Python downloads'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l show-urls -d 'Show the URLs of available Python downloads'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s i -l install-dir -d 'The directory to store the Python installation in' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l mirror -d 'Set the URL to use as the source for downloading Python installations' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l pypy-mirror -d 'Set the URL to use as the source for downloading PyPy installations' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s r -l reinstall -d 'Reinstall the requested Python version, if it\'s already installed'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s f -l force -d 'Replace existing Python executables during installation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l default -d 'Use as the default Python version'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l script -d 'Find the environment for a Python script, rather than the current project' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-project -d 'Avoid discovering a project or workspace'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l system -d 'Only find system Python interpreters'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-system
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l show-version -d 'Show the Python version that would be used instead of the path to the interpreter'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from find" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l resolved -d 'Write the resolved Python interpreter path instead of the request'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-resolved
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-project -d 'Avoid validating the Python pin is compatible with the project or workspace'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l global -d 'Update the global Python version pin'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from pin" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l bin -d 'Show the directory into which `uv python` will install Python executables.'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s i -l install-dir -d 'The directory where the Python was installed' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l all -d 'Uninstall all managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand python; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "compile" -d 'Compile a `requirements.in` file to a `requirements.txt` or `pylock.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "sync" -d 'Sync an environment with a `requirements.txt` or `pylock.toml` file'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "install" -d 'Install packages into an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "uninstall" -d 'Uninstall packages from an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "freeze" -d 'List, in requirements format, packages installed in an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "list" -d 'List, in tabular format, packages installed in an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "show" -d 'Show information about one or more installed packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "tree" -d 'Display the dependency tree for an environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and not __fish_seen_subcommand_from compile sync install uninstall freeze list show tree check" -f -a "check" -d 'Verify installed packages have compatible dependencies'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l overrides -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l extra -d 'Include optional dependencies from the specified extra name; may be provided more than once' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l group -d 'Install the specified dependency group from a `pyproject.toml`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s o -l output-file -d 'Write the compiled requirements to the given `requirements.txt` or `pylock.toml` file' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l format -d 'The format in which the resolution should be output' -r -f -a "requirements.txt\t'Export in `requirements.txt` format'
pylock.toml\t'Export in `pylock.toml` format'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l annotation-style -d 'The style of the annotation comments included in the output file, used to indicate the source of each package' -r -f -a "line\t'Render the annotations on a single, comma-separated line'
split\t'Render each annotation on its own line'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l custom-compile-command -d 'The header comment to include at the top of the output file generated by `uv pip compile`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s p -l python -d 'The Python interpreter to use during resolution.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-version -d 'The Python version to use for resolution' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-platform -d 'The platform for which requirements should be resolved' -r -f -a "windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows'
linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux'
macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS'
x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target'
i686-pc-windows-msvc\t'A 32-bit x86 Windows target'
x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`'
aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices'
x86_64-apple-darwin\t'An x86 macOS target'
aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`'
aarch64-unknown-linux-musl\t'An ARM64 Linux target'
x86_64-unknown-linux-musl\t'An `x86_64` Linux target'
x86_64-manylinux2014\t'An `x86_64` target for the `manylinux2014` platform. Equivalent to `x86_64-manylinux_2_17`'
x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform'
x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform'
x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform'
x86_64-manylinux_2_32\t'An `x86_64` target for the `manylinux_2_32` platform'
x86_64-manylinux_2_33\t'An `x86_64` target for the `manylinux_2_33` platform'
x86_64-manylinux_2_34\t'An `x86_64` target for the `manylinux_2_34` platform'
x86_64-manylinux_2_35\t'An `x86_64` target for the `manylinux_2_35` platform'
x86_64-manylinux_2_36\t'An `x86_64` target for the `manylinux_2_36` platform'
x86_64-manylinux_2_37\t'An `x86_64` target for the `manylinux_2_37` platform'
x86_64-manylinux_2_38\t'An `x86_64` target for the `manylinux_2_38` platform'
x86_64-manylinux_2_39\t'An `x86_64` target for the `manylinux_2_39` platform'
x86_64-manylinux_2_40\t'An `x86_64` target for the `manylinux_2_40` platform'
aarch64-manylinux2014\t'An ARM64 target for the `manylinux2014` platform. Equivalent to `aarch64-manylinux_2_17`'
aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform'
aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform'
aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'
aarch64-manylinux_2_32\t'An ARM64 target for the `manylinux_2_32` platform'
aarch64-manylinux_2_33\t'An ARM64 target for the `manylinux_2_33` platform'
aarch64-manylinux_2_34\t'An ARM64 target for the `manylinux_2_34` platform'
aarch64-manylinux_2_35\t'An ARM64 target for the `manylinux_2_35` platform'
aarch64-manylinux_2_36\t'An ARM64 target for the `manylinux_2_36` platform'
aarch64-manylinux_2_37\t'An ARM64 target for the `manylinux_2_37` platform'
aarch64-manylinux_2_38\t'An ARM64 target for the `manylinux_2_38` platform'
aarch64-manylinux_2_39\t'An ARM64 target for the `manylinux_2_39` platform'
aarch64-manylinux_2_40\t'An ARM64 target for the `manylinux_2_40` platform'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-emit-package -d 'Specify a package to omit from the output resolution. Its dependencies will still be included in the resolution. Equivalent to pip-compile\'s `--unsafe-package` option' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l torch-backend -d 'The backend to use when fetching packages in the PyTorch ecosystem (e.g., `cpu`, `cu126`, or `auto`)' -r -f -a "auto\t'Select the appropriate PyTorch index based on the operating system and CUDA driver version'
cpu\t'Use the CPU-only PyTorch index'
cu128\t'Use the PyTorch index for CUDA 12.8'
cu126\t'Use the PyTorch index for CUDA 12.6'
cu125\t'Use the PyTorch index for CUDA 12.5'
cu124\t'Use the PyTorch index for CUDA 12.4'
cu123\t'Use the PyTorch index for CUDA 12.3'
cu122\t'Use the PyTorch index for CUDA 12.2'
cu121\t'Use the PyTorch index for CUDA 12.1'
cu120\t'Use the PyTorch index for CUDA 12.0'
cu118\t'Use the PyTorch index for CUDA 11.8'
cu117\t'Use the PyTorch index for CUDA 11.7'
cu116\t'Use the PyTorch index for CUDA 11.6'
cu115\t'Use the PyTorch index for CUDA 11.5'
cu114\t'Use the PyTorch index for CUDA 11.4'
cu113\t'Use the PyTorch index for CUDA 11.3'
cu112\t'Use the PyTorch index for CUDA 11.2'
cu111\t'Use the PyTorch index for CUDA 11.1'
cu110\t'Use the PyTorch index for CUDA 11.0'
cu102\t'Use the PyTorch index for CUDA 10.2'
cu101\t'Use the PyTorch index for CUDA 10.1'
cu100\t'Use the PyTorch index for CUDA 10.0'
cu92\t'Use the PyTorch index for CUDA 9.2'
cu91\t'Use the PyTorch index for CUDA 9.1'
cu90\t'Use the PyTorch index for CUDA 9.0'
cu80\t'Use the PyTorch index for CUDA 8.0'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l resolver -r -f -a "backtracking\t''
legacy\t''"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l max-rounds -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l client-cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l config -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l pip-args -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l all-extras -d 'Include all optional dependencies'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-all-extras
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l pre
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-deps -d 'Ignore package dependencies, instead only add those packages explicitly listed on the command line to the resulting requirements file'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from compile" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s p -l python -d 'The Python interpreter into which packages should be installed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l target -d 'Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l prefix -d 'Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-version -d 'The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-platform -d 'The platform for which requirements should be installed' -r -f -a "windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows'
linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux'
macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS'
x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target'
i686-pc-windows-msvc\t'A 32-bit x86 Windows target'
x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`'
aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices'
x86_64-apple-darwin\t'An x86 macOS target'
aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`'
aarch64-unknown-linux-musl\t'An ARM64 Linux target'
x86_64-unknown-linux-musl\t'An `x86_64` Linux target'
x86_64-manylinux2014\t'An `x86_64` target for the `manylinux2014` platform. Equivalent to `x86_64-manylinux_2_17`'
x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform'
x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform'
x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform'
x86_64-manylinux_2_32\t'An `x86_64` target for the `manylinux_2_32` platform'
x86_64-manylinux_2_33\t'An `x86_64` target for the `manylinux_2_33` platform'
x86_64-manylinux_2_34\t'An `x86_64` target for the `manylinux_2_34` platform'
x86_64-manylinux_2_35\t'An `x86_64` target for the `manylinux_2_35` platform'
x86_64-manylinux_2_36\t'An `x86_64` target for the `manylinux_2_36` platform'
x86_64-manylinux_2_37\t'An `x86_64` target for the `manylinux_2_37` platform'
x86_64-manylinux_2_38\t'An `x86_64` target for the `manylinux_2_38` platform'
x86_64-manylinux_2_39\t'An `x86_64` target for the `manylinux_2_39` platform'
x86_64-manylinux_2_40\t'An `x86_64` target for the `manylinux_2_40` platform'
aarch64-manylinux2014\t'An ARM64 target for the `manylinux2014` platform. Equivalent to `aarch64-manylinux_2_17`'
aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform'
aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform'
aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'
aarch64-manylinux_2_32\t'An ARM64 target for the `manylinux_2_32` platform'
aarch64-manylinux_2_33\t'An ARM64 target for the `manylinux_2_33` platform'
aarch64-manylinux_2_34\t'An ARM64 target for the `manylinux_2_34` platform'
aarch64-manylinux_2_35\t'An ARM64 target for the `manylinux_2_35` platform'
aarch64-manylinux_2_36\t'An ARM64 target for the `manylinux_2_36` platform'
aarch64-manylinux_2_37\t'An ARM64 target for the `manylinux_2_37` platform'
aarch64-manylinux_2_38\t'An ARM64 target for the `manylinux_2_38` platform'
aarch64-manylinux_2_39\t'An ARM64 target for the `manylinux_2_39` platform'
aarch64-manylinux_2_40\t'An ARM64 target for the `manylinux_2_40` platform'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l torch-backend -d 'The backend to use when fetching packages in the PyTorch ecosystem (e.g., `cpu`, `cu126`, or `auto`)' -r -f -a "auto\t'Select the appropriate PyTorch index based on the operating system and CUDA driver version'
cpu\t'Use the CPU-only PyTorch index'
cu128\t'Use the PyTorch index for CUDA 12.8'
cu126\t'Use the PyTorch index for CUDA 12.6'
cu125\t'Use the PyTorch index for CUDA 12.5'
cu124\t'Use the PyTorch index for CUDA 12.4'
cu123\t'Use the PyTorch index for CUDA 12.3'
cu122\t'Use the PyTorch index for CUDA 12.2'
cu121\t'Use the PyTorch index for CUDA 12.1'
cu120\t'Use the PyTorch index for CUDA 12.0'
cu118\t'Use the PyTorch index for CUDA 11.8'
cu117\t'Use the PyTorch index for CUDA 11.7'
cu116\t'Use the PyTorch index for CUDA 11.6'
cu115\t'Use the PyTorch index for CUDA 11.5'
cu114\t'Use the PyTorch index for CUDA 11.4'
cu113\t'Use the PyTorch index for CUDA 11.3'
cu112\t'Use the PyTorch index for CUDA 11.2'
cu111\t'Use the PyTorch index for CUDA 11.1'
cu110\t'Use the PyTorch index for CUDA 11.0'
cu102\t'Use the PyTorch index for CUDA 10.2'
cu101\t'Use the PyTorch index for CUDA 10.1'
cu100\t'Use the PyTorch index for CUDA 10.0'
cu92\t'Use the PyTorch index for CUDA 9.2'
cu91\t'Use the PyTorch index for CUDA 9.1'
cu90\t'Use the PyTorch index for CUDA 9.0'
cu80\t'Use the PyTorch index for CUDA 8.0'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-executable -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l client-cert -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l config -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l pip-args -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l reinstall -d 'Reinstall all packages, regardless of whether they\'re already installed. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-reinstall
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l compile-bytecode -d 'Compile Python files to bytecode after installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-compile-bytecode
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l require-hashes -d 'Require a matching hash for each requirement'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-require-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l verify-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-verify-hashes -d 'Disable validation of hashes in the requirements file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l system -d 'Install packages into the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l build
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l allow-empty-requirements -d 'Allow sync of empty requirements, which will clear the environment of all packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-allow-empty-requirements
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l strict -d 'Validate the Python environment after completing the installation, to detect packages with missing dependencies or other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l dry-run -d 'Perform a dry run, i.e., don\'t actually install anything but resolve the dependencies and print the resulting plan'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s a -l ask
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l user
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-config
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from sync" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s r -l requirements -d 'Install all packages listed in the given `requirements.txt` or `pylock.toml` files' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s e -l editable -d 'Install the editable package based on the provided local file path' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s c -l constraints -d 'Constrain versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l overrides -d 'Override versions using the given requirements files' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l extra -d 'Include optional dependencies from the specified extra name; may be provided more than once' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l reinstall-package -d 'Reinstall a specific package, regardless of whether it\'s already installed. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l group -d 'Install the specified dependency group from a `pyproject.toml`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s p -l python -d 'The Python interpreter into which packages should be installed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l target -d 'Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l prefix -d 'Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-binary -d 'Don\'t install pre-built wheels' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l only-binary -d 'Only use pre-built wheels; don\'t build source distributions' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-version -d 'The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-platform -d 'The platform for which requirements should be installed' -r -f -a "windows\t'An alias for `x86_64-pc-windows-msvc`, the default target for Windows'
linux\t'An alias for `x86_64-unknown-linux-gnu`, the default target for Linux'
macos\t'An alias for `aarch64-apple-darwin`, the default target for macOS'
x86_64-pc-windows-msvc\t'A 64-bit x86 Windows target'
i686-pc-windows-msvc\t'A 32-bit x86 Windows target'
x86_64-unknown-linux-gnu\t'An x86 Linux target. Equivalent to `x86_64-manylinux_2_17`'
aarch64-apple-darwin\t'An ARM-based macOS target, as seen on Apple Silicon devices'
x86_64-apple-darwin\t'An x86 macOS target'
aarch64-unknown-linux-gnu\t'An ARM64 Linux target. Equivalent to `aarch64-manylinux_2_17`'
aarch64-unknown-linux-musl\t'An ARM64 Linux target'
x86_64-unknown-linux-musl\t'An `x86_64` Linux target'
x86_64-manylinux2014\t'An `x86_64` target for the `manylinux2014` platform. Equivalent to `x86_64-manylinux_2_17`'
x86_64-manylinux_2_17\t'An `x86_64` target for the `manylinux_2_17` platform'
x86_64-manylinux_2_28\t'An `x86_64` target for the `manylinux_2_28` platform'
x86_64-manylinux_2_31\t'An `x86_64` target for the `manylinux_2_31` platform'
x86_64-manylinux_2_32\t'An `x86_64` target for the `manylinux_2_32` platform'
x86_64-manylinux_2_33\t'An `x86_64` target for the `manylinux_2_33` platform'
x86_64-manylinux_2_34\t'An `x86_64` target for the `manylinux_2_34` platform'
x86_64-manylinux_2_35\t'An `x86_64` target for the `manylinux_2_35` platform'
x86_64-manylinux_2_36\t'An `x86_64` target for the `manylinux_2_36` platform'
x86_64-manylinux_2_37\t'An `x86_64` target for the `manylinux_2_37` platform'
x86_64-manylinux_2_38\t'An `x86_64` target for the `manylinux_2_38` platform'
x86_64-manylinux_2_39\t'An `x86_64` target for the `manylinux_2_39` platform'
x86_64-manylinux_2_40\t'An `x86_64` target for the `manylinux_2_40` platform'
aarch64-manylinux2014\t'An ARM64 target for the `manylinux2014` platform. Equivalent to `aarch64-manylinux_2_17`'
aarch64-manylinux_2_17\t'An ARM64 target for the `manylinux_2_17` platform'
aarch64-manylinux_2_28\t'An ARM64 target for the `manylinux_2_28` platform'
aarch64-manylinux_2_31\t'An ARM64 target for the `manylinux_2_31` platform'
aarch64-manylinux_2_32\t'An ARM64 target for the `manylinux_2_32` platform'
aarch64-manylinux_2_33\t'An ARM64 target for the `manylinux_2_33` platform'
aarch64-manylinux_2_34\t'An ARM64 target for the `manylinux_2_34` platform'
aarch64-manylinux_2_35\t'An ARM64 target for the `manylinux_2_35` platform'
aarch64-manylinux_2_36\t'An ARM64 target for the `manylinux_2_36` platform'
aarch64-manylinux_2_37\t'An ARM64 target for the `manylinux_2_37` platform'
aarch64-manylinux_2_38\t'An ARM64 target for the `manylinux_2_38` platform'
aarch64-manylinux_2_39\t'An ARM64 target for the `manylinux_2_39` platform'
aarch64-manylinux_2_40\t'An ARM64 target for the `manylinux_2_40` platform'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l torch-backend -d 'The backend to use when fetching packages in the PyTorch ecosystem (e.g., `cpu`, `cu126`, or `auto`)' -r -f -a "auto\t'Select the appropriate PyTorch index based on the operating system and CUDA driver version'
cpu\t'Use the CPU-only PyTorch index'
cu128\t'Use the PyTorch index for CUDA 12.8'
cu126\t'Use the PyTorch index for CUDA 12.6'
cu125\t'Use the PyTorch index for CUDA 12.5'
cu124\t'Use the PyTorch index for CUDA 12.4'
cu123\t'Use the PyTorch index for CUDA 12.3'
cu122\t'Use the PyTorch index for CUDA 12.2'
cu121\t'Use the PyTorch index for CUDA 12.1'
cu120\t'Use the PyTorch index for CUDA 12.0'
cu118\t'Use the PyTorch index for CUDA 11.8'
cu117\t'Use the PyTorch index for CUDA 11.7'
cu116\t'Use the PyTorch index for CUDA 11.6'
cu115\t'Use the PyTorch index for CUDA 11.5'
cu114\t'Use the PyTorch index for CUDA 11.4'
cu113\t'Use the PyTorch index for CUDA 11.3'
cu112\t'Use the PyTorch index for CUDA 11.2'
cu111\t'Use the PyTorch index for CUDA 11.1'
cu110\t'Use the PyTorch index for CUDA 11.0'
cu102\t'Use the PyTorch index for CUDA 10.2'
cu101\t'Use the PyTorch index for CUDA 10.1'
cu100\t'Use the PyTorch index for CUDA 10.0'
cu92\t'Use the PyTorch index for CUDA 9.2'
cu91\t'Use the PyTorch index for CUDA 9.1'
cu90\t'Use the PyTorch index for CUDA 9.0'
cu80\t'Use the PyTorch index for CUDA 8.0'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l project -d 'Run the command within the given project directory' -r -F
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-deps -d 'Ignore package dependencies, instead only installing those packages explicitly listed on the command line or in the requirements files'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l deps
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l require-hashes -d 'Require a matching hash for each requirement'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-require-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l verify-hashes
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-verify-hashes -d 'Disable validation of hashes in the requirements file'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l system -d 'Install packages into the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l build
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l inexact -d 'Do not remove extraneous packages present in the environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l exact -d 'Perform an exact sync, removing extraneous packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l strict -d 'Validate the Python environment after completing the installation, to detect packages with missing dependencies or other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l dry-run -d 'Perform a dry run, i.e., don\'t actually install anything but resolve the dependencies and print the resulting plan'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l user
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from install" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s r -l requirements -d 'Uninstall all packages listed in the given requirements files' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s p -l python -d 'The Python interpreter from which packages should be uninstalled.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l keyring-provider -d 'Attempt to use `keyring` for authentication for remote requirements files' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l target -d 'Uninstall packages from the specified `--target` directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l prefix -d 'Uninstall packages from the specified `--prefix` directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l system -d 'Use the system Python to uninstall packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l break-system-packages -d 'Allow uv to modify an `EXTERNALLY-MANAGED` Python installation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-break-system-packages
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l dry-run -d 'Perform a dry run, i.e., don\'t actually uninstall anything but print the resulting plan'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l path -d 'Restrict to the specified installation path for listing packages (can be used multiple times)' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l exclude-editable -d 'Exclude any editable packages from output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from freeze" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l exclude -d 'Exclude the specified package(s) from the output' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l format -d 'Select the output format' -r -f -a "columns\t'Display the list of packages in a human-readable table'
freeze\t'Display the list of packages in a `pip freeze`-like format, with one package per line alongside its version'
json\t'Display the list of packages in a machine-readable JSON format'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s e -l editable -d 'Only include editable projects'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l exclude-editable -d 'Exclude any editable packages from output'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l outdated -d 'List outdated packages'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-outdated
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from list" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s p -l python -d 'The Python interpreter to find the package in.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s f -l files -d 'Show the full list of installed files for each package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l system -d 'Show a package in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from show" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s d -l depth -d 'Maximum display depth of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l prune -d 'Prune the given package from the display of the dependency tree' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l package -d 'Display only the specified packages' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s p -l python -d 'The Python interpreter for which packages should be listed.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l show-version-specifiers -d 'Show the version constraint(s) imposed on each package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-dedupe -d 'Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l invert -d 'Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l outdated -d 'Show the latest available version of each package in the tree'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l strict -d 'Validate the Python environment, to detect packages with missing dependencies and other issues'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-strict
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l system -d 'List packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l disable-pip-version-check
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from tree" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s p -l python -d 'The Python interpreter for which packages should be checked.' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l system -d 'Check packages in the system Python environment'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-system
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand pip; and __fish_seen_subcommand_from check" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand venv" -s p -l python -d 'The Python interpreter to use for the virtual environment.' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l prompt -d 'Provide an alternative prompt prefix for the virtual environment.' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand venv" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand venv" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand venv" -l system -d 'Ignore virtual environments when searching for the Python interpreter'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-system -d 'This flag is included for compatibility only, it has no effect'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-project -d 'Avoid discovering a project or workspace'
complete -c uv -n "__fish_uv_using_subcommand venv" -l seed -d 'Install seed packages (one or more of: `pip`, `setuptools`, and `wheel`) into the virtual environment'
complete -c uv -n "__fish_uv_using_subcommand venv" -l allow-existing -d 'Preserve any existing files or directories at the target path'
complete -c uv -n "__fish_uv_using_subcommand venv" -l system-site-packages -d 'Give the virtual environment access to the system site packages directory'
complete -c uv -n "__fish_uv_using_subcommand venv" -l relocatable -d 'Make the virtual environment relocatable'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand venv" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand venv" -l clear
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-seed
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-pip
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-setuptools
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-wheel
complete -c uv -n "__fish_uv_using_subcommand venv" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand venv" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand venv" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand venv" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand venv" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand venv" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build" -l package -d 'Build a specific package in the workspace' -r
complete -c uv -n "__fish_uv_using_subcommand build" -s o -l out-dir -d 'The output directory to which distributions should be written' -r -F
complete -c uv -n "__fish_uv_using_subcommand build" -s b -l build-constraints -d 'Constrain build dependencies using the given requirements files when building distributions' -r
complete -c uv -n "__fish_uv_using_subcommand build" -s p -l python -d 'The Python interpreter to use for the build environment.' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l index -d 'The URLs to use when resolving dependencies, in addition to the default index' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l default-index -d 'The URL of the default package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand build" -s i -l index-url -d '(Deprecated: use `--default-index` instead) The URL of the Python package index (by default: <https://pypi.org/simple>)' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l extra-index-url -d '(Deprecated: use `--index` instead) Extra URLs of package indexes to use, in addition to `--index-url`' -r
complete -c uv -n "__fish_uv_using_subcommand build" -s f -l find-links -d 'Locations to search for candidate distributions, in addition to those found in the registry indexes' -r
complete -c uv -n "__fish_uv_using_subcommand build" -s P -l upgrade-package -d 'Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l index-strategy -d 'The strategy to use when resolving against multiple index URLs' -r -f -a "first-index\t'Only use results from the first index that returns a match for a given package name'
unsafe-first-match\t'Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next'
unsafe-best-match\t'Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index'"
complete -c uv -n "__fish_uv_using_subcommand build" -l keyring-provider -d 'Attempt to use `keyring` for authentication for index URLs' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand build" -l resolution -d 'The strategy to use when selecting between the different compatible versions for a given package requirement' -r -f -a "highest\t'Resolve the highest compatible version of each package'
lowest\t'Resolve the lowest compatible version of each package'
lowest-direct\t'Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies'"
complete -c uv -n "__fish_uv_using_subcommand build" -l prerelease -d 'The strategy to use when considering pre-release versions' -r -f -a "disallow\t'Disallow all pre-release versions'
allow\t'Allow all pre-release versions'
if-necessary\t'Allow pre-release versions if all versions of a package are pre-release'
explicit\t'Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements'
if-necessary-or-explicit\t'Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements'"
complete -c uv -n "__fish_uv_using_subcommand build" -l fork-strategy -d 'The strategy to use when selecting multiple versions of a given package across Python versions and platforms' -r -f -a "fewest\t'Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms'
requires-python\t'Optimize for selecting latest supported version of each package, for each supported Python version'"
complete -c uv -n "__fish_uv_using_subcommand build" -s C -l config-setting -d 'Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l no-build-isolation-package -d 'Disable isolation when building source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l exclude-newer -d 'Limit candidate packages to those that were uploaded prior to the given date' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l link-mode -d 'The method to use when installing packages from the global cache' -r -f -a "clone\t'Clone (i.e., copy-on-write) packages from the wheel into the `site-packages` directory'
copy\t'Copy packages from the wheel into the `site-packages` directory'
hardlink\t'Hard link packages from the wheel into the `site-packages` directory'
symlink\t'Symbolically link packages from the wheel into the `site-packages` directory'"
complete -c uv -n "__fish_uv_using_subcommand build" -l no-build-package -d 'Don\'t build source distributions for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l no-binary-package -d 'Don\'t install pre-built wheels for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l refresh-package -d 'Refresh cached data for a specific package' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build" -l all-packages -d 'Builds all packages in the workspace'
complete -c uv -n "__fish_uv_using_subcommand build" -l sdist -d 'Build a source distribution ("sdist") from the given directory'
complete -c uv -n "__fish_uv_using_subcommand build" -l wheel -d 'Build a binary distribution ("wheel") from the given directory'
complete -c uv -n "__fish_uv_using_subcommand build" -l list -d 'When using the uv build backend, list the files that would be included when building'
complete -c uv -n "__fish_uv_using_subcommand build" -l build-logs
complete -c uv -n "__fish_uv_using_subcommand build" -l no-build-logs -d 'Hide logs from the build backend'
complete -c uv -n "__fish_uv_using_subcommand build" -l force-pep517 -d 'Always build through PEP 517, don\'t use the fast path for the uv build backend'
complete -c uv -n "__fish_uv_using_subcommand build" -l require-hashes -d 'Require a matching hash for each requirement'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-require-hashes
complete -c uv -n "__fish_uv_using_subcommand build" -l verify-hashes
complete -c uv -n "__fish_uv_using_subcommand build" -l no-verify-hashes -d 'Disable validation of hashes in the requirements file'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-index -d 'Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`'
complete -c uv -n "__fish_uv_using_subcommand build" -s U -l upgrade -d 'Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-upgrade
complete -c uv -n "__fish_uv_using_subcommand build" -l pre
complete -c uv -n "__fish_uv_using_subcommand build" -l no-build-isolation -d 'Disable isolation when building source distributions'
complete -c uv -n "__fish_uv_using_subcommand build" -l build-isolation
complete -c uv -n "__fish_uv_using_subcommand build" -l no-sources -d 'Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-build -d 'Don\'t build source distributions'
complete -c uv -n "__fish_uv_using_subcommand build" -l build
complete -c uv -n "__fish_uv_using_subcommand build" -l no-binary -d 'Don\'t install pre-built wheels'
complete -c uv -n "__fish_uv_using_subcommand build" -l binary
complete -c uv -n "__fish_uv_using_subcommand build" -l refresh -d 'Refresh all cached data'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-refresh
complete -c uv -n "__fish_uv_using_subcommand build" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand publish" -l index -d 'The name of an index in the configuration to use for publishing.' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -s u -l username -d 'The username for the upload' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -s p -l password -d 'The password for the upload' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -s t -l token -d 'The token for the upload' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -l trusted-publishing -d 'Configure using trusted publishing through GitHub Actions' -r -f -a "automatic\t'Try trusted publishing when we\'re already in GitHub Actions, continue if that fails'
always\t''
never\t''"
complete -c uv -n "__fish_uv_using_subcommand publish" -l keyring-provider -d 'Attempt to use `keyring` for authentication for remote requirements files' -r -f -a "disabled\t'Do not use keyring for credential lookup'
subprocess\t'Use the `keyring` command for credential lookup'"
complete -c uv -n "__fish_uv_using_subcommand publish" -l publish-url -d 'The URL of the upload endpoint (not the index URL)' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -l check-url -d 'Check an index URL for existing files to skip duplicate uploads' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand publish" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand publish" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand publish" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand publish" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand publish" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand publish" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand publish" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand publish" -l skip-existing
complete -c uv -n "__fish_uv_using_subcommand publish" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand publish" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand publish" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand publish" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand publish" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand publish" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand publish" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand publish" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand publish" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand publish" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand publish" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand publish" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "build-sdist" -d 'PEP 517 hook `build_sdist`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "build-wheel" -d 'PEP 517 hook `build_wheel`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "build-editable" -d 'PEP 660 hook `build_editable`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "get-requires-for-build-sdist" -d 'PEP 517 hook `get_requires_for_build_sdist`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "get-requires-for-build-wheel" -d 'PEP 517 hook `get_requires_for_build_wheel`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "prepare-metadata-for-build-wheel" -d 'PEP 517 hook `prepare_metadata_for_build_wheel`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "get-requires-for-build-editable" -d 'PEP 660 hook `get_requires_for_build_editable`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and not __fish_seen_subcommand_from build-sdist build-wheel build-editable get-requires-for-build-sdist get-requires-for-build-wheel prepare-metadata-for-build-wheel get-requires-for-build-editable prepare-metadata-for-build-editable" -f -a "prepare-metadata-for-build-editable" -d 'PEP 660 hook `prepare_metadata_for_build_editable`'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-sdist" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l metadata-directory -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-wheel" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l metadata-directory -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from build-editable" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-sdist" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-wheel" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-wheel" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from get-requires-for-build-editable" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand build-backend; and __fish_seen_subcommand_from prepare-metadata-for-build-editable" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "clean" -d 'Clear the cache, removing all entries or those linked to specific packages'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "prune" -d 'Prune all unreachable objects from the cache'
complete -c uv -n "__fish_uv_using_subcommand cache; and not __fish_seen_subcommand_from clean prune dir" -f -a "dir" -d 'Show the cache directory'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from clean" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l ci -d 'Optimize the cache for persistence in a continuous integration environment, like GitHub Actions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from prune" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand cache; and __fish_seen_subcommand_from dir" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -f -a "update" -d 'Update uv'
complete -c uv -n "__fish_uv_using_subcommand self; and not __fish_seen_subcommand_from update version" -f -a "version" -d 'Display uv\'s version'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l token -d 'A GitHub token for authentication. A token is not required but can be used to reduce the chance of encountering rate limits' -r
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from update" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l output-format -r -f -a "text\t'Display the version as plain text'
json\t'Display the version as JSON'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l short -d 'Only print the version'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -s q -l quiet -d 'Use quiet output'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -s v -l verbose -d 'Use verbose output'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l native-tls -d 'Whether to load TLS certificates from the platform\'s native certificate store'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l offline -d 'Disable network access'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-progress -d 'Hide all progress outputs'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand self; and __fish_seen_subcommand_from version" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand clean" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand clean" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand clean" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand clean" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand clean" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand clean" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand clean" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand clean" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand clean" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand clean" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand clean" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand version" -l bump -d 'Update the project version using the given semantics' -r -f -a "major\t'Increase the major version (1.2.3 => 2.0.0)'
minor\t'Increase the minor version (1.2.3 => 1.3.0)'
patch\t'Increase the patch version (1.2.3 => 1.2.4)'"
complete -c uv -n "__fish_uv_using_subcommand version" -l output-format -r -f -a "text\t'Display the version as plain text'
json\t'Display the version as JSON'"
complete -c uv -n "__fish_uv_using_subcommand version" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand version" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand version" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand version" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand version" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand version" -l dry-run -d 'Don\'t write a new version to the `pyproject.toml`'
complete -c uv -n "__fish_uv_using_subcommand version" -l short -d 'Only show the version'
complete -c uv -n "__fish_uv_using_subcommand version" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand version" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand version" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand version" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand version" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand version" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand version" -s h -l help -d 'Display the concise help for this command'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l cache-dir -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l color -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l config-file -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l project -d 'Run the command within the given project directory' -r -F
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
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-color -d 'Disable colors'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-native-tls
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-offline
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l preview -d 'Whether to enable experimental, preview features'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-preview
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l isolated -d 'Avoid discovering a `pyproject.toml` or `uv.toml` file'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l show-settings -d 'Show the resolved settings for the current command'
complete -c uv -n "__fish_uv_using_subcommand generate-shell-completion" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand help" -l cache-dir -d 'Path to the cache directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l python-preference -r -f -a "only-managed\t'Only use managed Python installations; never use system Python installations'
managed\t'Prefer managed Python installations over system Python installations'
system\t'Prefer system Python installations over managed Python installations'
only-system\t'Only use system Python installations; never use managed Python installations'"
complete -c uv -n "__fish_uv_using_subcommand help" -l python-fetch -d 'Deprecated version of [`Self::python_downloads`]' -r -f -a "automatic\t'Automatically download managed Python installations when needed'
manual\t'Do not automatically download managed Python installations; require explicit installation'
never\t'Do not ever allow Python downloads'"
complete -c uv -n "__fish_uv_using_subcommand help" -l color -d 'Control the use of color in output' -r -f -a "auto\t'Enables colored output only when the output is going to a terminal or TTY with support'
always\t'Enables colored output regardless of the detected environment'
never\t'Disables colored output'"
complete -c uv -n "__fish_uv_using_subcommand help" -l allow-insecure-host -d 'Allow insecure connections to a host' -r
complete -c uv -n "__fish_uv_using_subcommand help" -l directory -d 'Change to the given directory prior to running the command' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l project -d 'Run the command within the given project directory' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l config-file -d 'The path to a `uv.toml` file to use for configuration' -r -F
complete -c uv -n "__fish_uv_using_subcommand help" -l no-pager -d 'Disable pager when printing help'
complete -c uv -n "__fish_uv_using_subcommand help" -s n -l no-cache -d 'Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation'
complete -c uv -n "__fish_uv_using_subcommand help" -l managed-python -d 'Require use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-managed-python -d 'Disable use of uv-managed Python versions'
complete -c uv -n "__fish_uv_using_subcommand help" -l allow-python-downloads -d 'Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-python-downloads -d 'Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]'
complete -c uv -n "__fish_uv_using_subcommand help" -s q -l quiet -d 'Use quiet output'
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
complete -c uv -n "__fish_uv_using_subcommand help" -l no-installer-metadata -d 'Skip writing `uv` installer metadata files (e.g., `INSTALLER`, `REQUESTED`, and `direct_url.json`) to site-packages `.dist-info` directories'
complete -c uv -n "__fish_uv_using_subcommand help" -l no-config -d 'Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)'
complete -c uv -n "__fish_uv_using_subcommand help" -s h -l help -d 'Display the concise help for this command'
