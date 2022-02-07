#!/usr/bin/fish
set -x dir (pwd)
mv $dir ~/.tasks/ 
chmod 700 ~/.tasks/run.sh
mkdir ~/.tasks/lists
mkdir ~/.tasks/lists/base
touch ~/.tasks/base/Tdo.csv
touch ~/.tasks/base/Tdone.csv
echo "set list lists/base" > ~/.tasks/meta/env

echo "alias tasks='fish ~/.tasks/run.sh'" >> ~/.config/fish/config.fish
