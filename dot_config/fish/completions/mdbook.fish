# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_mdbook_global_optspecs
	string join \n h/help V/version
end

function __fish_mdbook_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_mdbook_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_mdbook_using_subcommand
	set -l cmd (__fish_mdbook_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c mdbook -n "__fish_mdbook_needs_command" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_needs_command" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "init" -d 'Creates the boilerplate structure and files for a new book'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "build" -d 'Builds a book from its markdown files'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "test" -d 'Tests that a book\'s Rust code samples compile'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "clean" -d 'Deletes a built book'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "watch" -d 'Watches a book\'s files and rebuilds it on changes'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "serve" -d 'Serves a book at http://localhost:3000, and rebuilds it on changes'
complete -c mdbook -n "__fish_mdbook_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -l title -d 'Sets the book title' -r
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -l ignore -d 'Creates a VCS ignore file (i.e. .gitignore)' -r -f -a "none\t''
git\t''"
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -l theme -d 'Copies the default theme into your source folder'
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -l force -d 'Skips confirmation prompts'
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand init" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand build" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the current directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_mdbook_using_subcommand build" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_mdbook_using_subcommand build" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand build" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand test" -s c -l chapter -r
complete -c mdbook -n "__fish_mdbook_using_subcommand test" -s L -l library-path -d 'A comma-separated list of directories to add to the crate search path when building tests' -r
complete -c mdbook -n "__fish_mdbook_using_subcommand test" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand test" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand clean" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the current directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_mdbook_using_subcommand clean" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand clean" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand completions" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand completions" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand watch" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the current directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_mdbook_using_subcommand watch" -l watcher -d 'The filesystem watching technique' -r -f -a "poll\t''
native\t''"
complete -c mdbook -n "__fish_mdbook_using_subcommand watch" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_mdbook_using_subcommand watch" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand watch" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the current directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s n -l hostname -d 'Hostname to listen on for HTTP connections' -r
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s p -l port -d 'Port to use for HTTP connections' -r
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -l watcher -d 'The filesystem watching technique' -r -f -a "poll\t''
native\t''"
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_mdbook_using_subcommand serve" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "init" -d 'Creates the boilerplate structure and files for a new book'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "build" -d 'Builds a book from its markdown files'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "test" -d 'Tests that a book\'s Rust code samples compile'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "clean" -d 'Deletes a built book'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "watch" -d 'Watches a book\'s files and rebuilds it on changes'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "serve" -d 'Serves a book at http://localhost:3000, and rebuilds it on changes'
complete -c mdbook -n "__fish_mdbook_using_subcommand help; and not __fish_seen_subcommand_from init build test clean completions watch serve help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
