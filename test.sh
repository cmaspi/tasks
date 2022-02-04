#!/usr/bin/fish
# set -l argv
argparse 'h/help'=+ 'n/name'= -- $argv
echo $_flag_n
echo $argv

