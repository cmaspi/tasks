set -x wallpaper (gsettings get org.gnome.desktop.background picture-uri)
python3 changePicture.py $wallpaper