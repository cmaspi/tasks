# Tasks
Tasks is command line utility to manage your tasks.

### commands
1. add: to add new task
    > $ tasks add convex optimization tutorial
2. delete: to delete task
    > $ tasks delete 0
3. done: to move a task to 'done' section
    > $ tasks done 1
4. clearAll: clears all the tasks, from both Done and To Do list
    > tasks clearAll
5. clearDo: clears all the tasks from the To Do list
    > tasks clearAll
6. clearDone: clears all the tasks from Done list
    > tasks clearAll
7. display: shows all the remaining tasks in shell
    > tasks display
8. displayDone: shows all the tasks that have been done
    > tasks displayDone


### Requirements
1. gnome-desktop
2. fish shell

### How to install
> $ ./install.sh
You should be good to go. However, if you are not able to execute it, use
> $ chmod 700 install.sh
This would give read, write, execute permission to current user.
