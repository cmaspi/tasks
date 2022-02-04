set -x dir (pwd)
set -x user (whoami)

set -x cmd $argv[1]
if [ (count $argv) = 0 ]
echo "tasks ... what? Please use a valid command!"
else if [ $cmd = "add" ]
python3 /home/$user/.tasks/src/add.py $argv[2..-1]
else if [ $cmd = 'delete' ]
python3 /home/$user/.tasks/src/delete.py $argv[2]
else if [ $cmd = 'done' ]
python3 /home/$user/.tasks/src/done.py $argv[2]
python3 /home/$user/.tasks/src/delete.py $argv[2]
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
cat ~/.tasks/data/Tdo.csv
else if [ $cmd = "displayDone" ]
cat ~/.tasks/data/Tdone.csv
else
echo "Please refer the documentation for correct usage"
end
  

