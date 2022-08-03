complete -c fd -s d -l max-depth -d 'Set maximum search depth (default: none)' -r
complete -c fd -l maxdepth -d 'Set maximum search depth (default: none)' -r
complete -c fd -l min-depth -d 'Only show results starting at given depth' -r
complete -c fd -l exact-depth -d 'Only show results at exact given depth' -r
complete -c fd -s t -l type -d 'Filter by type: file (f), directory (d), symlink (l),
executable (x), empty (e), socket (s), pipe (p)' -r -f -a "{f	,file	,d	,directory	,l	,symlink	,x	,executable	,e	,empty	,s	,socket	,p	,pipe	}"
complete -c fd -s e -l extension -d 'Filter by file extension' -r
complete -c fd -s x -l exec -d 'Execute a command for each search result' -r
complete -c fd -s X -l exec-batch -d 'Execute a command with all search results at once' -r
complete -c fd -l batch-size -d 'Max number of arguments to run as a batch with -X' -r
complete -c fd -s E -l exclude -d 'Exclude entries that match the given glob pattern' -r
complete -c fd -l ignore-file -d 'Add custom ignore-file in \'.gitignore\' format' -r
complete -c fd -s c -l color -d 'When to use colors: never, *auto*, always' -r -f -a "{never	,auto	,always	}"
complete -c fd -s j -l threads -d 'Set number of threads' -r
complete -c fd -s S -l size -d 'Limit results based on the size of files' -r
complete -c fd -l max-buffer-time -d 'Milliseconds to buffer before streaming search results to console' -r
complete -c fd -l changed-within -d 'Filter by file modification time (newer than)' -r
complete -c fd -l changed-before -d 'Filter by file modification time (older than)' -r
complete -c fd -l max-results -d 'Limit number of search results' -r
complete -c fd -l base-directory -d 'Change current working directory' -r
complete -c fd -l path-separator -d 'Set path separator when printing file paths' -r
complete -c fd -l search-path -d 'Provide paths to search as an alternative to the positional <path>' -r
complete -c fd -s o -l owner -d 'Filter by owning user and/or group' -r
complete -c fd -s h -l help -d 'Print help information'
complete -c fd -s V -l version -d 'Print version information'
complete -c fd -s H -l hidden -d 'Search hidden files and directories'
complete -c fd -l no-hidden
complete -c fd -s I -l no-ignore -d 'Do not respect .(git|fd)ignore files'
complete -c fd -l ignore
complete -c fd -l no-ignore-vcs -d 'Do not respect .gitignore files'
complete -c fd -l ignore-vcs
complete -c fd -l no-ignore-parent -d 'Do not respect .(git|fd)ignore files in parent directories'
complete -c fd -l no-global-ignore-file -d 'Do not respect the global ignore file'
complete -c fd -s u -l unrestricted -d 'Unrestricted search, alias for \'--no-ignore --hidden\''
complete -c fd -s s -l case-sensitive -d 'Case-sensitive search (default: smart case)'
complete -c fd -s i -l ignore-case -d 'Case-insensitive search (default: smart case)'
complete -c fd -s g -l glob -d 'Glob-based search (default: regular expression)'
complete -c fd -l regex -d 'Regular-expression based search (default)'
complete -c fd -s F -l fixed-strings -d 'Treat pattern as literal string instead of regex'
complete -c fd -s a -l absolute-path -d 'Show absolute instead of relative paths'
complete -c fd -l relative-path
complete -c fd -s l -l list-details -d 'Use a long listing format with file metadata'
complete -c fd -s L -l follow -d 'Follow symbolic links'
complete -c fd -l no-follow
complete -c fd -s p -l full-path -d 'Search full abs. path (default: filename only)'
complete -c fd -s 0 -l print0 -d 'Separate results by the null character'
complete -c fd -l prune -d 'Do not traverse into matching directories'
complete -c fd -s 1 -d 'Limit search to a single result'
complete -c fd -s q -l quiet -d 'Print nothing, exit code 0 if match found, 1 otherwise'
complete -c fd -l show-errors -d 'Show filesystem errors'
complete -c fd -l strip-cwd-prefix -d 'strip \'./\' prefix from non-tty outputs'
complete -c fd -l one-file-system -d 'Do not descend into a different file system'
