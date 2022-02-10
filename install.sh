#!/usr/bin/fish
set -x dir (pwd)
# moving directory to home/$USER/.tasks/
mv $dir ~/.tasks/ 
# run.sh should be executable
chmod 700 ~/.tasks/run.sh
# making lists directory, this would contain all the lists
mkdir ~/.tasks/lists
# base list
mkdir ~/.tasks/lists/base
touch ~/.tasks/lists/base/Tdo.csv
touch ~/.tasks/lists/base/Tdone.csv
# adding tab completion
sudo mv ~/.tasks/tasks.fish /usr/share/fish/cendor_completion.d/
# adding manual
sudo cp tasks.1.gz ~/.local/share/man/man1/
# list variable
echo "set list base" > ~/.tasks/meta/env
# adding alias
echo "alias tasks='~/.tasks/./run.sh'" >> ~/.config/fish/config.fish
