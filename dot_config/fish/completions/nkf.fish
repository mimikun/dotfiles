#complete -c nkf -s V -d "Print the configuration"
#complete -c nkf -l help -d "Print the help"
#complete -c nkf -s v -l version -d "Print the version"
#complete -c nkf -s g -l guess -d "Guess the input code"

complete -c nkf -s j -d 'Specify output encoding ISO-2022-JP (JIS code).'
complete -c nkf -s s -d 'Specify output encoding Shift_JIS and JIS X 0201 kana.  EUC-JP is recognized as X0201 kana. Without -x flag, JIS X 0201 Katakana (a.k.a.halfwidth kana) is converted into JIS X 0208.  If you use Windows, see Windows-31J (CP932).'
complete -c nkf -s e -d 'Specify output encoding EUC-JP.'
complete -c nkf -s w -d 'Specify output encoding UTF-8N.'
complete -c nkf -s w16 -d 'Specify output encoding UTF-8N.'
complete -c nkf -s w16b -d 'Specify output encoding UTF-8N.'
complete -c nkf -s w16l -d 'Specify output encoding UTF-8N.'

#  j/s/e/w  Specify output encoding ISO-2022-JP, Shift_JIS, EUC-JP
#           UTF options is -w[8[0],{16,32}[{B,L}[0]]]


