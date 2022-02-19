function addAt_
    argparse 'l/link=+' 'L/list=' 'n/index=' -- $argv   
    set -x max (wc -l $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt | cut -d " " -f 1)
    if test -z "$_flag_index"
        echo "Please use --index or n followed by appropriate index"
        exit
    else if [ $_flag_index -gt $max ]
        echo "$_flag_index is beyond the size of list"
        exit
    else if [ $_flag_index -lt 1 ]
        echo "$_flag_index is not a valid index"
        exit
    end
    set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
    set link "|"
    if set -q _flag_link
        for i in $_flag_link
            set -x link $link(echo -e " \e]8;;$i\aResource\e]8;;\a")
        end
    end
    sed -i "$_flag_index i $lines $argv[2..-1] $link" $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.csv
end