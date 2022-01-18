#!/bin/fish
sudo apt-get -y install python3-pip &> /dev/null
pip install pillow &> /dev/null
set -x dir (pwd)
set -x user (whoami)
mv $dir /home/$user/.tasks/ 

echo "alias tasks='fish /home/$user/.tasks/run.sh'" >> ~/.config/fish/config.fish
