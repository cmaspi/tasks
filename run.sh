#!/usr/bin/fish

set -x cmd $argv[1]

switch $cmd
    case ''
        echo "tasks ... what? Refer tasks help for list of valid commands"
    case help
        xdg-open ~/.tasks/README.md
    case add do
        set -e _flag_link
        argparse 'l/link=+' -- $argv   
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        echo -n "$lines $argv[2..-1] |" >> ~/.tasks/data/Tdo.csv
        if set -q _flag_link
            for i in $_flag_link
                set -x link (echo -e "\e]8;;$i\aResource\e]8;;\a")
                echo -n , $link >> ~/.tasks/data/Tdo.csv
            end
        end
        echo  >> ~/.tasks/data/Tdo.csv
    

    case addAt
        set -e _flag_link _flag_index
        set -x max (wc -l ~/.tasks/data/Tdo.csv | cut -d " " -f 1)
        argparse 'l/link=+' "n/index=!_validate_int --min 1 --max $max" -- $argv   
        if test -z "$_flag_index"
            echo "Please use --index or n followed by appropriate index"
            exit
        end
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        set link "|"
        if set -q _flag_link
            for i in $_flag_link
                set -x link $link(echo -e ", \e]8;;$i\aResource\e]8;;\a")
            end
        end
        sed -i "$_flag_index i $lines $argv[2..-1] $link" ~/.tasks/data/Tdo.csv


    case delete remove clear
        if test -z $argv[2..-1]
            echo "tasks $argv[1] .. what?"
            exit
        end
        set -e _flag_index _flag_hash
        set -x max (wc -l ~/.tasks/data/Tdo.csv | cut -d " " -f 1)
        argparse 'H/hash=?' "n/index=!_validate_int --min 1 --max $max" -- $argv
        if set -q _flag_index
            sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv
        else if set -q _flag_hash
            set -x num (grep -n $_flag_hash ~/.tasks/data/Tdo.csv | head -n 1 | cut -d ":" -f 1)
            if test -n "$num"
                sed -i "$num d" ~/.tasks/data/Tdo.csv
            else
                echo No such hash exists
            end
        else if test -n $argv[2]
            set -x num (grep -n "$argv[2..-1]" ~/.tasks/data/Tdo.csv | head -n 1 | cut -d ":" -f 1)
            if test -n "$num"
                sed "$num !d" ~/.tasks/data/Tdo.csv
                echo "Do you want to delete this?"
                read -l -P 'Confirm [y]/n: ' confirm
                switch $confirm
                    case N n
                        exit
                end
                sed "$num !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
                sed -i "$num d" ~/.tasks/data/Tdo.csv
            else
                echo "Unable to find keyword"
            end
        end  


    case done 
        set -e _flag_index _flag_hash
        set -x max (wc -l ~/.tasks/data/Tdo.csv | cut -d " " -f 1)
        argparse "n/index=!_validate_int --min 1 --max $max" 'H/hash=?' -- $argv
        if set -q _flag_index
            sed "$_flag_index !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
            sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv
        else if set -q _flag_hash
            set -x num (grep -n $_flag_hash ~/.tasks/data/Tdo.csv | head -n 1 | cut -d ":" -f 1)
            if test -n "$num"
                sed "$num !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
                sed -i "$num d" ~/.tasks/data/Tdo.csv
            else
                echo "No such hash exists"
            end
        else if test -n $argv[2]
            set -x num (grep -n "$argv[2..-1]" ~/.tasks/data/Tdo.csv | head -n 1 | cut -d ":" -f 1)
            if test -n "$num"
                sed "$num !d" ~/.tasks/data/Tdo.csv
                echo "Do you want to move this to Done list?"
                read -l -P 'Confirm [y]/n ' confirm
                switch $confirm
                    case N n
                        exit
                end
                sed "$num !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
                sed -i "$num d" ~/.tasks/data/Tdo.csv
            else
                echo "Unable to find keyword"
            end
        end 
        

    case clearAll deleteAll clearl-all delete-all
        rm ~/.tasks/data/Tdo.csv
        rm ~/.tasks/data/Tdone.csv
        touch ~/.tasks/data/Tdo.csv
        touch ~/.tasks/data/Tdone.csv


    case clearDo deleteDo clear-do delete-do
        rm ~/.tasks/data/Tdo.csv
        touch ~/.tasks/data/Tdo.csv
    

    case clearDone deleteDone clear-done delete-done
        rm ~/.tasks/data/Tdone.csv
        touch ~/.tasks/data/Tdone.csv
    

    case display show
        cat -n ~/.tasks/data/Tdo.csv


    case displayDone showDone show-done display-done
        cat -n ~/.tasks/data/Tdone.csv


    case '*'
        echo $argv, This is not a recognized command
        echo "Please refer the documentation for correct usage"
        echo "Use tasks help to see usage of commands"
end
  
