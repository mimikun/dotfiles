# fish completion for flyctl                               -*- shell-script -*-

function __flyctl_debug
    set -l file "$BASH_COMP_DEBUG_FILE"
    if test -n "$file"
        echo "$argv" >> $file
    end
end

function __flyctl_perform_completion
    __flyctl_debug "Starting __flyctl_perform_completion"

    # Extract all args except the last one
    set -l args (commandline -opc)
    # Extract the last arg and escape it in case it is a space
    set -l lastArg (string escape -- (commandline -ct))

    __flyctl_debug "args: $args"
    __flyctl_debug "last arg: $lastArg"

    # Disable ActiveHelp which is not supported for fish shell
    set -l requestComp "FLYCTL_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

    __flyctl_debug "Calling $requestComp"
    set -l results (eval $requestComp 2> /dev/null)

    # Some programs may output extra empty lines after the directive.
    # Let's ignore them or else it will break completion.
    # Ref: https://github.com/spf13/cobra/issues/1279
    for line in $results[-1..1]
        if test (string trim -- $line) = ""
            # Found an empty line, remove it
            set results $results[1..-2]
        else
            # Found non-empty line, we have our proper output
            break
        end
    end

    set -l comps $results[1..-2]
    set -l directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

    __flyctl_debug "Comps: $comps"
    __flyctl_debug "DirectiveLine: $directiveLine"
    __flyctl_debug "flagPrefix: $flagPrefix"

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# this function limits calls to __flyctl_perform_completion, by caching the result behind $__flyctl_perform_completion_once_result
function __flyctl_perform_completion_once
    __flyctl_debug "Starting __flyctl_perform_completion_once"

    if test -n "$__flyctl_perform_completion_once_result"
        __flyctl_debug "Seems like a valid result already exists, skipping __flyctl_perform_completion"
        return 0
    end

    set --global __flyctl_perform_completion_once_result (__flyctl_perform_completion)
    if test -z "$__flyctl_perform_completion_once_result"
        __flyctl_debug "No completions, probably due to a failure"
        return 1
    end

    __flyctl_debug "Performed completions and set __flyctl_perform_completion_once_result"
    return 0
end

# this function is used to clear the $__flyctl_perform_completion_once_result variable after completions are run
function __flyctl_clear_perform_completion_once_result
    __flyctl_debug ""
    __flyctl_debug "========= clearing previously set __flyctl_perform_completion_once_result variable =========="
    set --erase __flyctl_perform_completion_once_result
    __flyctl_debug "Successfully erased the variable __flyctl_perform_completion_once_result"
end

function __flyctl_requires_order_preservation
    __flyctl_debug ""
    __flyctl_debug "========= checking if order preservation is required =========="

    __flyctl_perform_completion_once
    if test -z "$__flyctl_perform_completion_once_result"
        __flyctl_debug "Error determining if order preservation is required"
        return 1
    end

    set -l directive (string sub --start 2 $__flyctl_perform_completion_once_result[-1])
    __flyctl_debug "Directive is: $directive"

    set -l shellCompDirectiveKeepOrder 32
    set -l keeporder (math (math --scale 0 $directive / $shellCompDirectiveKeepOrder) % 2)
    __flyctl_debug "Keeporder is: $keeporder"

    if test $keeporder -ne 0
        __flyctl_debug "This does require order preservation"
        return 0
    end

    __flyctl_debug "This doesn't require order preservation"
    return 1
end


