#!/usr/bin/fish
set -x dir (pwd)
mv $dir ~/.tasks/ 
chmod 700 ~/.tasks/run.sh
mkdir ~/.tasks/lists
mkdir ~/.tasks/lists/base
touch ~/.tasks/lists/base/Tdo.csv
touch ~/.tasks/lists/base/Tdone.csv
sudo mv ~/.tasks/tasks.fish /usr/share/fish/cendor_completion.d/
echo "set list base" > ~/.tasks/meta/env

echo "alias tasks='~/.tasks/./run.sh'" >> ~/.config/fish/config.fish
