#!/usr/bin/fish
set -x dir (pwd)
set -x loc "$HOME/.local/lib/tasks"
# moving directory to ~/.local/lib/
mv $dir $loc
# making lists directory, this would contain all the lists
mkdir $loc/lists
# base list
mkdir $loc/lists/base
touch $loc/lists/base/Tdo.csv
touch $loc/lists/base/Tdone.csv
# adding tab completion
cp $loc/completions/tasks.fish ~/.local/share/fish/generated_completions/
# adding manual
cp $loc/manual/tasks.1.gz ~/.local/share/man/man1/
# list variable
echo "set list base" > $loc/meta/env
# adding executable to path
cp $loc/tasks $HOME/.local/bin/

