set -x wallpaper (gsettings get org.gnome.desktop.background picture-uri)
python3 changePicture.py $wallpaper
gsettings set org.gnome.desktop.background picture-uri 'file:///home/cmaspi/Pictures/Wallpapers/result.jpg'