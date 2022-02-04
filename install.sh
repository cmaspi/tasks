#!/usr/bin/fish
set -x dir (pwd)
mv $dir ~/.tasks/ 
mkdir ~/.tasks/data
touch ~/.tasks/data/Tdo.csv
touch ~/.tasks/data/Tdone.csv

echo "alias tasks='fish ~/.tasks/run.sh'" >> ~/.config/fish/config.fish
