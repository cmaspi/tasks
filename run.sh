#!/usr/bin/fish

set -x cmd $argv[1]

switch $cmd
    case add
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        echo $lines $argv[2..-1] >> ~/.tasks/data/Tdo.csv

    case delete
        argparse 'n/index=?' -- $argv
        set -S _flag_index
        if set -q _flag_index
        echo $_flag_index
        end
        sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv
    
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
  
