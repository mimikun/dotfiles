function __fish_luarocks_print_command
    set -l cmdline (commandline -poc)
    set -l cmd
    set -e cmdline[1]
    for arg in $cmdline
        switch $arg
            case help
                set cmd $cmd help
                break
            case completion
                set cmd $cmd completion
                break
            case build
                set cmd $cmd build
                break
            case config
                set cmd $cmd config
                break
            case doc
                set cmd $cmd doc
                break
            case download
                set cmd $cmd download
                break
            case init
                set cmd $cmd init
                break
            case install
                set cmd $cmd install
                break
            case lint
                set cmd $cmd lint
                break
            case list
                set cmd $cmd list
                break
            case make
                set cmd $cmd make
                break
            case new_version new-version
                set cmd $cmd new_version
                break
            case pack
                set cmd $cmd pack
                break
            case path
                set cmd $cmd path
                break
            case purge
                set cmd $cmd purge
                break
            case remove
                set cmd $cmd remove
                break
            case search
                set cmd $cmd search
                break
            case show
                set cmd $cmd show
                break
            case test
                set cmd $cmd test
                break
            case unpack
                set cmd $cmd unpack
                break
            case upload
                set cmd $cmd upload
                break
            case which
                set cmd $cmd which
                break
            case write_rockspec write-rockspec
                set cmd $cmd write_rockspec
                break
        end
    end
    echo "$cmd"
end

function __fish_luarocks_using_command
    test (__fish_luarocks_print_command) = "$argv"
    and return 0
    or return 1
end

function __fish_luarocks_seen_command
    string match -q "$argv*" (__fish_luarocks_print_command)
    and return 0
    or return 1
end

complete -c luarocks -n '__fish_luarocks_using_command' -xa 'help' -d 'Show help for commands'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'completion' -d 'Output a shell completion script'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'build' -d 'Build/compile a rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'config' -d 'Query information about the LuaRocks configuration'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'doc' -d 'Show documentation for an installed rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'download' -d 'Download a specific rock file from a rocks server'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'init' -d 'Initialize a directory for a Lua project using LuaRocks'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'install' -d 'Install a rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'lint' -d 'Check syntax of a rockspec'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'list' -d 'List currently installed rocks'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'make' -d 'Compile package in current directory using a rockspec'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'new_version new-version' -d 'Auto-write a rockspec for a new version of a rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'pack' -d 'Create a rock, packing sources or binaries'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'path' -d 'Return the currently configured package path'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'purge' -d 'Remove all installed rocks from a tree'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'remove' -d 'Uninstall a rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'search' -d 'Query the LuaRocks servers'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'show' -d 'Show information about an installed rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'test' -d 'Run the test suite in the current directory'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'unpack' -d 'Unpack the contents of a rock'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'upload' -d 'Upload a rockspec to the public rocks repository'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'which' -d 'Tell which file corresponds to a given module name'
complete -c luarocks -n '__fish_luarocks_using_command' -xa 'write_rockspec write-rockspec' -d 'Write a template for a rockspec file'
complete -c luarocks -s h -l help -d 'Show this help message and exit'
complete -c luarocks -l version -d 'Show version info and exit'
complete -c luarocks -l dev -d 'Enable the sub-repositories in rocks servers for rockspecs of in-development versions'
complete -c luarocks -l server -l from -r -d 'Fetch rocks/rockspecs from this server (takes priority over config file)'
complete -c luarocks -l only-server -l only-from -r -d 'Fetch rocks/rockspecs from this server only (overrides any entries in the config file)'
complete -c luarocks -l only-sources -l only-sources-from -r -d 'Restrict downloads to paths matching the given URL'
complete -c luarocks -l namespace -r -d 'Specify the rocks server namespace to use'
complete -c luarocks -l lua-dir -r -d 'Which Lua installation to use'
complete -c luarocks -l lua-version -r -d 'Which Lua version to use'
complete -c luarocks -l tree -l to -r -d 'Which tree to operate on'
complete -c luarocks -l local -d 'Use the tree in the user\'s home directory'
complete -c luarocks -l global -d 'Use the system tree when `local_by_default` is `true`'
complete -c luarocks -l no-project -d 'Do not use project tree even if running from a project folder'
complete -c luarocks -l verbose -d 'Display verbose output of commands executed'
complete -c luarocks -l timeout -r -d 'Timeout on network operations, in seconds'
complete -c luarocks -l project-tree -r
complete -c luarocks -l pack-binary-rock
complete -c luarocks -l branch -r
complete -c luarocks -l sign

