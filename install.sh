#!/bin/fish
sudo apt-get -y install python3-pip &> /dev/null
pip install pillow &> /dev/null
set -x dir (pwd)
mv $dir ~/.tasks/ 
mkdir ~/.tasks/data
touch ~/.tasks/data/Tdo.csv
touch ~/.tasks/data/Tdone.csv

echo "alias tasks='fish /home/$user/.tasks/run.sh'" >> ~/.config/fish/config.fish
