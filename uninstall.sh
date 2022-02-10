#!/usr/bin/fish
# removing alias
grep -v "alias tasks='fish" ~/.config/fish/config.fish > temp.txt
mv temp.txt ~/.config/fish/config.fish 
# removing tab completions for tasks
sudo rm /usr/share/fish/vendor_completions.d/tasks.fish
# removing manual for tasks
sudo rm ~/.local/share/man/man1/tasks.1.gz 