complete -c luarocks -n '__fish_luarocks_using_command help' -xa 'help completion build config doc download init install lint list make new_version new-version pack path purge remove search show test unpack upload which write_rockspec write-rockspec'
complete -c luarocks -n '__fish_luarocks_seen_command help' -s h -l help -d 'Show this help message and exit'

complete -c luarocks -n '__fish_luarocks_seen_command completion' -s h -l help -d 'Show this help message and exit'

complete -c luarocks -n '__fish_luarocks_seen_command build' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l only-deps -l deps-only -d 'Install only the dependencies of the rock'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l branch -r -d 'Override the `source.branch` field in the loaded rockspec'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l pin -d 'Create a luarocks.lock file listing the exact versions of each dependency found for this rock (recursively), and store it in the rock\'s directory'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l no-install -d 'Do not install the rock'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l no-doc -d 'Install the rock without its documentation'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l pack-binary-rock -d 'Do not install rock'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l keep -d 'Do not remove previously installed versions of the rock after building a new one'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l force -d 'If --keep is not specified, force removal of previously installed versions if it would break dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l force-fast -d 'Like --force, but performs a forced removal without reporting dependency issues'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l verify -d 'Verify signature of the rockspec or src.rock being built'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l sign -d 'To be used with --pack-binary-rock'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l check-lua-versions -d 'If the rock can\'t be found, check repository and report if it is available for another Lua version'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l pin -d 'Pin the exact dependencies used for the rockspecbeing built into a luarocks.lock file in the current directory'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l no-manifest -d 'Skip creating/updating the manifest'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l only-deps -l deps-only -d 'Install only the dependencies of the rock'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l deps-mode -xa 'all one order none' -d 'How to handle dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command build' -l nodeps

complete -c luarocks -n '__fish_luarocks_seen_command config' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command config' -l scope -xa 'system user project' -d 'The scope indicates which config file should be rewritten'
complete -c luarocks -n '__fish_luarocks_seen_command config' -l unset -d 'Delete the key from the configuration file'
complete -c luarocks -n '__fish_luarocks_seen_command config' -l json -d 'Output as JSON'
complete -c luarocks -n '__fish_luarocks_seen_command config' -l lua-incdir
complete -c luarocks -n '__fish_luarocks_seen_command config' -l lua-libdir
complete -c luarocks -n '__fish_luarocks_seen_command config' -l lua-ver
complete -c luarocks -n '__fish_luarocks_seen_command config' -l system-config
complete -c luarocks -n '__fish_luarocks_seen_command config' -l user-config
complete -c luarocks -n '__fish_luarocks_seen_command config' -l rock-trees

complete -c luarocks -n '__fish_luarocks_seen_command doc' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command doc' -l home -d 'Open the home page of project'
complete -c luarocks -n '__fish_luarocks_seen_command doc' -l list -d 'List documentation files only'
complete -c luarocks -n '__fish_luarocks_seen_command doc' -l porcelain -d 'Produce machine-friendly output'

complete -c luarocks -n '__fish_luarocks_seen_command download' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command download' -l all -d 'Download all files if there are multiple matches'
complete -c luarocks -n '__fish_luarocks_seen_command download' -l source -d 'Download .src.rock if available'
complete -c luarocks -n '__fish_luarocks_seen_command download' -l rockspec -d 'Download .rockspec if available'
complete -c luarocks -n '__fish_luarocks_seen_command download' -l arch -r -d 'Download rock for a specific architecture'
complete -c luarocks -n '__fish_luarocks_seen_command download' -l check-lua-versions -d 'If the rock can\'t be found, check repository and report if it is available for another Lua version'

