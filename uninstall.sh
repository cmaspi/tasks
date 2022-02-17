#!/usr/bin/fish

# removing tab completions for tasks
rm ~/.local/share/fish/generated_completions/tasks.fish
# removing manual for tasks
rm ~/.local/share/man/man1/tasks.1.gz 
# removing tasks executable
rm ~/.local/bin/tasks
# removing directory from lib
rm -r ~/.local/lib/tasks
