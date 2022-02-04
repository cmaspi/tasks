#!/usr/bin/fish

set -x cmd $argv[1]

switch $cmd
    case ''
        echo "tasks ... what? Refer man page for list of valid commands"
    case add
        set -e _flag_link
        argparse 'l/link=+' -- $argv   
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        echo -n $lines $argv[2..-1]  >> ~/.tasks/data/Tdo.csv
        if set -q _flag_link
            for i in $_flag_link
                set -x link (echo -e "\e]8;;$i\aResource\e]8;;\a")
                echo -n , $link >> ~/.tasks/data/Tdo.csv
            end
        end
        echo  >> ~/.tasks/data/Tdo.csv

    case delete
        set -e _flag_index _flag_hash
        argparse 'n/index=?' 'H/hash=?' -- $argv
        if set -q _flag_index
            sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv
        
        end    
    case done
        argparse 'n/index'= -- $argv
        sed  "$_flag_index !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
        sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv

    case clearAll
        rm ~/.tasks/data/Tdo.csv
        rm ~/.tasks/data/Tdone.csv
        touch ~/.tasks/data/Tdo.csv
        touch ~/.tasks/data/Tdone.csv

    case clearDo
        rm ~/.tasks/data/Tdo.csv
        touch ~/.tasks/data/Tdo.csv
    
    case clearDone
        rm ~/.tasks/data/Tdone.csv
        touch ~/.tasks/data/Tdone.csv
    
    case display
        cat -n ~/.tasks/data/Tdo.csv

    case displayDone
        cat -n ~/.tasks/data/Tdone.csv

    case '*'
        echo $argv, This is not a recognized command
        echo "Please refer the documentation for correct usage"
        echo See man page for details
end
  
