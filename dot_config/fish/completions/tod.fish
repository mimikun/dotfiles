# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_tod_global_optspecs
	string join \n v/verbose c/config= t/timeout= h/help V/version
end

function __fish_tod_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_tod_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_tod_using_subcommand
	set -l cmd (__fish_tod_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c tod -n "__fish_tod_needs_command" -s c -l config -d 'Absolute path of configuration. Defaults to $XDG_CONFIG_HOME/tod.cfg' -r -F
complete -c tod -n "__fish_tod_needs_command" -s t -l timeout -d 'Time to wait for a response from API in seconds. Defaults to 30' -r
complete -c tod -n "__fish_tod_needs_command" -s v -l verbose -d 'Display additional debug info while processing'
complete -c tod -n "__fish_tod_needs_command" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_needs_command" -s V -l version -d 'Print version'
complete -c tod -n "__fish_tod_needs_command" -f -a "project" -d '(p) Commands that change projects'
complete -c tod -n "__fish_tod_needs_command" -f -a "section" -d '(n) Commands that change sections'
complete -c tod -n "__fish_tod_needs_command" -f -a "task" -d '(t) Commands for individual tasks'
complete -c tod -n "__fish_tod_needs_command" -f -a "list" -d '(l) Commands for multiple tasks'
complete -c tod -n "__fish_tod_needs_command" -f -a "config" -d '(c) Commands around configuration and the app'
complete -c tod -n "__fish_tod_needs_command" -f -a "auth" -d '(a) Commands for logging in with OAuth'
complete -c tod -n "__fish_tod_needs_command" -f -a "shell" -d '(s) Commands for generating shell completions'
complete -c tod -n "__fish_tod_needs_command" -f -a "test" -d '(e) Commands for manually testing Tod against the API'
complete -c tod -n "__fish_tod_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "create" -d '(c) Create a new project in Todoist and add to config'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "list" -d '(l) List all of the projects in config'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "remove" -d '(r) Remove a project from config (not Todoist)'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "delete" -d '(d) Remove a project from Todoist'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "rename" -d '(n) Rename a project in config (not in Todoist)'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "import" -d '(i) Get projects from Todoist and prompt to add to config'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "empty" -d '(e) Empty a project by putting tasks in other projects"'
complete -c tod -n "__fish_tod_using_subcommand project; and not __fish_seen_subcommand_from create list remove delete rename import empty help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from create" -s n -l name -d 'Project name' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from create" -s d -l description -d 'Project description' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from create" -s i -l is-favorite -d 'Whether the project is marked as favorite'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from remove" -s p -l project -d 'Project to remove' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from remove" -s a -l auto -d 'Remove all projects from config that are not in Todoist'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from remove" -s r -l repeat -d 'Keep repeating prompt to remove projects. Use Ctrl/CMD + c to exit'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from remove" -s l -l all -d 'Remove all projects from config'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from delete" -s p -l project -d 'Project to remove' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from delete" -s r -l repeat -d 'Keep repeating prompt to delete projects. Use Ctrl/CMD + c to exit'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from rename" -s p -l project -d 'Project to remove' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from import" -s a -l auto -d 'Add all projects to config that are not there already'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from empty" -s p -l project -d 'Project to remove' -r
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from empty" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "create" -d '(c) Create a new project in Todoist and add to config'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "list" -d '(l) List all of the projects in config'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "remove" -d '(r) Remove a project from config (not Todoist)'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "delete" -d '(d) Remove a project from Todoist'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "rename" -d '(n) Rename a project in config (not in Todoist)'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "import" -d '(i) Get projects from Todoist and prompt to add to config'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "empty" -d '(e) Empty a project by putting tasks in other projects"'
complete -c tod -n "__fish_tod_using_subcommand project; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand section; and not __fish_seen_subcommand_from create help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand section; and not __fish_seen_subcommand_from create help" -f -a "create" -d '(c) Create a new section for a project in Todoist'
complete -c tod -n "__fish_tod_using_subcommand section; and not __fish_seen_subcommand_from create help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand section; and __fish_seen_subcommand_from create" -s n -l name -d 'Section name' -r
complete -c tod -n "__fish_tod_using_subcommand section; and __fish_seen_subcommand_from create" -s p -l project -d 'Project to put the section in' -r
complete -c tod -n "__fish_tod_using_subcommand section; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand section; and __fish_seen_subcommand_from help" -f -a "create" -d '(c) Create a new section for a project in Todoist'
complete -c tod -n "__fish_tod_using_subcommand section; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "quick-add" -d '(q) Create a new task using NLP'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "create" -d '(c) Create a new task (without NLP)'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "edit" -d '(e) Edit an existing task\'s content'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "next" -d '(n) Get the next task by priority'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "complete" -d '(o) Complete the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "comment" -d '(m) Add a comment to the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand task; and not __fish_seen_subcommand_from quick-add create edit next complete comment help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from quick-add" -s c -l content -d 'Content for task. Add a reminder at the end by prefixing the natural language date with `!`. Example: Get milk on sunday !saturday 4pm' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from quick-add" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s p -l project -d 'The project into which the task will be added' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s u -l due -d 'Date date in format YYYY-MM-DD, YYYY-MM-DD HH:MM, or natural language' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s d -l description -d 'Description for task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s c -l content -d 'Content for task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s r -l priority -d 'Priority from 1 (without priority) to 4 (highest)' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s l -l label -d 'List of labels to choose from, to be applied to each entry. Use flag once per label' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s n -l no-section -d 'Do not prompt for section'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from edit" -s p -l project -d 'The project containing the task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from edit" -s f -l filter -d 'The filter containing the task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from next" -s p -l project -d 'The project containing the task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from next" -s f -l filter -d 'The filter containing the task' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from next" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from complete" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from comment" -s c -l content -d 'Content for comment' -r
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from comment" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "quick-add" -d '(q) Create a new task using NLP'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "create" -d '(c) Create a new task (without NLP)'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "edit" -d '(e) Edit an existing task\'s content'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "next" -d '(n) Get the next task by priority'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "complete" -d '(o) Complete the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "comment" -d '(m) Add a comment to the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand task; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "view" -d '(v) View a list of tasks'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "process" -d '(c) Complete a list of tasks one by one in priority order'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "prioritize" -d '(z) Give every task a priority'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "timebox" -d '(t) Give every task at date, time, and length'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "label" -d '(l) Iterate through tasks and apply labels from defined choices. Use label flag once per label to choose from'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "schedule" -d '(s) Assign dates to all tasks individually'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "deadline" -d '(d) Assign deadlines to all non-recurring tasks without deadlines individually'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "import" -d '(i) Create tasks from a text file, one per line using natural language. Skips empty lines'
complete -c tod -n "__fish_tod_using_subcommand list; and not __fish_seen_subcommand_from view process prioritize timebox label schedule deadline import help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from view" -s p -l project -d 'The project containing the tasks' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from view" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from view" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from process" -s p -l project -d 'Complete all tasks that are due today or undated in a project individually in priority order' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from process" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from process" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from process" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from prioritize" -s p -l project -d 'The project containing the tasks' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from prioritize" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from prioritize" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from prioritize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from timebox" -s p -l project -d 'Timebox all tasks without durations' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from timebox" -s f -l filter -d 'The filter containing the tasks, does not filter out tasks with durations unless specified in filter. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from timebox" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from timebox" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from label" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from label" -s p -l project -d 'The project containing the tasks' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from label" -s l -l label -d 'Labels to select from, if left blank this will be fetched from API' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from label" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from label" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s p -l project -d 'The project containing the tasks' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s s -l skip-recurring -d 'Don\'t re-schedule recurring tasks that are overdue'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s o -l overdue -d 'Only schedule overdue tasks'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from schedule" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from deadline" -s p -l project -d 'The project containing the tasks' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from deadline" -s f -l filter -d 'The filter containing the tasks. Can add multiple filters separated by commas' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from deadline" -s t -l sort -d 'Choose how results should be sorted' -r -f -a "value\t'Sort by Tod\'s configurable sort value'
datetime\t'Sort by datetime only'
todoist\t'Leave Todoist\'s default sorting in place'"
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from deadline" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from import" -s p -l path -d 'The file or directory to fuzzy find in' -r
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "view" -d '(v) View a list of tasks'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "process" -d '(c) Complete a list of tasks one by one in priority order'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "prioritize" -d '(z) Give every task a priority'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "timebox" -d '(t) Give every task at date, time, and length'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "label" -d '(l) Iterate through tasks and apply labels from defined choices. Use label flag once per label to choose from'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "schedule" -d '(s) Assign dates to all tasks individually'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "deadline" -d '(d) Assign deadlines to all non-recurring tasks without deadlines individually'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "import" -d '(i) Create tasks from a text file, one per line using natural language. Skips empty lines'
complete -c tod -n "__fish_tod_using_subcommand list; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -f -a "about" -d '(a) Get build information about Tod'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -f -a "check-version" -d '(v) Check to see if tod is on the latest version, returns exit code 1 if out of date. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -f -a "reset" -d '(r) Deletes the configuration file (if present). Errors if the file does not exist'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -f -a "set-timezone" -d '(tz) Change the timezone in the configuration file'
complete -c tod -n "__fish_tod_using_subcommand config; and not __fish_seen_subcommand_from about check-version reset set-timezone help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from about" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from check-version" -l repo -d 'Manually specify the method to use for installing updates' -r
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from check-version" -s f -l force -d 'Automatically install the latest version if available'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from check-version" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from reset" -l force -d 'Skip confirmation and force deletion'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from set-timezone" -s t -l timezone -d 'TimeZone to add, i.e. "Canada/Pacific"' -r
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from set-timezone" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "about" -d '(a) Get build information about Tod'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "check-version" -d '(v) Check to see if tod is on the latest version, returns exit code 1 if out of date. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "reset" -d '(r) Deletes the configuration file (if present). Errors if the file does not exist'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set-timezone" -d '(tz) Change the timezone in the configuration file'
complete -c tod -n "__fish_tod_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand auth; and not __fish_seen_subcommand_from login help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand auth; and not __fish_seen_subcommand_from login help" -f -a "login" -d '(l) Log into Todoist using OAuth'
complete -c tod -n "__fish_tod_using_subcommand auth; and not __fish_seen_subcommand_from login help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d '(l) Log into Todoist using OAuth'
complete -c tod -n "__fish_tod_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand shell; and not __fish_seen_subcommand_from completions help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand shell; and not __fish_seen_subcommand_from completions help" -f -a "completions" -d '(b) Generate shell completions for various shells. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand shell; and not __fish_seen_subcommand_from completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand shell; and __fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand shell; and __fish_seen_subcommand_from help" -f -a "completions" -d '(b) Generate shell completions for various shells. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand shell; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand test; and not __fish_seen_subcommand_from all help" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand test; and not __fish_seen_subcommand_from all help" -f -a "all" -d '(a) Hit all API endpoints'
complete -c tod -n "__fish_tod_using_subcommand test; and not __fish_seen_subcommand_from all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand test; and __fish_seen_subcommand_from all" -s h -l help -d 'Print help'
complete -c tod -n "__fish_tod_using_subcommand test; and __fish_seen_subcommand_from help" -f -a "all" -d '(a) Hit all API endpoints'
complete -c tod -n "__fish_tod_using_subcommand test; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "project" -d '(p) Commands that change projects'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "section" -d '(n) Commands that change sections'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "task" -d '(t) Commands for individual tasks'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "list" -d '(l) Commands for multiple tasks'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "config" -d '(c) Commands around configuration and the app'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "auth" -d '(a) Commands for logging in with OAuth'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "shell" -d '(s) Commands for generating shell completions'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "test" -d '(e) Commands for manually testing Tod against the API'
complete -c tod -n "__fish_tod_using_subcommand help; and not __fish_seen_subcommand_from project section task list config auth shell test help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "create" -d '(c) Create a new project in Todoist and add to config'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "list" -d '(l) List all of the projects in config'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "remove" -d '(r) Remove a project from config (not Todoist)'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "delete" -d '(d) Remove a project from Todoist'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "rename" -d '(n) Rename a project in config (not in Todoist)'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "import" -d '(i) Get projects from Todoist and prompt to add to config'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from project" -f -a "empty" -d '(e) Empty a project by putting tasks in other projects"'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from section" -f -a "create" -d '(c) Create a new section for a project in Todoist'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "quick-add" -d '(q) Create a new task using NLP'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "create" -d '(c) Create a new task (without NLP)'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "edit" -d '(e) Edit an existing task\'s content'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "next" -d '(n) Get the next task by priority'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "complete" -d '(o) Complete the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from task" -f -a "comment" -d '(m) Add a comment to the last task fetched with the next command'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "view" -d '(v) View a list of tasks'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "process" -d '(c) Complete a list of tasks one by one in priority order'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "prioritize" -d '(z) Give every task a priority'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "timebox" -d '(t) Give every task at date, time, and length'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "label" -d '(l) Iterate through tasks and apply labels from defined choices. Use label flag once per label to choose from'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "schedule" -d '(s) Assign dates to all tasks individually'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "deadline" -d '(d) Assign deadlines to all non-recurring tasks without deadlines individually'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from list" -f -a "import" -d '(i) Create tasks from a text file, one per line using natural language. Skips empty lines'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "about" -d '(a) Get build information about Tod'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "check-version" -d '(v) Check to see if tod is on the latest version, returns exit code 1 if out of date. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "reset" -d '(r) Deletes the configuration file (if present). Errors if the file does not exist'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set-timezone" -d '(tz) Change the timezone in the configuration file'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d '(l) Log into Todoist using OAuth'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from shell" -f -a "completions" -d '(b) Generate shell completions for various shells. Does not need a configuration file'
complete -c tod -n "__fish_tod_using_subcommand help; and __fish_seen_subcommand_from test" -f -a "all" -d '(a) Hit all API endpoints'