complete -c luarocks -n '__fish_luarocks_seen_command init' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l reset -d 'Delete .luarocks/config-5.x.lua and ./lua and generate new ones'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l output -r -d 'Write the rockspec with the given filename'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l license -r -d 'A license string, such as "MIT/X11" or "GNU GPL v3"'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l summary -r -d 'A short one-line description summary'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l detailed -r -d 'A longer description string'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l homepage -r -d 'Project homepage'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l lua-versions -xa '5.1 5.2 5.3 5.4 5.1,5.2 5.2,5.3 5.3,5.4 5.1,5.2,5.3 5.2,5.3,5.4 5.1,5.2,5.3,5.4' -d 'Supported Lua versions'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l rockspec-format -r -d 'Rockspec format version, such as "1.0" or "1.1"'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l tag -r -d 'Tag to use'
complete -c luarocks -n '__fish_luarocks_seen_command init' -l lib -r -d 'A comma-separated list of libraries that C files need to link to'

complete -c luarocks -n '__fish_luarocks_seen_command install' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l keep -d 'Do not remove previously installed versions of the rock after building a new one'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l force -d 'If --keep is not specified, force removal of previously installed versions if it would break dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l force-fast -d 'Like --force, but performs a forced removal without reporting dependency issues'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l only-deps -l deps-only -d 'Install only the dependencies of the rock'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l no-doc -d 'Install the rock without its documentation'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l verify -d 'Verify signature of the rockspec or src.rock being built'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l check-lua-versions -d 'If the rock can\'t be found, check repository and report if it is available for another Lua version'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l deps-mode -xa 'all one order none' -d 'How to handle dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l nodeps
complete -c luarocks -n '__fish_luarocks_seen_command install' -l no-manifest -d 'Skip creating/updating the manifest'
complete -c luarocks -n '__fish_luarocks_seen_command install' -l pin -d 'If the installed rock is a Lua module, create a luarocks.lock file listing the exact versions of each dependency found for this rock (recursively), and store it in the rock\'s directory'

complete -c luarocks -n '__fish_luarocks_seen_command lint' -s h -l help -d 'Show this help message and exit'

complete -c luarocks -n '__fish_luarocks_seen_command list' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command list' -l outdated -d 'List only rocks for which there is a higher version available in the rocks server'
complete -c luarocks -n '__fish_luarocks_seen_command list' -l porcelain -d 'Produce machine-friendly output'

complete -c luarocks -n '__fish_luarocks_seen_command make' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l no-install -d 'Do not install the rock'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l no-doc -d 'Install the rock without its documentation'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l pack-binary-rock -d 'Do not install rock'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l keep -d 'Do not remove previously installed versions of the rock after building a new one'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l force -d 'If --keep is not specified, force removal of previously installed versions if it would break dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l force-fast -d 'Like --force, but performs a forced removal without reporting dependency issues'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l verify -d 'Verify signature of the rockspec or src.rock being built'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l sign -d 'To be used with --pack-binary-rock'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l check-lua-versions -d 'If the rock can\'t be found, check repository and report if it is available for another Lua version'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l pin -d 'Pin the exact dependencies used for the rockspecbeing built into a luarocks.lock file in the current directory'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l no-manifest -d 'Skip creating/updating the manifest'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l only-deps -l deps-only -d 'Install only the dependencies of the rock'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l deps-mode -xa 'all one order none' -d 'How to handle dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command make' -l nodeps

complete -c luarocks -n '__fish_luarocks_seen_command new_version' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command new_version' -l dir -r -d 'Output directory for the new rockspec'
complete -c luarocks -n '__fish_luarocks_seen_command new_version' -l tag -r -d 'New SCM tag'

complete -c luarocks -n '__fish_luarocks_seen_command pack' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command pack' -l sign -d 'Produce a signature file as well'

complete -c luarocks -n '__fish_luarocks_seen_command path' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l no-bin -d 'Do not export the PATH variable'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l append -d 'Appends the paths to the existing paths'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l lr-path -d 'Exports the Lua path (not formatted as shell command)'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l lr-cpath -d 'Exports the Lua cpath (not formatted as shell command)'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l lr-bin -d 'Exports the system path (not formatted as shell command)'
complete -c luarocks -n '__fish_luarocks_seen_command path' -l bin

