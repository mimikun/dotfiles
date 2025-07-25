complete -c ccsum -l completion -d 'print shell completion script' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c ccsum -s f -l format -d 'use the specified checksum format for output' -r -f -a "hex\t''
base64\t''
base64-no-pad\t''
base64-url\t''"
complete -c ccsum -s a -l algorithm -d 'use the specified algorithm to generate the checksum' -r -f -a "md5\t''
sha1\t''
sha224\t''
sha256\t''
sha384\t''
sha512\t''
xxh32\t''
xxh64\t''
xxh3\t''"
complete -c ccsum -s B -l buffer-size -d 'buffer size for reading files, in bytes' -r
complete -c ccsum -s g -l group -d 'group output by last N segments of the path' -r
complete -c ccsum -s G -l group-with-check -d 'group output by last N segments of the path, and fail if any checksums in the group are different' -r
complete -c ccsum -s b -l binary -d 'read in binary mode. (noop)'
complete -c ccsum -s t -l text -d 'read in text mode. (noop)'
complete -c ccsum -s c -l check -d 'check for differences between the new and original file'
complete -c ccsum -l tag -d 'create a BSD-style checksum'
complete -c ccsum -s z -l zero -d 'end each output line with a NULL character instead of newline, and disable file name escaping'
complete -c ccsum -l ignore-missing -d 'don\'t fail or report status for missing files'
complete -c ccsum -l quiet -d 'don\'t put OK for each successfully verified file'
complete -c ccsum -l status -d 'don\'t output anything. you can use status code to check for success'
complete -c ccsum -l strict -d 'exit non-zero for improperly formatted checksum lines'
complete -c ccsum -s w -l warn -d 'warn about improperly formatted checksum lines'
complete -c ccsum -l color -d 'colorize the output, even if stdout is not a tty'
complete -c ccsum -l no-color -d 'disable colorized output'
complete -c ccsum -s h -l help -d 'Print help'
complete -c ccsum -s V -l version -d 'Print version'
