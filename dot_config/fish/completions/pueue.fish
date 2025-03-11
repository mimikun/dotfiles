# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pueue_global_optspecs
	string join \n v/verbose color= c/config= p/profile= h/help V/version
end

function __fish_pueue_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pueue_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pueue_using_subcommand
	set -l cmd (__fish_pueue_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pueue -n "__fish_pueue_needs_command" -l color -d 'Colorize the output; auto enables color output when connected to a tty' -r -f -a "auto\t''
never\t''
always\t''"
complete -c pueue -n "__fish_pueue_needs_command" -s c -l config -d 'If provided, Pueue only uses this config file' -r -F
complete -c pueue -n "__fish_pueue_needs_command" -s p -l profile -d 'The name of the profile that should be loaded from your config file' -r
complete -c pueue -n "__fish_pueue_needs_command" -s v -l verbose -d 'Verbose mode (-v, -vv, -vvv)'
complete -c pueue -n "__fish_pueue_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_needs_command" -s V -l version -d 'Print version'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "add" -d 'Enqueue a task for execution'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "remove" -d 'Remove tasks from the list. Running or paused tasks need to be killed first'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "switch" -d 'Switches the queue position of two commands'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "stash" -d 'Stash a task. Stashed tasks won\'t be automatically started'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "enqueue" -d 'Enqueue stashed tasks. They\'ll be handled normally afterwards'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "start" -d 'Resume operation of specific tasks or groups of tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "restart" -d 'Restart failed or successful task(s)'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "pause" -d 'Either pause running tasks or specific groups of tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "kill" -d 'Kill specific running tasks or whole task groups'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "send" -d 'Send something to a task. Useful for sending confirmations such as \'y\\n\''
complete -c pueue -n "__fish_pueue_needs_command" -f -a "edit" -d 'Adjust editable properties of a task'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "env" -d 'Use this to add or remove environment variables from tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "group" -d 'Use this to add or remove groups'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "status" -d 'Display the current status of all tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "log" -d 'Display the log output of finished tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "follow" -d 'Follow the output of a currently running task. This command works like "tail -f"'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "wait" -d 'Wait until tasks are finished'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "clean" -d 'Remove all finished tasks from the list'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "reset" -d 'Kill all tasks, clean up afterwards and reset EVERYTHING!'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "shutdown" -d 'Remotely shut down the daemon. Should only be used if the daemon isn\'t started by a service manager'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "parallel" -d 'Set the amount of allowed parallel tasks'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "completions" -d 'Generates shell completion files'
complete -c pueue -n "__fish_pueue_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand add" -s w -l working-directory -d 'Specify current working directory' -r -f -a "(__fish_complete_directories)"
complete -c pueue -n "__fish_pueue_using_subcommand add" -s d -l delay -d 'Prevents the task from being enqueued until \'delay\' elapses. See "enqueue" for accepted formats' -r
complete -c pueue -n "__fish_pueue_using_subcommand add" -s g -l group -d 'Assign the task to a group' -r
complete -c pueue -n "__fish_pueue_using_subcommand add" -s a -l after -d 'Start the task once all specified tasks have successfully finished' -r
complete -c pueue -n "__fish_pueue_using_subcommand add" -s o -l priority -d 'Start this task with a higher priority' -r
complete -c pueue -n "__fish_pueue_using_subcommand add" -s l -l label -d 'Add some information for yourself' -r
complete -c pueue -n "__fish_pueue_using_subcommand add" -s e -l escape -d 'Escape any special shell characters (" ", "&", "!", etc.). Beware: This implicitly disables nearly all shell specific syntax ("&&", "&>").'
complete -c pueue -n "__fish_pueue_using_subcommand add" -s i -l immediate -d 'Immediately start the task'
complete -c pueue -n "__fish_pueue_using_subcommand add" -l follow -d 'Immediately follow a task, if it\'s started with --immediate'
complete -c pueue -n "__fish_pueue_using_subcommand add" -s s -l stashed -d 'Create the task in Stashed state'
complete -c pueue -n "__fish_pueue_using_subcommand add" -s p -l print-task-id -d 'Only return the task id instead of a text'
complete -c pueue -n "__fish_pueue_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand remove" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand switch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand stash" -s g -l group -d 'Stash all queued tasks in a group' -r
complete -c pueue -n "__fish_pueue_using_subcommand stash" -s d -l delay -d 'Delay enqueuing these tasks until \'delay\' elapses. See DELAY FORMAT below' -r
complete -c pueue -n "__fish_pueue_using_subcommand stash" -s a -l all -d 'Stash all queued tasks across all groups'
complete -c pueue -n "__fish_pueue_using_subcommand stash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand enqueue" -s g -l group -d 'Enqueue all stashed tasks in a group' -r
complete -c pueue -n "__fish_pueue_using_subcommand enqueue" -s d -l delay -d 'Delay enqueuing these tasks until \'delay\' elapses. See DELAY FORMAT below' -r
complete -c pueue -n "__fish_pueue_using_subcommand enqueue" -s a -l all -d 'Enqueue all stashed tasks across all groups'
complete -c pueue -n "__fish_pueue_using_subcommand enqueue" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand start" -s g -l group -d 'Resume a specific group and all paused tasks in it' -r
complete -c pueue -n "__fish_pueue_using_subcommand start" -s a -l all -d 'Resume all groups!'
complete -c pueue -n "__fish_pueue_using_subcommand start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s g -l failed-in-group -d 'Like `--all-failed`, but only restart tasks failed tasks of a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s a -l all-failed -d 'Restart all failed tasks across all groups'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s k -l immediate -d 'Immediately start the tasks, no matter how many open slots there are. This will ignore any dependencies tasks may have'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s s -l stashed -d 'Set the restarted task to a "Stashed" state. Useful to avoid immediate execution'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s i -l in-place -d 'Restart the task by reusing the already existing tasks. This will overwrite any previous logs of the restarted tasks'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -l not-in-place -d 'Restart the task by creating a new identical tasks. Only necessary if you have the `restart_in_place` configuration set to true'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s e -l edit -d 'Edit the task before restarting'
complete -c pueue -n "__fish_pueue_using_subcommand restart" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand pause" -s g -l group -d 'Pause a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand pause" -s a -l all -d 'Pause all groups!'
complete -c pueue -n "__fish_pueue_using_subcommand pause" -s w -l wait -d 'Pause the specified groups, but let already running tasks finish by themselves'
complete -c pueue -n "__fish_pueue_using_subcommand pause" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand kill" -s g -l group -d 'Kill all running tasks in a group. This also pauses the group' -r
complete -c pueue -n "__fish_pueue_using_subcommand kill" -s s -l signal -d 'Send a UNIX signal instead of simply killing the process' -r
complete -c pueue -n "__fish_pueue_using_subcommand kill" -s a -l all -d 'Kill all running tasks across ALL groups. This also pauses all groups'
complete -c pueue -n "__fish_pueue_using_subcommand kill" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand send" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand env; and not __fish_seen_subcommand_from set unset help" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand env; and not __fish_seen_subcommand_from set unset help" -f -a "set" -d 'Set a variable for a specific task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand env; and not __fish_seen_subcommand_from set unset help" -f -a "unset" -d 'Remove a specific variable from a task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand env; and not __fish_seen_subcommand_from set unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand env; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand env; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand env; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a variable for a specific task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand env; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Remove a specific variable from a task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand env; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand group; and not __fish_seen_subcommand_from add remove help" -s j -l json -d 'Print the list of groups as json'
complete -c pueue -n "__fish_pueue_using_subcommand group; and not __fish_seen_subcommand_from add remove help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand group; and not __fish_seen_subcommand_from add remove help" -f -a "add" -d 'Add a group by name'
complete -c pueue -n "__fish_pueue_using_subcommand group; and not __fish_seen_subcommand_from add remove help" -f -a "remove" -d 'Remove a group by name. This will move all tasks in this group to the default group!'
complete -c pueue -n "__fish_pueue_using_subcommand group; and not __fish_seen_subcommand_from add remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from add" -s p -l parallel -d 'Set the amount of parallel tasks this group can have' -r
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a group by name'
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a group by name. This will move all tasks in this group to the default group!'
complete -c pueue -n "__fish_pueue_using_subcommand group; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand status" -s g -l group -d 'Only show tasks of a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand status" -s j -l json -d 'Print the current state as json to stdout. This does not include the output of tasks. Use `log -j` if you want everything'
complete -c pueue -n "__fish_pueue_using_subcommand status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand log" -s g -l group -d 'View the outputs of this specific group\'s tasks' -r
complete -c pueue -n "__fish_pueue_using_subcommand log" -s l -l lines -d 'Only print the last X lines of each task\'s output' -r
complete -c pueue -n "__fish_pueue_using_subcommand log" -s a -l all -d 'Show the logs of all groups\' tasks'
complete -c pueue -n "__fish_pueue_using_subcommand log" -s j -l json -d 'Print the resulting tasks and output as json'
complete -c pueue -n "__fish_pueue_using_subcommand log" -s f -l full -d 'Show the whole output'
complete -c pueue -n "__fish_pueue_using_subcommand log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand follow" -s l -l lines -d 'Only print the last X lines of the output before following' -r
complete -c pueue -n "__fish_pueue_using_subcommand follow" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand wait" -s g -l group -d 'Wait for all tasks in a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand wait" -s s -l status -d 'Wait for tasks to reach a specific task status' -r
complete -c pueue -n "__fish_pueue_using_subcommand wait" -s a -l all -d 'Wait for all tasks across all groups and the default group'
complete -c pueue -n "__fish_pueue_using_subcommand wait" -s q -l quiet -d 'Don\'t show any log output while waiting'
complete -c pueue -n "__fish_pueue_using_subcommand wait" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand clean" -s g -l group -d 'Only clean tasks of a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand clean" -s s -l successful-only -d 'Only clean tasks that finished successfully'
complete -c pueue -n "__fish_pueue_using_subcommand clean" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand reset" -s g -l groups -d 'If groups are specified, only those specific groups will be reset' -r
complete -c pueue -n "__fish_pueue_using_subcommand reset" -s f -l force -d 'Don\'t ask for any confirmation'
complete -c pueue -n "__fish_pueue_using_subcommand reset" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand shutdown" -s h -l help -d 'Print help'
complete -c pueue -n "__fish_pueue_using_subcommand parallel" -s g -l group -d 'Set the amount for a specific group' -r
complete -c pueue -n "__fish_pueue_using_subcommand parallel" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand completions" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "add" -d 'Enqueue a task for execution'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "remove" -d 'Remove tasks from the list. Running or paused tasks need to be killed first'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "switch" -d 'Switches the queue position of two commands'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "stash" -d 'Stash a task. Stashed tasks won\'t be automatically started'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "enqueue" -d 'Enqueue stashed tasks. They\'ll be handled normally afterwards'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "start" -d 'Resume operation of specific tasks or groups of tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "restart" -d 'Restart failed or successful task(s)'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "pause" -d 'Either pause running tasks or specific groups of tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "kill" -d 'Kill specific running tasks or whole task groups'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "send" -d 'Send something to a task. Useful for sending confirmations such as \'y\\n\''
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "edit" -d 'Adjust editable properties of a task'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "env" -d 'Use this to add or remove environment variables from tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "group" -d 'Use this to add or remove groups'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "status" -d 'Display the current status of all tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "log" -d 'Display the log output of finished tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "follow" -d 'Follow the output of a currently running task. This command works like "tail -f"'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "wait" -d 'Wait until tasks are finished'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "clean" -d 'Remove all finished tasks from the list'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "reset" -d 'Kill all tasks, clean up afterwards and reset EVERYTHING!'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "shutdown" -d 'Remotely shut down the daemon. Should only be used if the daemon isn\'t started by a service manager'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "parallel" -d 'Set the amount of allowed parallel tasks'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "completions" -d 'Generates shell completion files'
complete -c pueue -n "__fish_pueue_using_subcommand help; and not __fish_seen_subcommand_from add remove switch stash enqueue start restart pause kill send edit env group status log follow wait clean reset shutdown parallel completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pueue -n "__fish_pueue_using_subcommand help; and __fish_seen_subcommand_from env" -f -a "set" -d 'Set a variable for a specific task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand help; and __fish_seen_subcommand_from env" -f -a "unset" -d 'Remove a specific variable from a task\'s environment'
complete -c pueue -n "__fish_pueue_using_subcommand help; and __fish_seen_subcommand_from group" -f -a "add" -d 'Add a group by name'
complete -c pueue -n "__fish_pueue_using_subcommand help; and __fish_seen_subcommand_from group" -f -a "remove" -d 'Remove a group by name. This will move all tasks in this group to the default group!'
