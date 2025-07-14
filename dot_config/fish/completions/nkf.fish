# Completion for nkf (Network Kanji Filter)
# Author: mimikun

# Disable file completion by default
complete -c nkf -f

# Output encoding options
complete -c nkf -s j -d 'Output as ISO-2022-JP (JIS code)'
complete -c nkf -s s -d 'Output as Shift_JIS'
complete -c nkf -s e -d 'Output as EUC-JP'
complete -c nkf -s w -d 'Output as UTF-8'
complete -c nkf -o w8 -d 'Output as UTF-8'
complete -c nkf -o w80 -d 'Output as UTF-8 without BOM'
complete -c nkf -o w16 -d 'Output as UTF-16'
complete -c nkf -o w16B -d 'Output as UTF-16BE'
complete -c nkf -o w16L -d 'Output as UTF-16LE'
complete -c nkf -o w16B0 -d 'Output as UTF-16BE without BOM'
complete -c nkf -o w16L0 -d 'Output as UTF-16LE without BOM'
complete -c nkf -o w32 -d 'Output as UTF-32'
complete -c nkf -o w32B -d 'Output as UTF-32BE'
complete -c nkf -o w32L -d 'Output as UTF-32LE'

# Input encoding options
complete -c nkf -s J -d 'Input is ISO-2022-JP (JIS code)'
complete -c nkf -s S -d 'Input is Shift_JIS'
complete -c nkf -s E -d 'Input is EUC-JP'
complete -c nkf -s W -d 'Input is UTF-8'
complete -c nkf -o W8 -d 'Input is UTF-8'
complete -c nkf -o W16 -d 'Input is UTF-16'
complete -c nkf -o W16B -d 'Input is UTF-16BE'
complete -c nkf -o W16L -d 'Input is UTF-16LE'
complete -c nkf -o W32 -d 'Input is UTF-32'
complete -c nkf -o W32B -d 'Input is UTF-32BE'
complete -c nkf -o W32L -d 'Input is UTF-32LE'

# MIME options
complete -c nkf -s m -d 'MIME decode'
complete -c nkf -o mB -d 'MIME decode (base64)'
complete -c nkf -o mQ -d 'MIME decode (quoted-printable)'
complete -c nkf -o mS -d 'MIME decode (strict)'
complete -c nkf -o mN -d 'MIME decode (non-strict)'
complete -c nkf -o m0 -d 'MIME decode (no decode)'
complete -c nkf -s M -d 'MIME encode'
complete -c nkf -o MB -d 'MIME encode (base64)'
complete -c nkf -o MQ -d 'MIME encode (quoted-printable)'

# Text processing options
complete -c nkf -s f -d 'Folding: wrap long lines'
complete -c nkf -o f60 -d 'Folding: wrap at 60 columns'
complete -c nkf -s F -d 'Folding: wrap and preserve newlines'
complete -c nkf -s Z -d 'Convert JIS X 0208 alphabet to ASCII'
complete -c nkf -o Z0 -d 'Convert JIS X 0208 alphabet to ASCII'
complete -c nkf -o Z1 -d 'Convert JIS X 0208 kana to ASCII'
complete -c nkf -o Z2 -d 'Convert JIS X 0208 alphabet and kana to ASCII'
complete -c nkf -o Z3 -d 'Convert JIS X 0208 ideographic space to two ASCII spaces'
complete -c nkf -o Z4 -d 'Convert JIS X 0208 ideographic space to one ASCII space'
complete -c nkf -s X -d 'Convert halfwidth katakana to fullwidth'
complete -c nkf -s x -d 'Preserve halfwidth katakana'

# Output file option
complete -c nkf -s O -d 'Output to file (default: nkf.out)' -r

# Line ending options
complete -c nkf -s L -d 'Line ending mode'
complete -c nkf -o Lu -d 'Unix line ending (LF)'
complete -c nkf -o Lw -d 'Windows line ending (CRLF)'
complete -c nkf -o Lm -d 'Mac line ending (CR)'

