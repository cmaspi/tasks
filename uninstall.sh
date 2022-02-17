#!/usr/bin/fish

# removing tab completions for tasks
rm $HOME/.local/share/fish/generated_completions/tasks.fish
# removing manual for tasks
rm $HOME/.local/share/man/man1/tasks.1.gz 
# removing tasks executable
rm $HOME/.local/bin/tasks
# removing directory from lib
rm -r $HOME/.local/lib/tasks
