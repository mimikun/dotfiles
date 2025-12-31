# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rbw_global_optspecs
	string join \n h/help V/version
end

function __fish_rbw_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rbw_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rbw_using_subcommand
	set -l cmd (__fish_rbw_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rbw -n "__fish_rbw_needs_command" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_needs_command" -s V -l version -d 'Print version'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "config" -d 'Get or set configuration options'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "register" -d 'Register this device with the Bitwarden server'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "login" -d 'Log in to the Bitwarden server'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "unlock" -d 'Unlock the local Bitwarden database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "unlocked" -d 'Check if the local Bitwarden database is unlocked'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "sync" -d 'Update the local copy of the Bitwarden database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "list" -d 'List all entries in the local Bitwarden database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "ls" -d 'List all entries in the local Bitwarden database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "get" -d 'Display the password for a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "search" -d 'Search for entries'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "code" -d 'Display the authenticator code for a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "totp" -d 'Display the authenticator code for a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "add" -d 'Add a new password to the database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "generate" -d 'Generate a new password'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "gen" -d 'Generate a new password'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "edit" -d 'Modify an existing password'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "remove" -d 'Remove a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "rm" -d 'Remove a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "history" -d 'View the password history for a given entry'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "lock" -d 'Lock the password database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "purge" -d 'Remove the local copy of the password database'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "stop-agent" -d 'Terminate the background agent'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "gen-completions" -d 'Generate completion script for the given shell'
complete -c rbw -n "__fish_rbw_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rbw -n "__fish_rbw_using_subcommand config; and not __fish_seen_subcommand_from show set unset help" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand config; and not __fish_seen_subcommand_from show set unset help" -f -a "show" -d 'Show the values of all configuration settings'
complete -c rbw -n "__fish_rbw_using_subcommand config; and not __fish_seen_subcommand_from show set unset help" -f -a "set" -d 'Set a configuration option'
complete -c rbw -n "__fish_rbw_using_subcommand config; and not __fish_seen_subcommand_from show set unset help" -f -a "unset" -d 'Reset a configuration option to its default'
complete -c rbw -n "__fish_rbw_using_subcommand config; and not __fish_seen_subcommand_from show set unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show the values of all configuration settings'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a configuration option'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Reset a configuration option to its default'
complete -c rbw -n "__fish_rbw_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rbw -n "__fish_rbw_using_subcommand register" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rbw -n "__fish_rbw_using_subcommand login" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand unlock" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand unlocked" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand sync" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand list" -l fields -d 'Fields to display. Available options are id, name, user, folder, type. Multiple fields will be separated by tabs.' -r
complete -c rbw -n "__fish_rbw_using_subcommand list" -l raw -d 'Display output as JSON'
complete -c rbw -n "__fish_rbw_using_subcommand list" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand ls" -l fields -d 'Fields to display. Available options are id, name, user, folder, type. Multiple fields will be separated by tabs.' -r
complete -c rbw -n "__fish_rbw_using_subcommand ls" -l raw -d 'Display output as JSON'
complete -c rbw -n "__fish_rbw_using_subcommand ls" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand get" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand get" -s f -l field -d 'Field to get' -r
complete -c rbw -n "__fish_rbw_using_subcommand get" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand get" -l full -d 'Display the notes in addition to the password'
complete -c rbw -n "__fish_rbw_using_subcommand get" -l raw -d 'Display output as JSON'
complete -c rbw -n "__fish_rbw_using_subcommand get" -s c -l clipboard -d 'Copy result to clipboard'
complete -c rbw -n "__fish_rbw_using_subcommand get" -s l -l list-fields -d 'List fields in this entry'
complete -c rbw -n "__fish_rbw_using_subcommand get" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand search" -l fields -d 'Fields to display. Available options are id, name, user, folder. Multiple fields will be separated by tabs.' -r
complete -c rbw -n "__fish_rbw_using_subcommand search" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand search" -l raw -d 'Display output as JSON'
complete -c rbw -n "__fish_rbw_using_subcommand search" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand code" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand code" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand code" -l clipboard -d 'Copy result to clipboard'
complete -c rbw -n "__fish_rbw_using_subcommand code" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand totp" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand totp" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand totp" -l clipboard -d 'Copy result to clipboard'
complete -c rbw -n "__fish_rbw_using_subcommand totp" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand add" -l uri -d 'URI for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand add" -l folder -d 'Folder for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l uri -d 'URI for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l folder -d 'Folder for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l no-symbols -d 'Generate a password with no special characters'
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l only-numbers -d 'Generate a password consisting of only numbers'
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l nonconfusables -d 'Generate a password without visually similar characters (useful for passwords intended to be written down)'
complete -c rbw -n "__fish_rbw_using_subcommand generate" -l diceware -d 'Generate a password of multiple dictionary words chosen from the EFF word list. The len parameter for this option will set the number of words to generate, rather than characters.'
complete -c rbw -n "__fish_rbw_using_subcommand generate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l uri -d 'URI for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l folder -d 'Folder for the password entry' -r
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l no-symbols -d 'Generate a password with no special characters'
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l only-numbers -d 'Generate a password consisting of only numbers'
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l nonconfusables -d 'Generate a password without visually similar characters (useful for passwords intended to be written down)'
complete -c rbw -n "__fish_rbw_using_subcommand gen" -l diceware -d 'Generate a password of multiple dictionary words chosen from the EFF word list. The len parameter for this option will set the number of words to generate, rather than characters.'
complete -c rbw -n "__fish_rbw_using_subcommand gen" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rbw -n "__fish_rbw_using_subcommand edit" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand edit" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rbw -n "__fish_rbw_using_subcommand remove" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand remove" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand remove" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand rm" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand rm" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand rm" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand history" -l folder -d 'Folder name to search in' -r
complete -c rbw -n "__fish_rbw_using_subcommand history" -s i -l ignorecase -d 'Ignore case'
complete -c rbw -n "__fish_rbw_using_subcommand history" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand lock" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand purge" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand stop-agent" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand gen-completions" -s h -l help -d 'Print help'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "config" -d 'Get or set configuration options'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "register" -d 'Register this device with the Bitwarden server'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "login" -d 'Log in to the Bitwarden server'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "unlock" -d 'Unlock the local Bitwarden database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "unlocked" -d 'Check if the local Bitwarden database is unlocked'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "sync" -d 'Update the local copy of the Bitwarden database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "list" -d 'List all entries in the local Bitwarden database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "get" -d 'Display the password for a given entry'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "search" -d 'Search for entries'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "code" -d 'Display the authenticator code for a given entry'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "add" -d 'Add a new password to the database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "generate" -d 'Generate a new password'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "edit" -d 'Modify an existing password'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "remove" -d 'Remove a given entry'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "history" -d 'View the password history for a given entry'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "lock" -d 'Lock the password database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "purge" -d 'Remove the local copy of the password database'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "stop-agent" -d 'Terminate the background agent'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "gen-completions" -d 'Generate completion script for the given shell'
complete -c rbw -n "__fish_rbw_using_subcommand help; and not __fish_seen_subcommand_from config register login unlock unlocked sync list get search code add generate edit remove history lock purge stop-agent gen-completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rbw -n "__fish_rbw_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Show the values of all configuration settings'
complete -c rbw -n "__fish_rbw_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Set a configuration option'
complete -c rbw -n "__fish_rbw_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "unset" -d 'Reset a configuration option to its default'
function __fish_rbw_get_completion_name
    set -l cmd (commandline -xpc)
    set -e cmd[1] # rbw

    argparse -i folder= f/field= full raw clipboard i/ignorecase h/help l/list-fields -- $cmd
    set -e argv[1] # get

    set -l candidates (command rbw list --fields name,folder,user)
    # if folder is set, filter by it
    if set -q _flag_folder
        set candidates (printf '%s\n' $candidates | string match -er "^[^\t]*\t$_flag_folder\t")
    end

    switch (count $argv)
        case 0
            # print completion for NAME argument in the format of
            # NAME   (USERNAME [FOLDER])
            printf '%s\n' $candidates | while read -l line
                set --local parts (string split \t $line)

                set --local _name $parts[1]
                set --local _folder $parts[2]
                set --local _user $parts[3]

                if test -n "$_folder"
                    printf '%s\t%s [%s]\n' $_name $_user $_folder
                else
                    printf '%s\t%s\n' $_name $_user
                end
            end
        case 1
            # filter by NAME
            set candidates (printf '%s\n' $candidates | string match -er "^$argv[1]\t")
            # print completion for USER argument in the format of
            # USER   ([FOLDER])
            printf '%s\n' $candidates | while read -l line
                set --local parts (string split \t $line)

                set --local _user $parts[3]
                if test "$_user" != ""
                    # non-empty
                    set --local _folder $parts[2]
                    if test -n "$_folder"
                        printf '%s\t[%s]\n' $_user $_folder
                    else
                        printf '%s\n' $_user
                    end
                end
            end
    end
end

function __fish_rbw_get_completion_fields
    set -l cmd (commandline -xpc)
    set -e cmd[1] # rbw
    if test -z "$(commandline -xpt)"
        set -e cmd[-1] # -f/--field
    end

    argparse -i folder= f/field= full raw clipboard i/ignorecase h/help l/list-fields -- $cmd
    set -e argv[1] # get

    if test (count $argv) -gt 0
        command rbw get "$argv[1]" --list-fields 2>/dev/null
    end
end

complete -f -c rbw -n '__fish_seen_subcommand_from get edit' -a '(__fish_rbw_get_completion_name)'

# Complete options for `rbw get`
complete -f -c rbw -n '__fish_seen_subcommand_from get' -s i -l ignorecase -d 'Ignore case'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -s f -l field -r -d 'Field to get' -a '(__fish_rbw_get_completion_fields)'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -s l -l list-fields -r -d 'List fields in this entry'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -l folder -r -d 'Folder name to search in' -a '(command rbw list --fields folder)'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -l full -d 'Display the notes in addition to the password'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -l raw -d 'Display output as JSON'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -s c -l clipboard -d 'Copy result to clipboard'
complete -f -c rbw -n '__fish_seen_subcommand_from get' -s h -l help -d 'Print help'

