# lefthook fish shell completion

function __fish_lefthook_no_subcommand --description 'Test if there has been any subcommand yet'
    for i in (commandline -opc)
        if contains -- $i run install uninstall check-install dump add validate version self-update help h completion
            return 1
        end
    end
    return 0
end

complete -c lefthook -n '__fish_lefthook_no_subcommand' -f -l help -s h -d 'show help'
complete -c lefthook -n '__fish_lefthook_no_subcommand' -f -l version -s v -d 'print the version'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'run' -d 'execute a group of hooks'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l verbose -s v -d 'enable debug logs'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l colors -r -d 'on, off, or auto (default: auto)'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l job -r -d 'run only jobs with names'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l tag -r -d 'run only jobs with tag names'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l command -r -d 'run only commands'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l exclude -r -d 'exclude files from all templates'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l file -r -d 'overwrite file templates with files'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l force -s f -d 'do not skip if no files changed'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l all-files -d 'replace files templates with {all_files}'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l no-auto-install -d 'do not implicitly install hooks'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l no-stage-fixed -d 'ignore \'stage_fixed: true\' setting'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l no-tty -d 'act as if no TTY is connected'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l skip-lfs -d 'do not run LFS hooks'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l fail-on-changes -s no-fail-on-changes -d 'exit with 1 if some of the files were changed'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l files-from-stdin -d 'parse filelist from STDIN'
complete -c lefthook -n '__fish_seen_subcommand_from run' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'install' -d 'install Git hook from the config or create a blank lefthook.yml'
complete -c lefthook -n '__fish_seen_subcommand_from install' -f -l force -s f -d 'overwrite .old files and proceed even if core.hooksPath is set'
complete -c lefthook -n '__fish_seen_subcommand_from install' -f -l reset-hooks-path -s r -d 'automatically unset core.hooksPath configuration'
complete -c lefthook -n '__fish_seen_subcommand_from install' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from install' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from install; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'uninstall' -d 'delete installed hooks'
complete -c lefthook -n '__fish_seen_subcommand_from uninstall' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from uninstall' -f -l force -s f -d 'remove all Git hooks'
complete -c lefthook -n '__fish_seen_subcommand_from uninstall' -f -l remove-configs -d 'remove lefthook configs'
complete -c lefthook -n '__fish_seen_subcommand_from uninstall' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'check-install' -d 'check if hooks are installed'
complete -c lefthook -n '__fish_seen_subcommand_from check-install' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from check-install' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from check-install; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'dump' -d 'print config merged from all extensions'
complete -c lefthook -n '__fish_seen_subcommand_from dump' -f -l format -s f -r -d '\'yaml\', \'toml\', or \'json\' (default: \'yaml\')'
complete -c lefthook -n '__fish_seen_subcommand_from dump' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from dump; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'add' -d 'add scripts directory and install the hook'
complete -c lefthook -n '__fish_seen_subcommand_from add' -f -l force -s f
complete -c lefthook -n '__fish_seen_subcommand_from add' -f -l create-dirs -s dirs -d 'create directories for scripts'
complete -c lefthook -n '__fish_seen_subcommand_from add' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from add' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from add; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'validate' -d 'validate lefthook config'
complete -c lefthook -n '__fish_seen_subcommand_from validate' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from validate' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from validate; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'version' -d 'print version'
complete -c lefthook -n '__fish_seen_subcommand_from version' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from version' -f -l full -s f
complete -c lefthook -n '__fish_seen_subcommand_from version' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from version; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'self-update' -d 'update lefthook executable'
complete -c lefthook -n '__fish_seen_subcommand_from self-update' -f -l yes -s y -d 'do not prompt y/n'
complete -c lefthook -n '__fish_seen_subcommand_from self-update' -f -l force -s f -d 'force reinstall'
complete -c lefthook -n '__fish_seen_subcommand_from self-update' -f -l verbose -s v
complete -c lefthook -n '__fish_seen_subcommand_from self-update' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
complete -x -c lefthook -n '__fish_lefthook_no_subcommand' -a 'help' -d 'Shows a list of commands or help for one command'
complete -c lefthook -n '__fish_seen_subcommand_from completion' -f -l help -s h -d 'show help'
complete -x -c lefthook -n '__fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from help h' -a 'help' -d 'Shows a list of commands or help for one command'
