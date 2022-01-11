set -x wallpaper (gsettings get org.gnome.desktop.background picture-uri)

set -x cmd $argv[1]
if [ $cmd = "add" ]
python3 add.py $argv[2..-1]
else if [ $cmd = 'delete' ]
python3 delete.py $argv[2]
else if [ $cmd = 'done' ]
python3 done.py $argv[2]
python3 delete.py $argv[2]
else if [ $cmd = "deleteAll" ]
python3 deleteAll.py
else
echo "Please refer the documentation for correct usage"
end
  
# python3 changePicture.py $wallpaper

# gsettings set org.gnome.desktop.background picture-uri 'file:///home/cmaspi/Pictures/Wallpapers/result.jpg'