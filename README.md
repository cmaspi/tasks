# Tasks
Tasks is command line utility to manage your tasks in terminal.

## Requirements
[fish shell](https://fishshell.com/)

## How to install
> $ ./install.sh  <br/>

You should be good to go. However, if you are not able to execute it, use       

> $ chmod 700 install.sh  <br/>
 
This would give read, write, execute permission to current user.

## *Commands*
### **add: to add new task**
**Example**     
```fish
$ tasks add tutorial for convex optimization
```
**Flags**       
    1. -l or --link : To add some hyperlink for resources.          
**Example**         
 ```fish
 $ tasks add tutorial for convex optimization -l "https://google.com"
 ```      
    
### delete: to delete task
    > $ tasks delete 0
### done: to move a task to 'done' section
    > $ tasks done 1
### clearAll: clears all the tasks, from both Done and To Do list
    > tasks clearAll
### clearDo: clears all the tasks from the To Do list
    > tasks clearAll
### clearDone: clears all the tasks from Done list
    > tasks clearAll
### display: shows all the remaining tasks in shell
    > tasks display
### displayDone: shows all the tasks that have been done
    > tasks displayDone

## How to uninstall
> $ ./uninstall.sh
Then remove this .tasks directory.