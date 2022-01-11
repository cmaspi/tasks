set -x wallpaper (gsettings get org.gnome.desktop.background picture-uri)
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
else if [ $cmd = "deleteAll" ]
python3 /home/$user/.tasks/src/deleteAll.py
else if [ $cmd = "display" ]
python3 /home/$user/.tasks/src/display.py
else
echo "Please refer the documentation for correct usage"
end
  
# python3 changePicture.py $wallpaper

# gsettings set org.gnome.desktop.background picture-uri 'file:///home/cmaspi/Pictures/Wallpapers/result.jpg'