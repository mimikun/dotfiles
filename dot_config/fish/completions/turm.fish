# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_turm_global_optspecs
	string join \n slurm-refresh= file-refresh= A/account= a/all federation hide j/job= local L/licenses= M/clusters= me n/name= noconvert p/partition= q/qos= R/reservation= sibling s/step= S/sort= t/states= u/user= w/nodelist= h/help V/version
end

function __fish_turm_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_turm_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_turm_using_subcommand
	set -l cmd (__fish_turm_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c turm -n "__fish_turm_needs_command" -l slurm-refresh -d 'Refresh rate for the job watcher' -r
complete -c turm -n "__fish_turm_needs_command" -l file-refresh -d 'Refresh rate for the file watcher' -r
complete -c turm -n "__fish_turm_needs_command" -s A -l account -d '|squeue arg| Comma separated list of accounts to view, default is all accounts' -r
complete -c turm -n "__fish_turm_needs_command" -s j -l job -d '|squeue arg| Comma separated list of jobs IDs to view, default is all' -r
complete -c turm -n "__fish_turm_needs_command" -s L -l licenses -d '|squeue arg| Comma separated list of license names to view' -r
complete -c turm -n "__fish_turm_needs_command" -s M -l clusters -d '|squeue arg| Cluster to issue commands to. Default is current cluster. Cluster with no name will reset to default. Implies `--local`' -r
complete -c turm -n "__fish_turm_needs_command" -s n -l name -d '|squeue arg| Comma separated list of job names to view' -r
complete -c turm -n "__fish_turm_needs_command" -s p -l partition -d '|squeue arg| Comma separated list of partitions to view, default is all partitions' -r
complete -c turm -n "__fish_turm_needs_command" -s q -l qos -d '|squeue arg| Comma separated list of qos\'s to view, default is all qos\'s' -r
complete -c turm -n "__fish_turm_needs_command" -s R -l reservation -d '|squeue arg| Reservation to view, default is all' -r
complete -c turm -n "__fish_turm_needs_command" -s s -l step -d '|squeue arg| Comma separated list of job steps to view, default is all' -r
complete -c turm -n "__fish_turm_needs_command" -s S -l sort -d '|squeue arg| Comma separated list of fields to sort on' -r
complete -c turm -n "__fish_turm_needs_command" -s t -l states -d '|squeue arg| Comma separated list of states to view, default is pending and running, `--states=all` reports all states' -r
complete -c turm -n "__fish_turm_needs_command" -s u -l user -d '|squeue arg| Comma separated list of users to view' -r
complete -c turm -n "__fish_turm_needs_command" -s w -l nodelist -d '|squeue arg| List of nodes to view, default is all nodes' -r
complete -c turm -n "__fish_turm_needs_command" -s a -l all -d '|squeue arg| Display jobs in hidden partitions'
complete -c turm -n "__fish_turm_needs_command" -l federation -d '|squeue arg| Report federated information if a member of one'
complete -c turm -n "__fish_turm_needs_command" -l hide -d '|squeue arg| Do not display jobs in hidden partitions'
complete -c turm -n "__fish_turm_needs_command" -l local -d '|squeue arg| Report information only about jobs on the local cluster. Overrides `--federation`'
complete -c turm -n "__fish_turm_needs_command" -l me -d '|squeue arg| Equivalent to `--user=<my username>`'
complete -c turm -n "__fish_turm_needs_command" -l noconvert -d '|squeue arg| Don\'t convert units from their original type (e.g. 2048M won\'t be converted to 2G)'
complete -c turm -n "__fish_turm_needs_command" -l sibling -d '|squeue arg| Report information about all sibling jobs on a federated cluster. Implies --federation'
complete -c turm -n "__fish_turm_needs_command" -s h -l help -d 'Print help'
complete -c turm -n "__fish_turm_needs_command" -s V -l version -d 'Print version'
complete -c turm -n "__fish_turm_needs_command" -f -a "completion" -d 'Print shell completion script to stdout'
complete -c turm -n "__fish_turm_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c turm -n "__fish_turm_using_subcommand completion" -s h -l help -d 'Print help'
complete -c turm -n "__fish_turm_using_subcommand help; and not __fish_seen_subcommand_from completion help" -f -a "completion" -d 'Print shell completion script to stdout'
complete -c turm -n "__fish_turm_using_subcommand help; and not __fish_seen_subcommand_from completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
