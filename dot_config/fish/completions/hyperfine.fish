complete -c hyperfine -s w -l warmup -d 'Perform NUM warmup runs before the actual benchmark. This can be used to fill (disk) caches for I/O-heavy programs.' -r
complete -c hyperfine -s m -l min-runs -d 'Perform at least NUM runs for each command (default: 10).' -r
complete -c hyperfine -s M -l max-runs -d 'Perform at most NUM runs for each command. By default, there is no limit.' -r
complete -c hyperfine -s r -l runs -d 'Perform exactly NUM runs for each command. If this option is not specified, hyperfine automatically determines the number of runs.' -r
complete -c hyperfine -s s -l setup -d 'Execute CMD before each set of timing runs. This is useful for compiling your software with the provided parameters, or to do any other work that should happen once before a series of benchmark runs, not every time as would happen with the --prepare option.' -r
complete -c hyperfine -s p -l prepare -d 'Execute CMD before each timing run. This is useful for clearing disk caches, for example.
The --prepare option can be specified once for all commands or multiple times, once for each command. In the latter case, each preparation command will be run prior to the corresponding benchmark command.' -r
complete -c hyperfine -s c -l cleanup -d 'Execute CMD after the completion of all benchmarking runs for each individual command to be benchmarked. This is useful if the commands to be benchmarked produce artifacts that need to be cleaned up.' -r
complete -c hyperfine -s P -l parameter-scan -d 'Perform benchmark runs for each value in the range MIN..MAX. Replaces the string \'{VAR}\' in each command by the current parameter value.

  Example:  hyperfine -P threads 1 8 \'make -j {threads}\'

This performs benchmarks for \'make -j 1\', \'make -j 2\', …, \'make -j 8\'.

To have the value increase following different patterns, use shell arithmetics.

  Example: hyperfine -P size 0 3 \'sleep $((2**{size}))\'

This performs benchmarks with power of 2 increases: \'sleep 1\', \'sleep 2\', \'sleep 4\', …
The exact syntax may vary depending on your shell and OS.' -r
complete -c hyperfine -s D -l parameter-step-size -d 'This argument requires --parameter-scan to be specified as well. Traverse the range MIN..MAX in steps of DELTA.

  Example:  hyperfine -P delay 0.3 0.7 -D 0.2 \'sleep {delay}\'

This performs benchmarks for \'sleep 0.3\', \'sleep 0.5\' and \'sleep 0.7\'.' -r
complete -c hyperfine -s L -l parameter-list -d 'Perform benchmark runs for each value in the comma-separated list VALUES. Replaces the string \'{VAR}\' in each command by the current parameter value.

Example:  hyperfine -L compiler gcc,clang \'{compiler} -O2 main.cpp\'

This performs benchmarks for \'gcc -O2 main.cpp\' and \'clang -O2 main.cpp\'.

The option can be specified multiple times to run benchmarks for all possible parameter combinations.
' -r
complete -c hyperfine -s S -l shell -d 'Set the shell to use for executing benchmarked commands. This can be the name or the path to the shell executable, or a full command line like "bash --norc". It can also be set to "default" to explicitly select the default shell on this platform. Finally, this can also be set to "none" to disable the shell. In this case, commands will be executed directly. They can still have arguments, but more complex things like "sleep 0.1; sleep 0.2" are not possible without a shell.' -r
complete -c hyperfine -l style -d 'Set output style type (default: auto). Set this to \'basic\' to disable output coloring and interactive elements. Set it to \'full\' to enable all effects even if no interactive terminal was detected. Set this to \'nocolor\' to keep the interactive output without any colors. Set this to \'color\' to keep the colors without any interactive output. Set this to \'none\' to disable all the output of the tool.' -r -f -a "{auto	'',basic	'',full	'',nocolor	'',color	'',none	''}"
complete -c hyperfine -l sort -d 'Specify the sort order of the speed comparison summary and the exported tables for markup formats (Markdown, AsciiDoc, org-mode):
  * \'auto\' (default): the speed comparison will be ordered by time and
    the markup tables will be ordered by command (input order).
  * \'command\': order benchmarks in the way they were specified
  * \'mean-time\': order benchmarks by mean runtime
' -r -f -a "{auto	'',command	'',mean-time	''}"
complete -c hyperfine -s u -l time-unit -d 'Set the time unit to be used. Possible values: microsecond, millisecond, second. If the option is not given, the time unit is determined automatically. This option affects the standard output as well as all export formats except for CSV and JSON.' -r -f -a "{microsecond	'',millisecond	'',second	''}"
complete -c hyperfine -l export-asciidoc -d 'Export the timing summary statistics as an AsciiDoc table to the given FILE. The output time unit can be changed using the --time-unit option.' -r
complete -c hyperfine -l export-csv -d 'Export the timing summary statistics as CSV to the given FILE. If you need the timing results for each individual run, use the JSON export format. The output time unit is always seconds.' -r
complete -c hyperfine -l export-json -d 'Export the timing summary statistics and timings of individual runs as JSON to the given FILE. The output time unit is always seconds' -r
complete -c hyperfine -l export-markdown -d 'Export the timing summary statistics as a Markdown table to the given FILE. The output time unit can be changed using the --time-unit option.' -r
complete -c hyperfine -l export-orgmode -d 'Export the timing summary statistics as an Emacs org-mode table to the given FILE. The output time unit can be changed using the --time-unit option.' -r
complete -c hyperfine -l output -d 'Control where the output of the benchmark is redirected. Note that some programs like \'grep\' detect when standard output is /dev/null and apply certain optimizations. To avoid that, consider using \'--output=pipe\'.

<WHERE> can be:

  null:     Redirect output to /dev/null (the default).

  pipe:     Feed the output through a pipe before discarding it.

  inherit:  Don\'t redirect the output at all (same as \'--show-output\').

  <FILE>:   Write the output to the given file.' -r
complete -c hyperfine -l input -d 'Control where the input of the benchmark comes from.

<WHERE> can be:

  null:     Read from /dev/null (the default).

  <FILE>:   Read the input from the given file.' -r
complete -c hyperfine -s n -l command-name -d 'Give a meaningful name to a command. This can be specified multiple times if several commands are benchmarked.' -r
complete -c hyperfine -l min-benchmarking-time -d 'Set the minimum time (in seconds) to run benchmarks. Note that the number of benchmark runs is additionally influenced by the `--min-runs`, `--max-runs`, and `--runs` option.' -r
complete -c hyperfine -s N -d 'An alias for \'--shell=none\'.'
complete -c hyperfine -s i -l ignore-failure -d 'Ignore non-zero exit codes of the benchmarked programs.'
complete -c hyperfine -l show-output -d 'Print the stdout and stderr of the benchmark instead of suppressing it. This will increase the time it takes for benchmarks to run, so it should only be used for debugging purposes or when trying to benchmark output speed.'
complete -c hyperfine -l debug-mode -d 'Enable debug mode which does not actually run commands, but returns fake times when the command is \'sleep <time>\'.'
complete -c hyperfine -s h -l help -d 'Print help'
complete -c hyperfine -s V -l version -d 'Print version'
