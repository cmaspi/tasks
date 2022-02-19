function done
    argparse 'H/hash=?' "n/index=" "L/list=" -- $argv
    set -x max (wc -l $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt | cut -d " " -f 1)
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
        sed "$_flag_index !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdone.txt
        sed -i "$_flag_index d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
    else if set -q _flag_hash
        set -x num (grep -n $_flag_hash $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt | head -n 1 | cut -d ":" -f 1)
        if test -n "$num"
            sed "$num !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdone.txt
            sed -i "$num d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
        else
            echo "No such hash exists"
        end
    else if test -n $argv[2]
        set -x num (grep -n "$argv[2..-1]" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt | head -n 1 | cut -d ":" -f 1)
        if test -n "$num"
            sed "$num !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
            echo "Do you want to move this to Done list?"
            read -l -P 'Confirm [y]/n: ' confirm
            switch $confirm
                case N n
                    exit
            end
            sed "$num !d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdone.txt
            sed -i "$num d" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
        else
            echo "Unable to find keyword"
        end
    end 
end
