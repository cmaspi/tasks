#!/usr/bin/fish

# cmd is the command just followed by tasks, 
# something like tasks clean, here cmd will be set as "clean"
set -x cmd $argv[1]

# sourcing all the function from src
source ~/.tasks/src/add.fish
source ~/.tasks/src/addAt.fish
source ~/.tasks/src/delete.fish
source ~/.tasks/src/done.fish
source ~/.tasks/meta/env

# switch case to determine the command
switch $cmd

    # empty case, when the command is just $ tasks
    case ''
        ~/.tasks/src/./base

    # this requires improvements, it opens the readme
    case "--help" "-h"
        xdg-open ~/.tasks/README.md
    
    # return version 
    case "-v" "--version"
        echo "v2.0"

    # used to create a new list
    case create
        if test -n $argv[2]
            set dir ~/.tasks/lists/"$argv[2..-1]"
            [ -d "$dir" ] && echo "list already exists" && exit
            mkdir "$dir"
            touch "$dir"/Tdo.csv
            touch "$dir"/Tdone.csv
        else 
            echo "tasks create ... what?"
        end

    # to remove a list
    case tear
        if test -n $argv[2]
            if [ "$argv[2..-1]" = "base" ]
                echo cannot tear base list
                exit
            end
            set dir ~/.tasks/lists/"$argv[2..-1]"
            [ ! -d "$dir" ] && echo "list doesn't exist" && exit
            rm -r "$dir"
            echo set list base > ~/.tasks/meta/env
        else 
            echo "tasks tear ... what?"
        end

    # this will show all the lists
    case list
        set thelists (ls ~/.tasks/lists/)
        for i in $thelists
            if [ "$list" = $i ]
                echo -n "*"
            end
            echo $i
        end

    # to switch to a list
    case use
        if test -n $argv[2]
            set dir ~/.tasks/lists/"$argv[2..-1]"
            # echo $dir
            [ ! -d "$dir" ] && echo "No such lists exists" && exit
            echo set list "$argv[2..-1]" > ~/.tasks/meta/env
            echo Using "$argv[2..-1]"
        else
            echo "tasks use ... what?"
        end

    # to add a new task to the list
    case add "do"
        add $argv --list="$list"    

    # this is a replacement for priority
    # if a task is more important, it can be added on top
    case addAt
        addAt $argv --list="$list"

    # to delete or remove a task
    # this command is used to discard a task
    case delete rm
        if test -z $argv[2]
            echo "tasks $argv[1] .. what?"
            exit
        end
        delete $argv --list="$list"

    # mark a task as done, it will move the task to done list
    case "done" 
        if test -z $argv[2]
            echo "tasks $argv[1.. what?"
            exit
        end
        done $argv --list="$list"
        
    # resets the to-do and done sublists
    case clear clean
        cat /dev/null > ~/.tasks/lists/"$list"/Tdone.csv
        cat /dev/null > ~/.tasks/lists/"$list"/Tdo.csv

    # clears the to-do list
    case clearDo cleanDo
        cat /dev/null > ~/.tasks/lists/"$list"/Tdo.csv
    
    # clears the done list
    case clearDone cleanDone
        cat /dev/null > ~/.tasks/lists/"$list"/Tdone.csv
    
    # lists all the tasks in to-do list
    case display show
        echo "list:" $list 
        cat -n ~/.tasks/lists/"$list"/Tdo.csv

    # lists all the done tasks
    case displayDone showDone
        echo "list:" $list
        cat -n ~/.tasks/lists/"$list"/Tdone.csv

    # unrecognized command
    case '*'
        echo $argv, This is not a recognized command
        echo "Please refer the documentation for correct usage"
        echo "Use tasks help to see usage of commands"


end
  
