# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_berg_global_optspecs
	string join \n output-mode= non-interactive w/max-width= owner-repo= h/help V/version
end

function __fish_berg_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_berg_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_berg_using_subcommand
	set -l cmd (__fish_berg_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c berg -n "__fish_berg_needs_command" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_needs_command" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_needs_command" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_needs_command" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_needs_command" -s V -l version -d 'Print version'
complete -c berg -n "__fish_berg_needs_command" -f -a "api" -d 'API subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "auth" -d 'Authentication subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "config" -d 'Config subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "user" -d 'User subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "issue" -d 'Issue subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "pull" -d 'Pull request subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "label" -d 'Label subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "release" -d 'Release subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "repo" -d 'Repository subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "milestone" -d 'Milestone subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "notification" -d 'Notification subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "keys" -d 'Key management subcommands'
complete -c berg -n "__fish_berg_needs_command" -f -a "completion" -d 'Print completion script'
complete -c berg -n "__fish_berg_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -f -a "version" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand api; and not __fish_seen_subcommand_from version help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from version" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from version" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from version" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from version" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from version" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from help" -f -a "version" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand api; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -f -a "login" -d 'Login via generating authentication token'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -f -a "logout" -d 'Logout. Delete currently stored authentication token'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -f -a "list" -d 'List all forgejo instances you\'re authenticated for'
complete -c berg -n "__fish_berg_using_subcommand auth; and not __fish_seen_subcommand_from login logout list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -s t -l token -d 'Access Token' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -s s -l skip-confirmation -d 'flag that skips the confirmation dialog if set'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d 'Login via generating authentication token'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Logout. Delete currently stored authentication token'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all forgejo instances you\'re authenticated for'
complete -c berg -n "__fish_berg_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -f -a "info" -d 'Display short overview of which config values are used'
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -f -a "generate" -d 'Generate standard configuration at certain locations'
complete -c berg -n "__fish_berg_using_subcommand config; and not __fish_seen_subcommand_from info generate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from info" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from info" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from info" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from info" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -s l -l location -d 'Specify location at which default config should be dumped' -r -f -a "global\t''
local\t''
stdout\t''"
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -s r -l replace -d 'Specifies whether overwriting already existing configs is allowed'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from generate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "info" -d 'Display short overview of which config values are used'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "generate" -d 'Generate standard configuration at certain locations'
complete -c berg -n "__fish_berg_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -f -a "info" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand user; and not __fish_seen_subcommand_from info help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from info" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from info" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from info" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from info" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "info" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "list" -d 'List all issues in the current repository'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "comment" -d 'Add a comment to selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "view" -d 'View details of selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and not __fish_seen_subcommand_from list create comment view edit help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -s s -l state -d 'Filter by state' -r -f -a "closed\t''
open\t''
all\t''"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s t -l title -d 'Title or summary' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s l -l labels -d 'Comma-delimited list of label ids' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s d -l description -d 'Main description of issue' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s a -l assignees -d 'Comma-delimited list of assignee names' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s m -l milestone -d 'Name of the milestone the issue is related to' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -s n -l number -d 'number of the issue to comment' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -s b -l body -d 'text body of the issue' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from comment" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -s s -l state -d 'Select from issues with the chosen state' -r -f -a "closed\t''
open\t''
all\t''"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -s c -l comments -d 'Disabled: display issue summary | Enabled: display issue comment history'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s t -l title -d 'Change title or summary' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s l -l labels -d 'Change comma-delimited list of label ids (this overwrites existing labels)' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s d -l description -d 'Changes main description of issue' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s a -l assignees -d 'Changes comma-delimited list of assignee names (this overwrites existing assignees)' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s m -l milestone -d 'Changes the milestone the issue is related to' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s s -l state -d 'Changes the state of the issue' -r -f -a "closed\t''
open\t''"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all issues in the current repository'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "comment" -d 'Add a comment to selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "view" -d 'View details of selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand issue; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "list" -d 'List pull requests'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "create" -d 'Create a pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "edit" -d 'Edit pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "view" -d 'View details of a selected pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "comment" -d 'Add comment to selected pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and not __fish_seen_subcommand_from list create edit view comment help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -l sort -d 'Sort using a certain criteria' -r -f -a "oldest\t''
recentupdate\t''
leastupdate\t''
mostcomment\t''
leastcomment\t''
priority\t''"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -s s -l state -d 'Filter pull requests with the chosen state' -r -f -a "closed\t''
open\t''
all\t''"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s a -l assignees -d 'Comma-delimited list of assignee names' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s t -l target-branch -d 'Target branch for the pull request' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s d -l description -d 'Main description of the pull request' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s s -l source-branch -d 'Source branch of the pull request' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s l -l labels -d 'Comma-delimited list of labels' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -l title -d 'Title or summary' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s m -l milestone -d 'Name of the milestone the pull request is related to' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s i -l interactive -d 'Interactive mode which guides the user through optional argument options'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from edit" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from edit" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from edit" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from edit" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -s s -l state -d 'Select from pull requests with the chosen state' -r -f -a "closed\t''
open\t''
all\t''"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -s c -l comments -d 'Disabled: display issue summary | Enabled: display issue comment history'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from comment" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from comment" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from comment" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from comment" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from comment" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "list" -d 'List pull requests'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "view" -d 'View details of a selected pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "comment" -d 'Add comment to selected pull request'
complete -c berg -n "__fish_berg_using_subcommand pull; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -f -a "list" -d 'List all labels in the current repository'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -f -a "create" -d 'Create a label'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -f -a "delete" -d 'Delete a label'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -f -a "edit" -d 'Edit selected label'
complete -c berg -n "__fish_berg_using_subcommand label; and not __fish_seen_subcommand_from list create delete edit help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -s c -l count -d 'Number of labels to be displayed' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -s n -l name -d 'Label name' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -s c -l color -d 'Label color (in hex format "#abcdef")' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -s d -l description -d 'Label purpose description' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from delete" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from delete" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from delete" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from delete" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from edit" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from edit" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from edit" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from edit" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all labels in the current repository'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a label'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a label'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit selected label'
complete -c berg -n "__fish_berg_using_subcommand label; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -f -a "create" -d 'Create a release'
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -f -a "list" -d 'List all releases in the current repository'
complete -c berg -n "__fish_berg_using_subcommand release; and not __fish_seen_subcommand_from create list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -s d -l description -d 'Main description of release' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -s n -l name -d 'Release name' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -s t -l tag -d 'Name of the tag to be released' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a release'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all releases in the current repository'
complete -c berg -n "__fish_berg_using_subcommand release; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "create" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "clone" -d 'Clone a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "delete" -d 'Delete a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "fork" -d 'Fork a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "info" -d 'Display short summary of the current repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "assignees" -d 'List available assignee candidates'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "migrate" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "list" -d 'List user current active repositories'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "open" -d 'Open the current repository in the browser'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "branch" -d 'Branch subcommands'
complete -c berg -n "__fish_berg_using_subcommand repo; and not __fish_seen_subcommand_from create clone delete fork info assignees migrate list open branch help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l default-branch -d 'Main branch to init repository with (usually "main")' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -s d -l description -d 'Repository description' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l org -d 'Organization name' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -s n -l name -d 'Repository name' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -s p -l private -d 'Repository visibility' -r -f -a "private\t''
public\t''"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l and-push-from -d 'Whether or not to clone the repo after creating it remotely' -r -F
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l and-clone -d 'Whether or not to clone the repo after creating it remotely'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -l use-ssh -d 'Whether or not to clone via ssh'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from clone" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from delete" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from delete" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from delete" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from delete" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from fork" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from fork" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from fork" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from fork" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from fork" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from info" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from info" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from info" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from info" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from assignees" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from assignees" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from assignees" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from assignees" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from assignees" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s c -l clone-addr -d 'The repository that\'s going to be migrated to forgejo' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -l description -d 'The description of the repository *after* migration' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s p -l private -d 'The visibility of the repository *after* migration' -r -f -a "private\t''
public\t''"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s r -l repo-name -d 'The repository name *after* the migration' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s s -l service -d 'The kind of service, we\'re going to migrate *from* (source location of repository)' -r -f -a "git\t''
github\t''
gitea\t''
gitlab\t''
gogs\t''
onedev\t''
gitbucket\t''
codebase\t''"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from migrate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -s o -l order-by -d 'Order the displayed repositories by different criteria' -r -f -a "name\t''
id\t''
newest\t''
oldest\t''
recentupdate\t''
leastupdate\t''
reversealphabetically\t''
alphabetically\t''
reversesize\t''
size\t''
reversegitsize\t''
gitsize\t''
reverselfssize\t''
lfssize\t''
moststars\t''
feweststars\t''
mostforks\t''
fewestforks\t''"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from open" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from open" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from open" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from open" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -f -a "list" -d 'List branches'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -f -a "delete" -d 'Delete a branch'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from branch" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "clone" -d 'Clone a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "fork" -d 'Fork a repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "info" -d 'Display short summary of the current repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "assignees" -d 'List available assignee candidates'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "migrate" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "list" -d 'List user current active repositories'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open the current repository in the browser'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "branch" -d 'Branch subcommands'
complete -c berg -n "__fish_berg_using_subcommand repo; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -f -a "list" -d 'List all milestones in the current repository'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -f -a "view" -d 'View details of selected milestone'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand milestone; and not __fish_seen_subcommand_from list view create edit help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -s c -l count -d 'Number of milestones to be displayed' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -s s -l state -d 'Select from milestones with the chosen state' -r -f -a "closed\t''
open\t''
all\t''"
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -s t -l title -d 'Title or summary' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -s d -l description -d 'Main description of milestone' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from edit" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from edit" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from edit" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from edit" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all milestones in the current repository'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from help" -f -a "view" -d 'View details of selected milestone'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand milestone; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -f -a "list"
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -f -a "view"
complete -c berg -n "__fish_berg_using_subcommand notification; and not __fish_seen_subcommand_from list view help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -l status-types -d 'filter notifications by status' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -l subject-type -d 'filter notifications by subject type' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s p -l page -d 'control how many pages of notifications should be shown' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s l -l limit -d 'control how many notifications each page should hold' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s a -l all -d 'just list everything'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s d -l dates -d 'filter notifications by date'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -s a -l all -d 'show everything about the notification if available'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from help" -f -a "list"
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from help" -f -a "view"
complete -c berg -n "__fish_berg_using_subcommand notification; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -f -a "gpg" -d 'Gpg key management'
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -f -a "ssh" -d 'Ssh key management'
complete -c berg -n "__fish_berg_using_subcommand keys; and not __fish_seen_subcommand_from gpg ssh help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -f -a "list" -d 'List all available gpg keys'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -f -a "add" -d 'Upload a new gpg public key, attaching it to your profile'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -f -a "remove" -d 'Remove a gpg key from your profile'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -f -a "verify" -d 'Verify a gpg key from your profile'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from gpg" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -f -a "list" -d 'List all available gpg keys'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -f -a "add" -d 'Upload a new ssh public key, attaching it to your profile'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -f -a "remove" -d 'Remove a ssh key from your profile'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from ssh" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "gpg" -d 'Gpg key management'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "ssh" -d 'Ssh key management'
complete -c berg -n "__fish_berg_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand completion" -l output-mode -d 'How to display the responses of the forgejo instance if there are any' -r -f -a "pretty\t'Pretty output with tables rendered in the terminal'
json\t'Raw json output for further use with pipes etc'"
complete -c berg -n "__fish_berg_using_subcommand completion" -s w -l max-width -d 'Maximum with of the stdout output,' -r
complete -c berg -n "__fish_berg_using_subcommand completion" -l owner-repo -d 'The OWNER/REPO tuple if you want to target a repository other than the one in $PWD' -r
complete -c berg -n "__fish_berg_using_subcommand completion" -l non-interactive -d 'Whether or not to disable all interactive features. In this case arguments have to be provided in the console!'
complete -c berg -n "__fish_berg_using_subcommand completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "api" -d 'API subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "auth" -d 'Authentication subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "config" -d 'Config subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "user" -d 'User subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "issue" -d 'Issue subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "pull" -d 'Pull request subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "label" -d 'Label subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "release" -d 'Release subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "repo" -d 'Repository subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "milestone" -d 'Milestone subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "notification" -d 'Notification subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "keys" -d 'Key management subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "completion" -d 'Print completion script'
complete -c berg -n "__fish_berg_using_subcommand help; and not __fish_seen_subcommand_from api auth config user issue pull label release repo milestone notification keys completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from api" -f -a "version" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d 'Login via generating authentication token'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "logout" -d 'Logout. Delete currently stored authentication token'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "list" -d 'List all forgejo instances you\'re authenticated for'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "info" -d 'Display short overview of which config values are used'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "generate" -d 'Generate standard configuration at certain locations'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "info" -d 'Display short summary of the authenticated user account'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from issue" -f -a "list" -d 'List all issues in the current repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from issue" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from issue" -f -a "comment" -d 'Add a comment to selected issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from issue" -f -a "view" -d 'View details of selected issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from issue" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from pull" -f -a "list" -d 'List pull requests'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from pull" -f -a "create" -d 'Create a pull request'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from pull" -f -a "edit" -d 'Edit pull request'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from pull" -f -a "view" -d 'View details of a selected pull request'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from pull" -f -a "comment" -d 'Add comment to selected pull request'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from label" -f -a "list" -d 'List all labels in the current repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from label" -f -a "create" -d 'Create a label'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from label" -f -a "delete" -d 'Delete a label'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from label" -f -a "edit" -d 'Edit selected label'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from release" -f -a "create" -d 'Create a release'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from release" -f -a "list" -d 'List all releases in the current repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "create" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "clone" -d 'Clone a repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "delete" -d 'Delete a repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "fork" -d 'Fork a repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "info" -d 'Display short summary of the current repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "assignees" -d 'List available assignee candidates'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "migrate" -d 'Create a new repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "list" -d 'List user current active repositories'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "open" -d 'Open the current repository in the browser'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from repo" -f -a "branch" -d 'Branch subcommands'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from milestone" -f -a "list" -d 'List all milestones in the current repository'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from milestone" -f -a "view" -d 'View details of selected milestone'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from milestone" -f -a "create" -d 'Create an issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from milestone" -f -a "edit" -d 'Edit selected issue'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from notification" -f -a "list"
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from notification" -f -a "view"
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from keys" -f -a "gpg" -d 'Gpg key management'
complete -c berg -n "__fish_berg_using_subcommand help; and __fish_seen_subcommand_from keys" -f -a "ssh" -d 'Ssh key management'
