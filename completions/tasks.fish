# list of all available commands
set -l commands 'help' mklist rmlist ls cl add addAt rm show vi xdg use
# command doesn't require files
complete -c tasks -f

# to auto-complete the commands
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "add" -d "adds another task"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "done" -d "marks a task done"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "rm" -d "deletes a task from to-do sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "show" -d "prints both the sublists"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "mklist" -d "create another list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "rmlist" -d "delete a list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "ls" -d "prints the name of available lists"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "cl" -d "use a particular list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "use" -d "use a particular list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "addAt" -d "adds task at given index"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "vi" -d "opens the to-do sublist in vi"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "xdg" -d "opens the to-do sublist in default text editor"



# auto-complete for tasks use
complete -c tasks -n "__fish_seen_subcommand_from use"\
    -a "(ls $HOME/.local/lib/tasks/lists)"

# auto-complete for tasks cl
complete -c tasks -n "__fish_seen_subcommand_from cl"\
    -a "(ls $HOME/.local/lib/tasks/lists)"

# auto-complete for tasks tear
complete -c tasks -n "__fish_seen_subcommand_from rmlist"\
    -a "(ls $HOME/.local/lib/tasks/lists)"
