![Couldn't load image](https://github.com/cmaspi/tasks/blob/stable/img/logo.png)

# Tasks
Tasks is command line utility to manage your tasks in terminal.

## But why?
Tasks has been created to satisfy my needs, which are being able to clearly list my tasks, prioritise them occasionally, be able to maintain several lists, something which offers tab completion. Sure, [taskwarrior](https://taskwarrior.org/) or [t](https://stevelosh.com/projects/t/) are great alternatives, but the ideology behind tasks is somewhat similar to t, that is simplicity. Why choose tasks over t? Just because I care about certain features, like tab completion, or be able to add a clickable link etc. If these features are useful to you, go ahead the alternatives are rather promising.

## What does tasks offer?
Tasks is a command line utility for fish shell, it's for the people who love linux and fish shell. It is meant to be simple, but still have some features that might not be as appealing in a simple txt file. Sure, complex objectives can be achieved by using <code>tasks vi</code> or <code>tasks xdg</code> command to open the to-do list. You can always build on this utility, want to add the number of tasks to your prompt? sure, use <code>math (tasks | wc -l) -1</code>. You could potentially create a sync of these lists, each time a list is changed, it could be pushed to a remote. However, by design tasks is originally meant to be used on a single device, this is where one would probably prefer t.

## Requirements
[fish shell](https://fishshell.com/)        

## How to install
```shell
$ ./install.sh  
```

## How to uninstall
```fish
$ $HOME/.local/lib/tasks/./uninstall.sh
```

## LICENSE
Tasks is released under the MIT License. Check the [LICENSE](https://github.com/cmaspi/tasks/blob/stable/LICENSE) file for more details.