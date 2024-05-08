complete -c mdbook -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_use_subcommand" -f -a "init" -d 'Creates the boilerplate structure and files for a new book'
complete -c mdbook -n "__fish_use_subcommand" -f -a "build" -d 'Builds a book from its markdown files'
complete -c mdbook -n "__fish_use_subcommand" -f -a "test" -d 'Tests that a book\'s Rust code samples compile'
complete -c mdbook -n "__fish_use_subcommand" -f -a "clean" -d 'Deletes a built book'
complete -c mdbook -n "__fish_use_subcommand" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c mdbook -n "__fish_use_subcommand" -f -a "watch" -d 'Watches a book\'s files and rebuilds it on changes'
complete -c mdbook -n "__fish_use_subcommand" -f -a "serve" -d 'Serves a book at http://localhost:3000, and rebuilds it on changes'
complete -c mdbook -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c mdbook -n "__fish_seen_subcommand_from init" -l title -d 'Sets the book title' -r
complete -c mdbook -n "__fish_seen_subcommand_from init" -l ignore -d 'Creates a VCS ignore file (i.e. .gitignore)' -r -f -a "{none	'',git	''}"
complete -c mdbook -n "__fish_seen_subcommand_from init" -l theme -d 'Copies the default theme into your source folder'
complete -c mdbook -n "__fish_seen_subcommand_from init" -l force -d 'Skips confirmation prompts'
complete -c mdbook -n "__fish_seen_subcommand_from init" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from init" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from build" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the book\'s root directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_seen_subcommand_from build" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_seen_subcommand_from build" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from build" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from test" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the book\'s root directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_seen_subcommand_from test" -s c -l chapter -r
complete -c mdbook -n "__fish_seen_subcommand_from test" -s L -l library-path -d 'A comma-separated list of directories to add to the crate search path when building tests' -r
complete -c mdbook -n "__fish_seen_subcommand_from test" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from test" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from clean" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the book\'s root directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_seen_subcommand_from clean" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from clean" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from watch" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the book\'s root directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_seen_subcommand_from watch" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_seen_subcommand_from watch" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from watch" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s d -l dest-dir -d 'Output directory for the book Relative paths are interpreted relative to the book\'s root directory. If omitted, mdBook uses build.build-dir from book.toml or defaults to `./book`.' -r -F
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s n -l hostname -d 'Hostname to listen on for HTTP connections' -r
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s p -l port -d 'Port to use for HTTP connections' -r
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s o -l open -d 'Opens the compiled book in a web browser'
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s h -l help -d 'Print help'
complete -c mdbook -n "__fish_seen_subcommand_from serve" -s V -l version -d 'Print version'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "init" -d 'Creates the boilerplate structure and files for a new book'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "build" -d 'Builds a book from its markdown files'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "test" -d 'Tests that a book\'s Rust code samples compile'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "clean" -d 'Deletes a built book'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "completions" -d 'Generate shell completions for your shell to stdout'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "watch" -d 'Watches a book\'s files and rebuilds it on changes'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "serve" -d 'Serves a book at http://localhost:3000, and rebuilds it on changes'
complete -c mdbook -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from init; and not __fish_seen_subcommand_from build; and not __fish_seen_subcommand_from test; and not __fish_seen_subcommand_from clean; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from watch; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
