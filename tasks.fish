# list of all available commands
set -l commands 'help' create tear list use add addAt delete remove done clean clear cleanDo clearDo cleanDone clearDone display show displayDone showDone

# command doesn't require files
complete -c tasks -f

# to auto-complete the commands
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "help" -d "lists all the available commands"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "add" -d "adds another task"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "done" -d "marks a task done"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "delete" -d "deletes a task from to-do sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "show" -d "shows the do-do sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "showDone" -d "shows the done sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "create" -d "create another list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "tear" -d "delete a list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "list" -d "prints the name of available lists"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "use" -d "use a particular list"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "addAt" -d "adds task at given index"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "remove" -d "alias for delete"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "clean" -d "clears both to-do and done sublists"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "clear" -d "alias for clean"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "cleanDo" -d "clears to-do sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "clearDo" -d "alias for cleanDo"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "cleanDone" -d "clears the done sublist"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "clearDone" -d "alias for cleanDone"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "display" -d "alias for show"
complete -c tasks -n "not __fish_seen_subcommand_from $commands" \
    -a "displayDone" -d "alias for showDone"

# auto-complete for tasks use
complete -c tasks -n "__fish_seen_subcommand_from use"\
    -a "(ls ~/.tasks/lists)"