# Other short options
complete -c nkf -s r -d 'Rot13/47 conversion'
complete -c nkf -s g -d 'Guess input encoding'
complete -c nkf -s v -d 'Show version'
complete -c nkf -s V -d 'Show version and configuration'
complete -c nkf -s T -d 'Text mode'
complete -c nkf -s l -d 'ISO-2022-JP level'
complete -c nkf -s d -d 'Delete CR after NL'
complete -c nkf -s c -d 'Add CR after NL'
complete -c nkf -s I -d 'ISO-2022-JP-1 (JIS X 0212)'
complete -c nkf -o i@ -d 'ISO-2022-JP-3 (JIS X 0213:2000)'
complete -c nkf -o i= -d 'ISO-2022-JP-3 (JIS X 0213:2004)'
complete -c nkf -s h -d 'Hiragana/Katakana conversion'
complete -c nkf -o h1 -d 'Katakana to Hiragana'
complete -c nkf -o h2 -d 'Hiragana to Katakana'
complete -c nkf -o h3 -d 'Katakana to Hiragana and Hiragana to Katakana'
complete -c nkf -s t -d 'No conversion'
complete -c nkf -s i -d 'Use JIS X 0208-1978'
complete -c nkf -s o -d 'Use JIS X 0208-1983'
complete -c nkf -s B -d 'Broken JIS'
complete -c nkf -o B0 -d 'Assume broken JIS ESC'
complete -c nkf -o B1 -d 'Allow any chars after ESC-('
complete -c nkf -o B2 -d 'Force ASCII after NL'

# Long options
complete -c nkf -l ic -d 'Specify input encoding' -x -a 'UTF-8 UTF-16 UTF-16BE UTF-16LE UTF-32 UTF-32BE UTF-32LE Shift_JIS EUC-JP ISO-2022-JP ISO-8859-1 ASCII'
complete -c nkf -l oc -d 'Specify output encoding' -x -a 'UTF-8 UTF-16 UTF-16BE UTF-16LE UTF-32 UTF-32BE UTF-32LE Shift_JIS EUC-JP ISO-2022-JP ISO-8859-1 ASCII'
complete -c nkf -l hiragana -d 'Convert katakana to hiragana'
complete -c nkf -l katakana -d 'Convert hiragana to katakana'
complete -c nkf -l katakana-hiragana -d 'Convert katakana to hiragana and vice versa'
complete -c nkf -l cap-input -d 'Decode hexadecimal entity'
complete -c nkf -l url-input -d 'Decode URL encoded'
complete -c nkf -l numchar-input -d 'Decode numeric character reference'
complete -c nkf -l fb-skip -d 'Skip unassigned characters'
complete -c nkf -l fb-html -d 'Replace unassigned characters with HTML entity'
complete -c nkf -l fb-xml -d 'Replace unassigned characters with XML entity'
complete -c nkf -l fb-perl -d 'Replace unassigned characters with Perl \\x{HHHH}'
complete -c nkf -l fb-java -d 'Replace unassigned characters with Java \\uHHHH'
complete -c nkf -l fb-subchar -d 'Replace unassigned characters with substitution character'
complete -c nkf -l in-place -d 'Overwrite original file'
complete -c nkf -l overwrite -d 'Overwrite original file preserving timestamp'
complete -c nkf -l guess -d 'Guess input encoding'
complete -c nkf -l version -d 'Show version'
complete -c nkf -l help -d 'Show help'
complete -c nkf -l base64 -d 'Base64 encode'
complete -c nkf -l base64decode -d 'Base64 decode'
complete -c nkf -l euc-jp-ms -d 'Use eucJP-ms'
complete -c nkf -l cp932 -d 'Use CP932'
complete -c nkf -l no-cp932 -d 'Do not use CP932'
complete -c nkf -l utf8-mac -d 'UTF-8-MAC'
complete -c nkf -l prefix -d 'Prepend escape sequence for JIS X 0213'

# Enable file completion for arguments
complete -c nkf -F