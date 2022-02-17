function delete

    argparse 'H/hash=?' "n/index=" "L/list=" -- $argv
    set -x max (wc -l $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv | cut -d " " -f 1)
    if test -n "$_flag_index"
        if [ $_flag_index -gt $max ]
            echo "$_flag_index is beyond the size of list"
            exit
        else if [ $_flag_index -lt 1 ]
            echo "$_flag_index is not a valid index"
            exit
        end
    end
    if set -q _flag_index
        sed -i "$_flag_index d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv
    else if set -q _flag_hash
        set -x num (grep -n $_flag_hash $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv | head -n 1 | cut -d ":" -f 1)
        if test -n "$num"
            sed -i "$num d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv
        else
            echo No such hash exists
        end
    else if test -n $argv[2]
        set -x num (grep -n "$argv[2..-1]" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv | head -n 1 | cut -d ":" -f 1)
        if test -n "$num"
            sed "$num !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv
            echo "Do you want to delete this?"
            read -l -P 'Confirm [y]/n: ' confirm
            switch $confirm
                case N n
                    exit
            end
            sed "$num !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdone.csv
            sed -i "$num d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv
        else
            echo "Unable to find keyword"
        end
    end  
end
