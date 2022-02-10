#!/usr/bin/fish
grep -v "alias tasks='fish" ~/.config/fish/config.fish > temp.txt
mv temp.txt ~/.config/fish/config.fish 
sudo rm /usr/share/fish/vendor_completions.d/tasks.fish