# TasksOnWallpaper
Pre-release   
TasksOnWallpaper is command line utility which adds you tasks list to you current wallpaper, it does support just command line interaction as well.

### commands
1. add: to add new task
    > $ tasks add convex optimization tutorial
2. delete: to delete task
    > $ tasks delete 0
3. done: to move a task to 'done' section
    > $ tasks done 1
4. deleteAll: clears all the tasks, done or not
    > tasks deleteAll
5. display: shows all the remaining tasks in shell
    > tasks display

### Requirements
1. gnome-desktop
2. fish shell

### How to install
> $ ./install.sh
You should be good to go. However, if you are not able to execute it, use
> $ chmod 700 install.sh
This would give read, write, execute permission to current user.