# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_ast_grep_global_optspecs
	string join \n c/config= h/help V/version
end

function __fish_ast_grep_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_ast_grep_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_ast_grep_using_subcommand
	set -l cmd (__fish_ast_grep_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c ast-grep -n "__fish_ast_grep_needs_command" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -s V -l version -d 'Print version'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "run" -d 'Run one time search or rewrite in command line. (default command)'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "scan" -d 'Scan and rewrite code by configuration'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "test" -d 'Test ast-grep rules'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "new" -d 'Create new ast-grep project or items like rules/tests'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "lsp" -d 'Start language server'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "completions" -d 'Generate shell completion script'
complete -c ast-grep -n "__fish_ast_grep_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s p -l pattern -d 'AST pattern to match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l selector -d 'AST kind to extract sub-part of pattern to match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s r -l rewrite -d 'String to replace the matched AST node' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s l -l lang -d 'The language of the pattern. Supported languages are: [Bash, C, Cpp, CSharp, Css, Elixir, Go, Haskell, Hcl, Html, Java, JavaScript, Json, Kotlin, Lua, Nix, Php, Python, Ruby, Rust, Scala, Solidity, Swift, Tsx, TypeScript, Yaml]' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l debug-query -d 'Print query pattern\'s tree-sitter AST. Requires lang be set explicitly' -r -f -a "pattern\t'Print the query parsed in Pattern format'
ast\t'Print the query in tree-sitter AST format, only named nodes are shown'
cst\t'Print the query in tree-sitter CST format, both named and unnamed nodes are shown'
sexp\t'Print the query in S-expression format'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l strictness -d 'The strictness of the pattern' -r -f -a "cst\t'Match exact all node'
smart\t'Match all node except source trivial nodes'
ast\t'Match only ast nodes'
relaxed\t'Match ast node except comments'
signature\t'Match ast node except comments, without text'
template\t'Similar to smart but match text only, node kinds are ignored'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l no-ignore -d 'Do not respect hidden file system or ignore files (.gitignore, .ignore, etc.)' -r -f -a "hidden\t'Search hidden files and directories. By default, hidden files and directories are skipped'
dot\t'Don\'t respect .ignore files. This does *not* affect whether ast-grep will ignore files and directories whose names begin with a dot. For that, use --no-ignore hidden'
exclude\t'Don\'t respect ignore files that are manually configured for the repository such as git\'s \'.git/info/exclude\''
global\t'Don\'t respect ignore files that come from "global" sources such as git\'s `core.excludesFile` configuration option (which defaults to `$HOME/.config/git/ignore`)'
parent\t'Don\'t respect ignore files (.gitignore, .ignore, etc.) in parent directories'
vcs\t'Don\'t respect version control ignore files (.gitignore, etc.). This implies --no-ignore parent for VCS files. Note that .ignore files will continue to be respected'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l globs -d 'Include or exclude file paths' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s j -l threads -d 'Set the approximate number of threads to use' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l json -d 'Output matches in structured JSON' -r -f -a "pretty\t'Prints the matches as a pretty-printed JSON array, with indentation and line breaks. This is useful for human readability, but not for parsing by other programs. This is the default value for the `--json` option'
stream\t'Prints each match as a separate JSON object, followed by a newline character. This is useful for streaming the output to other programs that can read one object per line'
compact\t'Prints the matches as a single-line JSON array, without any whitespace. This is useful for saving space and minimizing the output size'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l color -d 'Controls output color' -r -f -a "auto\t'Try to use colors, but don\'t force the issue. If the output is piped to another program, or the console isn\'t available on Windows, or if TERM=dumb, or if `NO_COLOR` is defined, for example, then don\'t use colors'
always\t'Try very hard to emit colors. This includes emitting ANSI colors on Windows if the console API is unavailable (not implemented yet)'
ansi\t'Ansi is like Always, except it never tries to use anything other than emitting ANSI color codes'
never\t'Never emit colors'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l inspect -d 'Inspect information for file/rule discovery and scanning' -r -f -a "nothing\t'Do not show any tracing information'
summary\t'Show summary about how many files are scanned and skipped'
entity\t'Show per-file/per-rule tracing information'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s A -l after -d 'Show NUM lines after each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s B -l before -d 'Show NUM lines before each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s C -l context -d 'Show NUM lines around each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l heading -d 'Controls whether to print the file name as heading' -r -f -a "auto\t'Print heading for terminal tty but not for piped output'
always\t'Always print heading regardless of output type'
never\t'Never print heading regardless of output type'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l follow -d 'Follow symbolic links'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -l stdin -d 'Enable search code from StdIn'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s i -l interactive -d 'Start interactive edit session'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s U -l update-all -d 'Apply all rewrite without confirmation if true'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s r -l rule -d 'Scan the codebase with the single rule located at the path RULE_FILE' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l inline-rules -d 'Scan the codebase with a rule defined by the provided RULE_TEXT' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l format -d 'Output warning/error messages in different formats' -r -f -a "github\t''
sarif\t''"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l report-style -r -f -a "rich\t'Output a richly formatted diagnostic, with source code previews'
medium\t'Output a condensed diagnostic, with a line number, severity, message and notes (if any)'
short\t'Output a short diagnostic, with a line number, severity, and message'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l filter -d 'Scan the codebase with rules with ids matching REGEX' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l error -d 'Set rule severity to error' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l warning -d 'Set rule severity to warning' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l info -d 'Set rule severity to info' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l hint -d 'Set rule severity to hint' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l off -d 'Turn off rule' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l no-ignore -d 'Do not respect hidden file system or ignore files (.gitignore, .ignore, etc.)' -r -f -a "hidden\t'Search hidden files and directories. By default, hidden files and directories are skipped'
dot\t'Don\'t respect .ignore files. This does *not* affect whether ast-grep will ignore files and directories whose names begin with a dot. For that, use --no-ignore hidden'
exclude\t'Don\'t respect ignore files that are manually configured for the repository such as git\'s \'.git/info/exclude\''
global\t'Don\'t respect ignore files that come from "global" sources such as git\'s `core.excludesFile` configuration option (which defaults to `$HOME/.config/git/ignore`)'
parent\t'Don\'t respect ignore files (.gitignore, .ignore, etc.) in parent directories'
vcs\t'Don\'t respect version control ignore files (.gitignore, etc.). This implies --no-ignore parent for VCS files. Note that .ignore files will continue to be respected'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l globs -d 'Include or exclude file paths' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s j -l threads -d 'Set the approximate number of threads to use' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l json -d 'Output matches in structured JSON' -r -f -a "pretty\t'Prints the matches as a pretty-printed JSON array, with indentation and line breaks. This is useful for human readability, but not for parsing by other programs. This is the default value for the `--json` option'
stream\t'Prints each match as a separate JSON object, followed by a newline character. This is useful for streaming the output to other programs that can read one object per line'
compact\t'Prints the matches as a single-line JSON array, without any whitespace. This is useful for saving space and minimizing the output size'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l color -d 'Controls output color' -r -f -a "auto\t'Try to use colors, but don\'t force the issue. If the output is piped to another program, or the console isn\'t available on Windows, or if TERM=dumb, or if `NO_COLOR` is defined, for example, then don\'t use colors'
always\t'Try very hard to emit colors. This includes emitting ANSI colors on Windows if the console API is unavailable (not implemented yet)'
ansi\t'Ansi is like Always, except it never tries to use anything other than emitting ANSI color codes'
never\t'Never emit colors'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l inspect -d 'Inspect information for file/rule discovery and scanning' -r -f -a "nothing\t'Do not show any tracing information'
summary\t'Show summary about how many files are scanned and skipped'
entity\t'Show per-file/per-rule tracing information'"
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s A -l after -d 'Show NUM lines after each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s B -l before -d 'Show NUM lines before each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s C -l context -d 'Show NUM lines around each match' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l include-metadata -d 'Include rule metadata in the json output'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l follow -d 'Follow symbolic links'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -l stdin -d 'Enable search code from StdIn'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s i -l interactive -d 'Start interactive edit session'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s U -l update-all -d 'Apply all rewrite without confirmation if true'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand scan" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s t -l test-dir -d 'the directories to search test YAML files' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -l snapshot-dir -d 'Specify the directory name storing snapshots. Default to __snapshots__' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s f -l filter -d 'Only run rule test cases that matches REGEX' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -l skip-snapshot-tests -d 'Only check if the test code is valid, without checking rule output. Turn it on when you want to ignore the output of rules. Conflicts with --update-all'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s U -l update-all -d 'Update the content of all snapshots that have changed in test. Conflicts with --skip-snapshot-tests'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s i -l interactive -d 'Start an interactive review to update snapshots selectively'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -l include-off -d 'Include `severity:off` rules in test'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -s l -l lang -d 'The language of the item to create' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -s y -l yes -d 'Accept all default options without interactive input during creation'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -a "project" -d 'Create an new project by scaffolding'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -a "rule" -d 'Create a new rule'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -a "test" -d 'Create a new test case'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -a "util" -d 'Create a new global utility rule'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and not __fish_seen_subcommand_from project rule test util help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from project" -s l -l lang -d 'The language of the item to create' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from project" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from project" -s y -l yes -d 'Accept all default options without interactive input during creation'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from project" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from rule" -s l -l lang -d 'The language of the item to create' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from rule" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from rule" -s y -l yes -d 'Accept all default options without interactive input during creation'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from rule" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from test" -s l -l lang -d 'The language of the item to create' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from test" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from test" -s y -l yes -d 'Accept all default options without interactive input during creation'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from test" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from util" -s l -l lang -d 'The language of the item to create' -r
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from util" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from util" -s y -l yes -d 'Accept all default options without interactive input during creation'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from util" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "project" -d 'Create an new project by scaffolding'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "rule" -d 'Create a new rule'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "test" -d 'Create a new test case'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "util" -d 'Create a new global utility rule'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand lsp" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand lsp" -s h -l help -d 'Print help'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand completions" -s c -l config -d 'Path to ast-grep root config, default is sgconfig.yml' -r -F
complete -c ast-grep -n "__fish_ast_grep_using_subcommand completions" -s h -l help -d 'Print help'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "run" -d 'Run one time search or rewrite in command line. (default command)'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "scan" -d 'Scan and rewrite code by configuration'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "test" -d 'Test ast-grep rules'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "new" -d 'Create new ast-grep project or items like rules/tests'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "lsp" -d 'Start language server'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "completions" -d 'Generate shell completion script'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and not __fish_seen_subcommand_from run scan test new lsp completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "project" -d 'Create an new project by scaffolding'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "rule" -d 'Create a new rule'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "test" -d 'Create a new test case'
complete -c ast-grep -n "__fish_ast_grep_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "util" -d 'Create a new global utility rule'
