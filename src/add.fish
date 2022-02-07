function add
    argparse 'l/link=+' 'L/list=' -- $argv   
        set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
        echo -n "$lines $argv[2..-1] |" >> ~/.tasks/lists/$_flag_list/Tdo.csv
        if set -q _flag_link
            for i in $_flag_link
                set -x link (echo -e "\e]8;;$i\aResource\e]8;;\a")
                echo -n , $link >> ~/.tasks/lists/$_flag_list/Tdo.csv
            end
        end
        echo  >> ~/.tasks/lists/$_flag_list/Tdo.csv
end