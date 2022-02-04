#!/usr/bin/fish
set -x dir (pwd)
set -x user (whoami)

set -x cmd $argv[1]
if [ (count $argv) = 0 ]
echo "tasks ... what? Please use a valid command!"

else if [ $cmd = "add" ]
set -x lines (echo -n $argv[2..-1]| md5sum | cut -d " " -f 1| cut -b -7)
echo $lines $argv[2..-1] >> ~/.tasks/data/Tdo.csv

else if [ $cmd = 'delete' ]
argparse 'n/index=?' -- $argv
set -S _flag_index
if set -q _flag_index
echo $_flag_index
end
sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv

else if [ $cmd = 'done' ]
argparse 'n/index'= -- $argv
sed  "$_flag_index !d" ~/.tasks/data/Tdo.csv >> ~/.tasks/data/Tdone.csv
sed -i "$_flag_index d" ~/.tasks/data/Tdo.csv

else if [ $cmd = "clearAll" ]
rm ~/.tasks/data/Tdo.csv
rm ~/.tasks/data/Tdone.csv
touch ~/.tasks/data/Tdo.csv
touch ~/.tasks/data/Tdone.csv

else if [ $cmd = "clearDo" ]
rm ~/.tasks/data/Tdo.csv
touch ~/.tasks/data/Tdo.csv

else if [ $cmd = "clearDone" ]
rm ~/.tasks/data/Tdone.csv
touch ~/.tasks/data/Tdone.csv

else if [ $cmd = "display" ]
cat -n ~/.tasks/data/Tdo.csv

else if [ $cmd = "displayDone" ]
cat -n ~/.tasks/data/Tdone.csv

else if [ $cmd = "count" ]
wc -l ~/.tasks/data/Tdo.csv | cut -d " " -f 1

else
echo "Please refer the documentation for correct usage"
end
  

