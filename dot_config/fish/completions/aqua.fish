# aqua fish shell completion

function __fish_aqua_no_subcommand --description 'Test if there has been any subcommand yet'
    for i in (commandline -opc)
        if contains -- $i info init policy allow deny init init-policy install i update-aqua upa generate g which exec list generate-registry gr completion bash zsh fish help h help h version cp root-dir update-checksum upc remove rm update up help h
            return 1
        end
    end
    return 0
end

complete -c aqua -n '__fish_aqua_no_subcommand' -f -l log-level -r -d 'log level'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l config -s c -r -d 'configuration file path'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l disable-cosign -d 'Disable Cosign verification'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l disable-slsa -d 'Disable SLSA verification'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l disable-github-artifact-attestation -d 'Disable GitHub Artifact Attestations verification'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l trace -r -d 'trace output file path'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l cpu-profile -r -d 'cpu profile output file path'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l help -s h -d 'show help'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l version -s v -d 'print the version'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l help -s h -d 'show help'
complete -c aqua -n '__fish_aqua_no_subcommand' -f -l version -s v -d 'print the version'
complete -c aqua -n '__fish_seen_subcommand_from info' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'info' -d 'Show information'
complete -c aqua -n '__fish_seen_subcommand_from init' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'init' -d 'Create a configuration file if it doesn\'t exist'
complete -c aqua -n '__fish_seen_subcommand_from policy' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'policy' -d 'Manage Policy'
complete -c aqua -n '__fish_seen_subcommand_from allow' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from policy' -a 'allow' -d 'Allow a policy file'
complete -c aqua -n '__fish_seen_subcommand_from deny' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from policy' -a 'deny' -d 'Deny a policy file'
complete -c aqua -n '__fish_seen_subcommand_from init' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from policy' -a 'init' -d 'Create a policy file if it doesn\'t exist'
complete -c aqua -n '__fish_seen_subcommand_from init-policy' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'init-policy' -d '[Deprecated] Create a policy file if it doesn\'t exist'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'install i' -d 'Install tools'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l only-link -s l -d 'create links but skip downloading packages'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l test -d 'This flag was deprecated and had no meaning from aqua v2.0.0. This flag will be removed in aqua v3.0.0. https://github.com/aquaproj/aqua/issues/1691'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l all -s a -d 'install all aqua configuration packages'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l tags -s t -r -d 'filter installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from install i' -f -l exclude-tags -r -d 'exclude installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from update-aqua upa' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'update-aqua upa' -d 'Update aqua'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'generate g' -d 'Search packages in registries and output the configuration interactively'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l f -r -d 'the file path of packages list. When the value is "-", the list is passed from the standard input'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l i -d 'Insert packages to configuration file'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l pin -d 'Pin version'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l g -d 'Insert packages in a global configuration file'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l detail -s d -d 'Output additional fields such as description and link'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l o -r -d 'inserted file'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l select-version -s s -d 'Select the installed version interactively. Default to display 30 versions, use --limit/-l to change it.'
complete -c aqua -n '__fish_seen_subcommand_from generate g' -f -l limit -s l -r -d 'The maximum number of versions. Non-positive number refers to no limit.'
complete -c aqua -n '__fish_seen_subcommand_from which' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'which' -d 'Output the absolute file path of the given command'
complete -c aqua -n '__fish_seen_subcommand_from which' -f -l version -s v -d 'Output the given package version'
complete -c aqua -n '__fish_seen_subcommand_from exec' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'exec' -d 'Execute tool'
complete -c aqua -n '__fish_seen_subcommand_from list' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'list' -d 'List packages in Registries'
complete -c aqua -n '__fish_seen_subcommand_from list' -f -l installed -s i -d 'List installed packages'
complete -c aqua -n '__fish_seen_subcommand_from list' -f -l all -s a -d 'List global configuration packages too'
complete -c aqua -n '__fish_seen_subcommand_from generate-registry gr' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'generate-registry gr' -d 'Generate a registry\'s package configuration'
complete -c aqua -n '__fish_seen_subcommand_from generate-registry gr' -f -l out-testdata -r -d 'A file path where the testdata is outputted'
complete -c aqua -n '__fish_seen_subcommand_from generate-registry gr' -f -l cmd -r -d 'A list of commands joined with commas \',\''
complete -c aqua -n '__fish_seen_subcommand_from generate-registry gr' -f -l limit -s l -r -d 'the maximum number of versions'
complete -c aqua -n '__fish_seen_subcommand_from generate-registry gr' -f -l deep -d 'This flag was deprecated and had no meaning from aqua v2.15.0. This flag will be removed in aqua v3.0.0. https://github.com/aquaproj/aqua/issues/2351'
complete -c aqua -n '__fish_seen_subcommand_from completion' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'completion' -d 'Output shell completion script for bash, zsh, or fish'
complete -c aqua -n '__fish_seen_subcommand_from completion' -f -l help -s h -d 'show help'
complete -c aqua -n '__fish_seen_subcommand_from bash' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from completion' -a 'bash' -d 'Output shell completion script for bash'
complete -c aqua -n '__fish_seen_subcommand_from zsh' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from completion' -a 'zsh' -d 'Output shell completion script for zsh'
complete -c aqua -n '__fish_seen_subcommand_from fish' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from completion' -a 'fish' -d 'Output shell completion script for fish'
complete -c aqua -n '__fish_seen_subcommand_from fish' -f -l help -s h -d 'show help'
complete -c aqua -n '__fish_seen_subcommand_from help h' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from fish' -a 'help h' -d 'Shows a list of commands or help for one command'
complete -c aqua -n '__fish_seen_subcommand_from help h' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_seen_subcommand_from completion' -a 'help h' -d 'Shows a list of commands or help for one command'
complete -c aqua -n '__fish_seen_subcommand_from version' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'version' -d 'Show version'
complete -c aqua -n '__fish_seen_subcommand_from cp' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'cp' -d 'Copy executable files in a directory'
complete -c aqua -n '__fish_seen_subcommand_from cp' -f -l o -r -d 'destination directory'
complete -c aqua -n '__fish_seen_subcommand_from cp' -f -l all -s a -d 'install all aqua configuration packages'
complete -c aqua -n '__fish_seen_subcommand_from cp' -f -l tags -s t -r -d 'filter installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from cp' -f -l exclude-tags -r -d 'exclude installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from root-dir' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'root-dir' -d 'Output the aqua root directory (AQUA_ROOT_DIR)'
complete -c aqua -n '__fish_seen_subcommand_from update-checksum upc' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'update-checksum upc' -d 'Create or Update aqua-checksums.json'
complete -c aqua -n '__fish_seen_subcommand_from update-checksum upc' -f -l all -s a -d 'Create or Update all aqua-checksums.json including global configuration'
complete -c aqua -n '__fish_seen_subcommand_from update-checksum upc' -f -l deep -d 'This flag was deprecated and had no meaning from aqua v2.0.0. This flag will be removed in aqua v3.0.0. https://github.com/aquaproj/aqua/issues/1769'
complete -c aqua -n '__fish_seen_subcommand_from update-checksum upc' -f -l prune -d 'Remove unused checksums'
complete -c aqua -n '__fish_seen_subcommand_from remove rm' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'remove rm' -d 'Uninstall packages'
complete -c aqua -n '__fish_seen_subcommand_from remove rm' -f -l all -s a -d 'uninstall all packages'
complete -c aqua -n '__fish_seen_subcommand_from remove rm' -f -l mode -s m -r -d 'Removed target modes. l: link, p: package'
complete -c aqua -n '__fish_seen_subcommand_from remove rm' -f -l i -d 'Select packages with a Fuzzy Finder'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'update up' -d 'Update registries and packages'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l i -d 'Select packages with fuzzy finder'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l select-version -s s -d 'Select the version with fuzzy finder. Default to display 30 versions, use --limit/-l to change it.'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l only-registry -s r -d 'Update only registries'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l only-package -s p -d 'Update only packages'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l limit -s l -r -d 'The maximum number of versions. Non-positive number refers to no limit.'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l tags -s t -r -d 'filter installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from update up' -f -l exclude-tags -r -d 'exclude installed packages with tags'
complete -c aqua -n '__fish_seen_subcommand_from help h' -f -l help -s h -d 'show help'
complete -r -c aqua -n '__fish_aqua_no_subcommand' -a 'help h' -d 'Shows a list of commands or help for one command'

