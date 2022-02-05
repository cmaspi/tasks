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
### **add / do : to add new task**
**Example**     
```fish
$ tasks add tutorial for convex optimization
```
**Flags**       
1. -l or --link : To add some hyperlink for resources.          
    ```fish
    $ tasks add tutorial for convex optimization -l "https://google.com"
    ```      
### **addAt: to add new task at a particular line**
This is meant to serve as a replacement to priority, a task with high priority can be set somewhere in the list
**Example**     
```fish
$ tasks addAt tutorial for convex optimization -n 2
```
This will push all the existing tasks from line number 2 down, and add this task at the second position
**Flags**       
1. -n or --index : To add some hyperlink for resources.          

3. -l or --link : To add some hyperlink for resources.          
    ```fish
    $ tasks add tutorial for convex optimization -l "https://google.com"
    ```      

### **delete / remove / clear : to delete task**
**Example**         
```fish
$ tasks delete convex optimization
```         
This will delete the first task containing the keywork "convex optimization", it will give a prompt to user to confirm deletion.    
**Flags** 
1. -n or --index : To specify which task to delete (line number)        
   ```fish
   tasks delete -n 3
   ```     
   This is delete the task in third line, it will return error if there is no line corresponding to specified line number.     
2. -H or --hash : This will delete the task corresponding to specified hash, if there is collision, it will delete the first one

### **done: to mark task as done**
**Example**         
```fish
$ tasks done convex optimization
```         
This will mark the first task containing the keywork "convex optimization" done, it will give a prompt to user to confirm.    
**Flags** 
1. -n or --index : To specify which task to delete (line number)        
   ```fish
   tasks done -n 3
   ```     
   This is mark the task in third line done, it will return error if there is no line corresponding to specified line number.     
2. -H or --hash : This will delete the task corresponding to specified hash, if there is collision, it will consider the first one

### clearAll / deleteAll / clear-all / delete-all : clears all the tasks, from both Done and To Do list
```fish
tasks clearAll
```
### clearDo / deleteDo / clear-do / delete-do : clears all the tasks from the To Do list
```fish
tasks clearAll
```
### clearDone / deleteDone / clear-done / delete-done : clears all the tasks from Done list
```fish
tasks clearAll
```
### display / show : shows all the remaining tasks in the do list
```fish
tasks display
```
### displayDone / showDone / show-done / display-done : shows all the tasks that have been done
```fish
tasks displayDone
```

## How to uninstall
```fish
$ ./uninstall.sh
```
Then remove ~/.tasks directory.