# This function does two things:
# - Obtain the completions and store them in the global __flyctl_comp_results
# - Return false if file completion should be performed
function __flyctl_prepare_completions
    __flyctl_debug ""
    __flyctl_debug "========= starting completion logic =========="

    # Start fresh
    set --erase __flyctl_comp_results

    __flyctl_perform_completion_once
    __flyctl_debug "Completion results: $__flyctl_perform_completion_once_result"

    if test -z "$__flyctl_perform_completion_once_result"
        __flyctl_debug "No completion, probably due to a failure"
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l directive (string sub --start 2 $__flyctl_perform_completion_once_result[-1])
    set --global __flyctl_comp_results $__flyctl_perform_completion_once_result[1..-2]

    __flyctl_debug "Completions are: $__flyctl_comp_results"
    __flyctl_debug "Directive is: $directive"

    set -l shellCompDirectiveError 1
    set -l shellCompDirectiveNoSpace 2
    set -l shellCompDirectiveNoFileComp 4
    set -l shellCompDirectiveFilterFileExt 8
    set -l shellCompDirectiveFilterDirs 16

    if test -z "$directive"
        set directive 0
    end

    set -l compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
    if test $compErr -eq 1
        __flyctl_debug "Received error directive: aborting."
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
    set -l dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
    if test $filefilter -eq 1; or test $dirfilter -eq 1
        __flyctl_debug "File extension filtering or directory filtering not supported"
        # Do full file completion instead
        return 1
    end

    set -l nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
    set -l nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

    __flyctl_debug "nospace: $nospace, nofiles: $nofiles"

    # If we want to prevent a space, or if file completion is NOT disabled,
    # we need to count the number of valid completions.
    # To do so, we will filter on prefix as the completions we have received
    # may not already be filtered so as to allow fish to match on different
    # criteria than the prefix.
    if test $nospace -ne 0; or test $nofiles -eq 0
        set -l prefix (commandline -t | string escape --style=regex)
        __flyctl_debug "prefix: $prefix"

        set -l completions (string match -r -- "^$prefix.*" $__flyctl_comp_results)
        set --global __flyctl_comp_results $completions
        __flyctl_debug "Filtered completions are: $__flyctl_comp_results"

        # Important not to quote the variable for count to work
        set -l numComps (count $__flyctl_comp_results)
        __flyctl_debug "numComps: $numComps"

        if test $numComps -eq 1; and test $nospace -ne 0
            # We must first split on \t to get rid of the descriptions to be
            # able to check what the actual completion will be.
            # We don't need descriptions anyway since there is only a single
            # real completion which the shell will expand immediately.
            set -l split (string split --max 1 \t $__flyctl_comp_results[1])

            # Fish won't add a space if the completion ends with any
            # of the following characters: @=/:.,
            set -l lastChar (string sub -s -1 -- $split)
            if not string match -r -q "[@=/:.,]" -- "$lastChar"
                # In other cases, to support the "nospace" directive we trick the shell
                # by outputting an extra, longer completion.
                __flyctl_debug "Adding second completion to perform nospace directive"
                set --global __flyctl_comp_results $split[1] $split[1].
                __flyctl_debug "Completions are now: $__flyctl_comp_results"
            end
        end

        if test $numComps -eq 0; and test $nofiles -eq 0
            # To be consistent with bash and zsh, we only trigger file
            # completion when there are no other completions
            __flyctl_debug "Requesting file completion"
            return 1
        end
    end

    return 0
end

# Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
# so we can properly delete any completions provided by another script.
# Only do this if the program can be found, or else fish may print some errors; besides,
# the existing completions will only be loaded if the program can be found.
if type -q "flyctl"
    # The space after the program name is essential to trigger completion for the program
    # and not completion of the program name itself.
    # Also, we use '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.
    complete --do-complete "flyctl " > /dev/null 2>&1
end

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c flyctl -e

# this will get called after the two calls below and clear the $__flyctl_perform_completion_once_result global
complete -c flyctl -n '__flyctl_clear_perform_completion_once_result'
# The call to __flyctl_prepare_completions will setup __flyctl_comp_results
# which provides the program's completion choices.
# If this doesn't require order preservation, we don't use the -k flag
complete -c flyctl -n 'not __flyctl_requires_order_preservation && __flyctl_prepare_completions' -f -a '$__flyctl_comp_results'
# otherwise we use the -k flag
complete -k -c flyctl -n '__flyctl_requires_order_preservation && __flyctl_prepare_completions' -f -a '$__flyctl_comp_results'
