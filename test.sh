# the -- is required!
argparse h/help t/theme= f/format= o/output= -- $argv
or exit 1

# just to inspect the variables
set -S _flag_h _flag_help _flag_t _flag_theme _flag_f _flag_format _flag_o _flag_output

if set -q _flag_help
    usage
    exit
end

set theme themes/$_flag_theme.css
set format $_flag_format
set output $_flag_output