complete -c luarocks -n '__fish_luarocks_seen_command purge' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command purge' -l old-versions -d 'Keep the highest-numbered version of each rock and remove the other ones'
complete -c luarocks -n '__fish_luarocks_seen_command purge' -l force -d 'If --old-versions is specified, force removal of previously installed versions if it would break dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command purge' -l force-fast -d 'Like --force, but performs a forced removal without reporting dependency issues'

complete -c luarocks -n '__fish_luarocks_seen_command remove' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command remove' -l force -d 'Force removal if it would break dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command remove' -l force-fast -d 'Perform a forced removal without reporting dependency issues'
complete -c luarocks -n '__fish_luarocks_seen_command remove' -l deps-mode -xa 'all one order none' -d 'How to handle dependencies'
complete -c luarocks -n '__fish_luarocks_seen_command remove' -l nodeps

complete -c luarocks -n '__fish_luarocks_seen_command search' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command search' -l source -d 'Return only rockspecs and source rocks, to be used with the "build" command'
complete -c luarocks -n '__fish_luarocks_seen_command search' -l binary -d 'Return only pure Lua and binary rocks (rocks that can be used with the "install" command without requiring a C toolchain)'
complete -c luarocks -n '__fish_luarocks_seen_command search' -l all -d 'List all contents of the server that are suitable to this platform, do not filter by name'
complete -c luarocks -n '__fish_luarocks_seen_command search' -l porcelain -d 'Return a machine readable format'

complete -c luarocks -n '__fish_luarocks_seen_command show' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l home -d 'Show home page of project'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l modules -d 'Show all modules provided by the package as used by require()'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l deps -d 'Show packages the package depends on'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l build-deps -d 'Show build-only dependencies for the package'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l test-deps -d 'Show dependencies for testing the package'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l rockspec -d 'Show the full path of the rockspec file'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l mversion -d 'Show the package version'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l rock-tree -d 'Show local tree where rock is installed'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l rock-namespace -d 'Show rock namespace'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l rock-dir -d 'Show data directory of the installed rock'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l rock-license -d 'Show rock license'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l issues -d 'Show URL for project\'s issue tracker'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l labels -d 'List the labels of the rock'
complete -c luarocks -n '__fish_luarocks_seen_command show' -l porcelain -d 'Produce machine-friendly output'

complete -c luarocks -n '__fish_luarocks_seen_command test' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command test' -l prepare -d 'Only install dependencies needed for testing only, but do not run the test'
complete -c luarocks -n '__fish_luarocks_seen_command test' -l test-type -r -d 'Specify the test suite type manually if it was not specified in the rockspec and it could not be auto-detected'

complete -c luarocks -n '__fish_luarocks_seen_command unpack' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command unpack' -l force -d 'Unpack files even if the output directory already exists'
complete -c luarocks -n '__fish_luarocks_seen_command unpack' -l check-lua-versions -d 'If the rock can\'t be found, check repository and report if it is available for another Lua version'

complete -c luarocks -n '__fish_luarocks_seen_command upload' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l skip-pack -d 'Do not pack and send source rock'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l api-key -r -d 'Pass an API key'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l temp-key -r -d 'Use the given a temporary API key in this invocation only'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l force -d 'Replace existing rockspec if the same revision of a module already exists'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l sign -d 'Upload a signature file alongside each file as well'
complete -c luarocks -n '__fish_luarocks_seen_command upload' -l debug

complete -c luarocks -n '__fish_luarocks_seen_command which' -s h -l help -d 'Show this help message and exit'

complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -s h -l help -d 'Show this help message and exit'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l output -r -d 'Write the rockspec with the given filename'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l license -r -d 'A license string, such as "MIT/X11" or "GNU GPL v3"'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l summary -r -d 'A short one-line description summary'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l detailed -r -d 'A longer description string'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l homepage -r -d 'Project homepage'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l lua-versions -xa '5.1 5.2 5.3 5.4 5.1,5.2 5.2,5.3 5.3,5.4 5.1,5.2,5.3 5.2,5.3,5.4 5.1,5.2,5.3,5.4' -d 'Supported Lua versions'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l rockspec-format -r -d 'Rockspec format version, such as "1.0" or "1.1"'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l tag -r -d 'Tag to use'
complete -c luarocks -n '__fish_luarocks_seen_command write_rockspec' -l lib -r -d 'A comma-separated list of libraries that C files need to link to'
