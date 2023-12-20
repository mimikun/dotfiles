complete -c fd -l and -d 'Additional search patterns that need to be matched' -r
complete -c fd -s d -l max-depth -d 'Set maximum search depth (default: none)' -r
complete -c fd -l min-depth -d 'Only show search results starting at the given depth.' -r
complete -c fd -l exact-depth -d 'Only show search results at the exact given depth' -r
complete -c fd -s E -l exclude -d 'Exclude entries that match the given glob pattern' -r
complete -c fd -s t -l type -d 'Filter by type: file (f), directory (d), symlink (l), executable (x), empty (e), socket (s), pipe (p), char-device (c), block-device (b)' -r -f -a "{file	'',directory	'',symlink	'',block-device	'',char-device	'',executable	'A file which is executable by the current effective user',empty	'',socket	'',pipe	''}"
complete -c fd -s e -l extension -d 'Filter by file extension' -r
complete -c fd -s S -l size -d 'Limit results based on the size of files' -r
complete -c fd -l changed-within -d 'Filter by file modification time (newer than)' -r
complete -c fd -l changed-before -d 'Filter by file modification time (older than)' -r
complete -c fd -s o -l owner -d 'Filter by owning user and/or group' -r
complete -c fd -s x -l exec -d 'Execute a command for each search result' -r
complete -c fd -s X -l exec-batch -d 'Execute a command with all search results at once' -r
complete -c fd -l batch-size -d 'Max number of arguments to run as a batch size with -X' -r
complete -c fd -l ignore-file -d 'Add a custom ignore-file in \'.gitignore\' format' -r -F
complete -c fd -s c -l color -d 'When to use colors' -r -f -a "{auto	'show colors if the output goes to an interactive console (default)',always	'always use colorized output',never	'do not use colorized output'}"
complete -c fd -s j -l threads -d 'Set number of threads to use for searching & executing (default: number of available CPU cores)' -r
complete -c fd -l max-buffer-time -d 'Milliseconds to buffer before streaming search results to console' -r
complete -c fd -l max-results -d 'Limit the number of search results' -r
complete -c fd -l base-directory -d 'Change current working directory' -r -F
complete -c fd -l path-separator -d 'Set path separator when printing file paths' -r
complete -c fd -l search-path -d 'Provides paths to search as an alternative to the positional <path> argument' -r -F
complete -c fd -l gen-completions -r -f -a "{bash	'',elvish	'',fish	'',powershell	'',zsh	''}"
complete -c fd -s H -l hidden -d 'Search hidden files and directories'
complete -c fd -l no-hidden -d 'Overrides --hidden'
complete -c fd -s I -l no-ignore -d 'Do not respect .(git|fd)ignore files'
complete -c fd -l ignore -d 'Overrides --no-ignore'
complete -c fd -l no-ignore-vcs -d 'Do not respect .gitignore files'
complete -c fd -l ignore-vcs -d 'Overrides --no-ignore-vcs'
complete -c fd -l no-require-git -d 'Do not require a git repository to respect gitignores. By default, fd will only respect global gitignore rules, .gitignore rules, and local exclude rules if fd detects that you are searching inside a git repository. This flag allows you to relax this restriction such that fd will respect all git related ignore rules regardless of whether you\'re searching in a git repository or not'
complete -c fd -l require-git -d 'Overrides --no-require-git'
complete -c fd -l no-ignore-parent -d 'Do not respect .(git|fd)ignore files in parent directories'
complete -c fd -l no-global-ignore-file -d 'Do not respect the global ignore file'
complete -c fd -s u -l unrestricted -d 'Unrestricted search, alias for \'--no-ignore --hidden\''
complete -c fd -s s -l case-sensitive -d 'Case-sensitive search (default: smart case)'
complete -c fd -s i -l ignore-case -d 'Case-insensitive search (default: smart case)'
complete -c fd -s g -l glob -d 'Glob-based search (default: regular expression)'
complete -c fd -l regex -d 'Regular-expression based search (default)'
complete -c fd -s F -l fixed-strings -d 'Treat pattern as literal string stead of regex'
complete -c fd -s a -l absolute-path -d 'Show absolute instead of relative paths'
complete -c fd -l relative-path -d 'Overrides --absolute-path'
complete -c fd -s l -l list-details -d 'Use a long listing format with file metadata'
complete -c fd -s L -l follow -d 'Follow symbolic links'
complete -c fd -l no-follow -d 'Overrides --follow'
complete -c fd -s p -l full-path -d 'Search full abs. path (default: filename only)'
complete -c fd -s 0 -l print0 -d 'Separate search results by the null character'
complete -c fd -l prune -d 'Do not traverse into directories that match the search criteria. If you want to exclude specific directories, use the \'--exclude=…\' option'
complete -c fd -s 1 -d 'Limit search to a single result'
complete -c fd -s q -l quiet -d 'Print nothing, exit code 0 if match found, 1 otherwise'
complete -c fd -l show-errors -d 'Show filesystem errors'
complete -c fd -l strip-cwd-prefix -d 'By default, relative paths are prefixed with \'./\' when -x/--exec, -X/--exec-batch, or -0/--print0 are given, to reduce the risk of a path starting with \'-\' being treated as a command line option. Use this flag to disable this behaviour'
complete -c fd -l one-file-system -d 'By default, fd will traverse the file system tree as far as other options dictate. With this flag, fd ensures that it does not descend into a different file system than the one it started in. Comparable to the -mount or -xdev filters of find(1)'
complete -c fd -s h -l help -d 'Print help (see more with \'--help\')'
complete -c fd -s V -l version -d 'Print version'
