# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pastel_global_optspecs
	string join \n m/color-mode= f/force-color color-picker= h/help V/version
end

function __fish_pastel_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pastel_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pastel_using_subcommand
	set -l cmd (__fish_pastel_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pastel -n "__fish_pastel_needs_command" -s m -l color-mode -d 'Specify the terminal color mode: 24bit, 8bit, off, *auto*' -r -f -a "24bit\t''
8bit\t''
off\t''
auto\t''"
complete -c pastel -n "__fish_pastel_needs_command" -l color-picker -d 'Use a specific tool to pick the colors' -r -f -a "gpick\t''
xcolor\t''
wcolor\t''
grabc\t''
colorpicker\t''
chameleon\t''
kcolorchooser\t''
zenity\t''
yad\t''
hyprpicker\t''
gdbus\t''"
complete -c pastel -n "__fish_pastel_needs_command" -s f -l force-color -d 'Alias for --mode=24bit'
complete -c pastel -n "__fish_pastel_needs_command" -s h -l help -d 'Print help'
complete -c pastel -n "__fish_pastel_needs_command" -s V -l version -d 'Print version'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "color" -d 'Display information about the given color'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "list" -d 'Show a list of available color names'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "random" -d 'Generate a list of random colors'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "distinct" -d 'Generate a set of visually distinct colors'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "sort-by" -d 'Sort colors by the given property'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "pick" -d 'Interactively pick a color from the screen (pipette)'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "format" -d 'Convert a color to the given format'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "paint" -d 'Print colored text using ANSI escape sequences'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "gradient" -d 'Generate an interpolating sequence of colors'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "mix" -d 'Mix two colors in the given colorspace'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "colorblind" -d 'Simulate a color under a certain colorblindness profile'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "set" -d 'Set a color property to a specific value'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "saturate" -d 'Increase color saturation by a specified amount'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "desaturate" -d 'Decrease color saturation by a specified amount'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "lighten" -d 'Lighten color by a specified amount'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "darken" -d 'Darken color by a specified amount'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "rotate" -d 'Rotate the hue channel by the specified angle'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "complement" -d 'Get the complementary color (hue rotated by 180°)'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "gray" -d 'Create a gray tone from a given lightness'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "to-gray" -d 'Completely desaturate a color (preserving luminance)'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "textcolor" -d 'Get a readable text color for the given background color'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "colorcheck" -d 'Check if your terminal emulator supports 24-bit colors.'
complete -c pastel -n "__fish_pastel_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pastel -n "__fish_pastel_using_subcommand color" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand list" -s s -l sort -d 'Sort order' -r -f -a "brightness\t''
luminance\t''
hue\t''
chroma\t''
random\t''"
complete -c pastel -n "__fish_pastel_using_subcommand list" -s h -l help -d 'Print help'
complete -c pastel -n "__fish_pastel_using_subcommand random" -s s -l strategy -d 'Randomization strategy:    vivid:    random hue, limited saturation and lightness values    rgb:      samples uniformly in RGB space    gray:     random gray tone (uniform)    lch_hue:  random hue, fixed lightness and chroma  Default strategy: \'vivid\'  ' -r -f -a "vivid\t''
rgb\t''
gray\t''
lch_hue\t''"
complete -c pastel -n "__fish_pastel_using_subcommand random" -s n -l number -d 'Number of colors to generate' -r
complete -c pastel -n "__fish_pastel_using_subcommand random" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand distinct" -s m -l metric -d 'Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower.' -r -f -a "CIEDE2000\t''
CIE76\t''"
complete -c pastel -n "__fish_pastel_using_subcommand distinct" -l print-minimal-distance -d 'Only show the optimized minimal distance'
complete -c pastel -n "__fish_pastel_using_subcommand distinct" -s v -l verbose -d 'Print simulation output to STDERR'
complete -c pastel -n "__fish_pastel_using_subcommand distinct" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand sort-by" -s r -l reverse -d 'Reverse the sort order'
complete -c pastel -n "__fish_pastel_using_subcommand sort-by" -s u -l unique -d 'Remove duplicate colors (equality is determined via RGB values)'
complete -c pastel -n "__fish_pastel_using_subcommand sort-by" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand pick" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand format" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s o -l on -d 'Use the specified background color' -r
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s b -l bold -d 'Print the text in bold face'
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s i -l italic -d 'Print the text in italic font'
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s u -l underline -d 'Draw a line below the text'
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s n -l no-newline -d 'Do not print a trailing newline character'
complete -c pastel -n "__fish_pastel_using_subcommand paint" -s h -l help -d 'Print help'
complete -c pastel -n "__fish_pastel_using_subcommand gradient" -s n -l number -d 'Number of colors to generate' -r
complete -c pastel -n "__fish_pastel_using_subcommand gradient" -s s -l colorspace -d 'The colorspace in which to interpolate' -r -f -a "Lab\t''
LCh\t''
RGB\t''
HSL\t''
OkLab\t''"
complete -c pastel -n "__fish_pastel_using_subcommand gradient" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand mix" -s s -l colorspace -d 'The colorspace in which to interpolate' -r -f -a "Lab\t''
LCh\t''
RGB\t''
HSL\t''
OkLab\t''"
complete -c pastel -n "__fish_pastel_using_subcommand mix" -s f -l fraction -d 'The number between 0.0 and 1.0 determining how much to mix in from the base color.' -r
complete -c pastel -n "__fish_pastel_using_subcommand mix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand colorblind" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand saturate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand desaturate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand lighten" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand darken" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand rotate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand complement" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand gray" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand to-gray" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand textcolor" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pastel -n "__fish_pastel_using_subcommand colorcheck" -s h -l help -d 'Print help'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "color" -d 'Display information about the given color'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "list" -d 'Show a list of available color names'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "random" -d 'Generate a list of random colors'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "distinct" -d 'Generate a set of visually distinct colors'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "sort-by" -d 'Sort colors by the given property'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "pick" -d 'Interactively pick a color from the screen (pipette)'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "format" -d 'Convert a color to the given format'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "paint" -d 'Print colored text using ANSI escape sequences'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "gradient" -d 'Generate an interpolating sequence of colors'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "mix" -d 'Mix two colors in the given colorspace'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "colorblind" -d 'Simulate a color under a certain colorblindness profile'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "set" -d 'Set a color property to a specific value'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "saturate" -d 'Increase color saturation by a specified amount'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "desaturate" -d 'Decrease color saturation by a specified amount'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "lighten" -d 'Lighten color by a specified amount'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "darken" -d 'Darken color by a specified amount'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "rotate" -d 'Rotate the hue channel by the specified angle'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "complement" -d 'Get the complementary color (hue rotated by 180°)'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "gray" -d 'Create a gray tone from a given lightness'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "to-gray" -d 'Completely desaturate a color (preserving luminance)'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "textcolor" -d 'Get a readable text color for the given background color'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "colorcheck" -d 'Check if your terminal emulator supports 24-bit colors.'
complete -c pastel -n "__fish_pastel_using_subcommand help; and not __fish_seen_subcommand_from color list random distinct sort-by pick format paint gradient mix colorblind set saturate desaturate lighten darken rotate complement gray to-gray textcolor colorcheck help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
