function add_
    argparse 'l/link=+' 'L/list=' -- $argv   
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        echo -n "$lines $argv[2..-1] |" >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
        if set -q _flag_link
            for i in $_flag_link
                set -x link (echo -e "\e]8;;$i\aResource\e]8;;\a")
                echo -n , $link >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
            end
        end
        echo  >> $HOME/.local/lib/tasks/lists/$_flag_list/Tdo.txt
end