#❯ man nkf
#OPTIONS
#       -J -S -E -W -W16 -W32 -j -s -e -w -w16 -w32
#           Specify input and output encodings. Upper case is input.  cf. --ic and --oc.
#
#           -W16[BL][0]
#               UTF-16.  B or L gives whether Big Endian or Little Endian.  0 gives whther put BOM or not.
#
#           -W32[BL][0]
#               UTF-32.  B or L gives whether Big Endian or Little Endian.  0 gives whther put BOM or not.
#
#       -b -u
#           Output is buffered (DEFAULT), Output is unbuffered.
#
#       -t  No conversion.
#
#       -i[@B]
#           Specify the escape sequence for JIS X 0208.
#
#           -i@ Use ESC ( @. (JIS X 0208-1978)
#
#           -iB Use ESC ( B. (JIS X 0208-1983/1990 DEFAULT)
#
#       -o[BJ]
#           Specify the escape sequence for US-ASCII/JIS X 0201 Roman. (DEFAULT B)
#
#       -r  {de/en}crypt ROT13/47
#
#       -h[123] --hiragana --katakana --katakana-hiragana
#           -h1 --hiragana
#               Katakana to Hiragana conversion.
#
#           -h2 --katakana
#               Hiragana to Katakana conversion.
#
#           -h3 --katakana-hiragana
#               Katakana to Hiragana and Hiragana to Katakana conversion.
#
#       -T  Text mode output (MS-DOS)
#
#       -f[m [- n]]
#           Folding on m length with n margin in a line.  Without this option, fold length is 60 and fold margin is
#           10.
#
#       -F  New line preserving line folding.
#
#       -Z[0-3]
#           Convert X0208 alphabet (Fullwidth Alphabets) to ASCII.
#
#           -Z -Z0
#               Convert X0208 alphabet to ASCII.
#
#           -Z1 Convert X0208 kankaku to single ASCII space.
#
#           -Z2 Convert X0208 kankaku to double ASCII spaces.
#
#           -Z3 Replacing fullwidth >, <, ", & into '&gt;', '&lt;', '&quot;', '&amp;' as in HTML.
#
#       -X -x
#           With -X or without this option, X0201 is converted into X0208 Kana.  With -x, try to preserve X0208 kana
#           and do not convert X0201 kana to X0208.  In JIS output, ESC-(-I is used. In EUC output, SS2 is used.
#
#       -B[0-2]
#           Assume broken JIS-Kanji input, which lost ESC.  Useful when your site is using old B-News Nihongo patch.
#
#           -B1 allows any chars after ESC-( or ESC-$.
#
#           -B2 force ASCII after NL.
#
#       -I  Replacing non iso-2022-jp char into a geta character (substitute character in Japanese).
#
#       -m[BQN0]
#           MIME ISO-2022-JP/ISO8859-1 decode. (DEFAULT) To see ISO8859-1 (Latin-1) -l is necessary.
#
#           -mB Decode MIME base64 encoded stream. Remove header or other part before conversion.
#
#           -mQ Decode MIME quoted stream. '_' in quoted stream is converted to space.
#
#           -mN Non-strict decoding.  It allows line break in the middle of the base64 encoding.
#
#           -m0 No MIME decode.
#
#       -M  MIME encode. Header style. All ASCII code and control characters are intact.
#
#           -MB MIME encode Base64 stream.  Kanji conversion is performed before encoding, so this cannot be used as a
#               picture encoder.
#
#           -MQ Perform quoted encoding.
#
#       -l  Input and output code is ISO8859-1 (Latin-1) and ISO-2022-JP.  -s, -e and -x are not compatible with this
#           option.
#
#       -L[uwm] -d -c
#           Convert line breaks.
#
#           -Lu -d
#               unix (LF)
#
#           -Lw -c
#               windows (CRLF)
#
#           -Lm mac (CR)
#
#               Without this option, nkf doesn't convert line breaks.
#
#       --fj --unix --mac --msdos --windows
#           Convert for these systems.
#
#       --jis --euc --sjis --mime --base64
#           Convert to named code.
#
#       --jis-input --euc-input --sjis-input --mime-input --base64-input
#           Assume input system
#
#       --ic=input codeset --oc=output codeset
#           Set the input or output codeset.  NKF supports following codesets and those codeset names are case
#           insensitive.
#
#           ISO-2022-JP
#               a.k.a. RFC1468, 7bit JIS, JUNET
#
#           EUC-JP (eucJP-nkf)
#               a.k.a. AT&T JIS, Japanese EUC, UJIS
#
#           eucJP-ascii
#           eucJP-ms
#           CP51932
#               Microsoft Version of EUC-JP.
#
#           Shift_JIS
#               a.k.a. SJIS, MS_Kanji
#
#           Windows-31J
#               a.k.a. CP932
#
#           UTF-8
#               same as UTF-8N
#
#           UTF-8N
#               UTF-8 without BOM
#
#           UTF-8-BOM
#               UTF-8 with BOM
#
#           UTF8-MAC (input only)
#               decomposed UTF-8
#
#           UTF-16
#               same as UTF-16BE
#
#           UTF-16BE
#               UTF-16 Big Endian without BOM
#
#           UTF-16BE-BOM
#               UTF-16 Big Endian with BOM
#
#           UTF-16LE
#               UTF-16 Little Endian without BOM
#
#           UTF-16LE-BOM
#               UTF-16 Little Endian with BOM
#
#           UTF-32
#               same as UTF-32BE
#
#           UTF-32BE
#               UTF-32 Big Endian without BOM
#
#           UTF-32BE-BOM
#               UTF-32 Big Endian with BOM
#
#           UTF-32LE
#               UTF-32 Little Endian without BOM
#
#           UTF-32LE-BOM
#               UTF-32 Little Endian with BOM
#
#       --fb-{skip, html, xml, perl, java, subchar}
#           Specify the way that nkf handles unassigned characters.  Without this option, --fb-skip is assumed.
#
#       --prefix=escape charactertarget character..
#           When nkf converts to Shift_JIS, nkf adds a specified escape character to specified 2nd byte of Shift_JIS
#           characters.  1st byte of argument is the escape character and following bytes are target characters.
#
#       --no-cp932ext
#           Handle the characters extended in CP932 as unassigned characters.
#
#       --no-best-fit-chars
#           When Unicode to Encoded byte conversion, don't convert characters which is not round trip safe.  When
#           Unicode to Unicode conversion, with this and -x option, nkf can be used as UTF converter.  (In other
#           words, without this and -x option, nkf doesn't save some characters)
#
#           When nkf converts strings that related to path, you should use this option.
#
#       --cap-input
#           Decode hex encoded characters.
#
#       --url-input
#           Unescape percent escaped characters.
#
#       --numchar-input
#           Decode character reference, such as "&#....;".
#
#       --in-place[=SUFFIX]  --overwrite[=SUFFIX]
#           Overwrite original listed files by filtered result.
#
#           Note --overwrite preserves timestamps of original files.
#
#       --guess=[12]
#           Print guessed encoding and newline. (2 is default, 1 is only encoding)
#
#       --help
#           Print nkf's help.
#
#       --version
#           Print nkf's version.
#
#       --  Ignore rest of -option.
#
#AUTHOR
#       Copyright (c) 1987, Fujitsu LTD. (Itaru ICHIKAWA).
#
#       Copyright (c) 1996-2018, The nkf Project.
#
#nkf 2.1.5                                             2018-12-15                                               nkf(1)
# ➜ nkf --help
# Usage:  nkf -[flags] [--] [in file] .. [out file for -O flag]
#  j/s/e/w  Specify output encoding ISO-2022-JP, Shift_JIS, EUC-JP
#           UTF options is -w[8[0],{16,32}[{B,L}[0]]]
#  J/S/E/W  Specify input encoding ISO-2022-JP, Shift_JIS, EUC-JP
#           UTF option is -W[8,[16,32][B,L]]
#  m[BQSN0] MIME decode [B:base64,Q:quoted,S:strict,N:nonstrict,0:no decode]
#  M[BQ]    MIME encode [B:base64 Q:quoted]
#  f/F      Folding: -f60 or -f or -f60-10 (fold margin 10) F preserve nl
#  Z[0-4]   Default/0: Convert JISX0208 Alphabet to ASCII
#           1: Kankaku to one space  2: to two spaces  3: HTML Entity
#           4: JISX0208 Katakana to JISX0201 Katakana
#  X,x      Convert Halfwidth Katakana to Fullwidth or preserve it
#  O        Output to File (DEFAULT 'nkf.out')
#  L[uwm]   Line mode u:LF w:CRLF m:CR (DEFAULT noconversion)
#  --ic=<encoding>        Specify the input encoding
#  --oc=<encoding>        Specify the output encoding
#  --hiragana --katakana  Hiragana/Katakana Conversion
#  --katakana-hiragana    Converts each other
#  --{cap, url}-input     Convert hex after ':' or '%'
#  --numchar-input        Convert Unicode Character Reference
#  --fb-{skip, html, xml, perl, java, subchar}
#                         Specify unassigned character's replacement
#  --in-place[=SUF]       Overwrite original files
#  --overwrite[=SUF]      Preserve timestamp of original files
#  -g --guess             Guess the input code
#  -v --version           Print the version
#  --help/-V              Print this help / configuration
# Network Kanji Filter Version 2.1.5 (2018-12-15) 
# Copyright (C) 1987, FUJITSU LTD. (I.Ichikawa).
# Copyright (C) 1996-2018, The nkf Project.
