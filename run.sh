#!/usr/bin/fish

set -x cmd $argv[1]

source ~/.tasks/src/add.fish
source ~/.tasks/src/addAt.fish
source ~/.tasks/src/delete.fish
source ~/.tasks/src/done.fish
source ~/.tasks/meta/env

switch $cmd
    case ''
        ~/.tasks/src/./base
    case help
        xdg-open ~/.tasks/README.md
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
    case tear
        if test -n $argv[2]
            if [ $argv[2..-1] = "base" ]
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
    case list
        set thelists (ls ~/.tasks/lists/)
        for i in $thelists
            if [ $list = $i ]
                echo -n "*"
            end
            echo $i
        end
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
    case add "do"
        add $argv --list=$list    

    case addAt
        addAt $argv --list=$list

    case delete remove clear
        if test -z $argv[2]
            echo "tasks $argv[1] .. what?"
            exit
        end
        delete $argv --list=$list
        
    case done 
        if test -z $argv[2]
            echo "tasks $argv[1.. what?"
            exit
        end
        done $argv --list=$list
        
    case clearAll deleteAll clear-all delete-all
        cat /dev/null > ~/.tasks/lists/$list/Tdone.csv
        cat /dev/null > ~/.tasks/lists/$list/Tdo.csv

    case clearDo deleteDo clear-do delete-do
        cat /dev/null > ~/.tasks/lists/$list/Tdo.csv
    
    case clearDone deleteDone clear-done delete-done
        cat /dev/null > ~/.tasks/lists/$list/Tdone.csv
    
    case display show
        echo "list:" $list 
        cat -n ~/.tasks/lists/$list/Tdo.csv

    case displayDone showDone show-done display-done
        echo "list:" $list
        cat -n ~/.tasks/lists/$list/Tdone.csv

    case '*'
        echo $argv, This is not a recognized command
        echo "Please refer the documentation for correct usage"
        echo "Use tasks help to see usage of commands"
end
  
