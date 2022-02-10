% TASKS(1) tasks 2.0
% Chirag Mehta <https://github.com/cmaspi>
% February 2022

# Name
**Tasks** - simple CLI to-do list management utility.

# Synopsis
**tasks** \[commands\] \{OPTIONS\}

# Description
Tasks is a CLI to-do list management utility, to maintain multiple to-do lists along with the done lists. 

# Terminology
*sublist* : To-do and done lists will be referred to as sublists.           
*list* : These are the more broad, each list contains both to-do and done list. Think of it like how grocery list and homework lists are different, each has tasks which are yet to be done, and some are done, for grocery, it would ofcourse mean whether an item has been procured or not.

# Ideology
Each task is assigned a hash which is just first seven characters from md5 hash, the purpose is purely to make it more aesthetic. Lists are inspired from conda environments, which is why "base" list is default and cannot be deleted/torn. Similarly, to add or remove a task from a list, it first needs to be activated, but since activating a list doesn't make sense, use is the equivalent command. 

## What is current list?
The current list refers to the list on which all the actions such as add, delete, show, clear etc would be done. The default list is base. The show command shows the current list, you can always switch between the different lists, list commands shows the available lists, the current list is preceeded with an asterisk(*).

# Options
**\-\-help -h** : shows this summary of commands. It should be used directly with tasks.      

**\-\-version -v** : shows the version of tasks utility.      

**\-\-index -n** : it is to be used with delete, done and addAt commands. It refers to the position or index.     

**\-\-hash -H** : it is to be used with delete, done commands. It is always an optional argument.       
***Usage***     
\-\-hash=\[HASH\]        

**\-\-link -l** : it is to be used with add, addAt commands. It is always an option argument, it is used to give an hyperlink to the task, it will be displayed as "Resource".      
***Usage***         
\-\-link \[https link\]

# Commands
Please refer Details for detailed explanation of some commands.        
**add** : adds a task to current list      

**done** : marks a task done in the current list        

**rm/ delete** : removes a task from the current list       

**show/ display** : lists out all the tasks from to-do sublist in current list      

**showDone/ displayDone** : lists out all the tasks that have been marked as done in the current list       

**create** : creates another list       

**tear** : tears/deletes a list     

**list** : shows the names of all the lists         

**use** : switch to mentioned list for subsequent commands      

**addAt** : adds the task at given index in the list    

**clean/ clear** : clears both to-do and done sublists in the current list      

**cleanDo/ clearDo** : clears the to-do sublist in current list         

**cleanDone/ clearDone** : clears the done sublist in the current list

# Details
***add***       
Adds a task to the current list.        
*Usage*     
tasks add \[task name\] \{ -l URL \}    

***done***      
marks a task as done in the current list.        
*Usage*       
tasks done \{KEYWORD\}  \{-n INDEX\} \{\-\-hash=HASH\}        
Atleast one of the parameters is important, if more than one is given, then the order of precedence is -n, \-\-hash, then KEYWORD.          

***rm/ delete***      
delete a task in the current list.        
*Usage*       
tasks rm \{KEYWORD\}  \{-n INDEX\} \{\-\-hash=HASH\}        
Atleast one of the parameters is important, if more than one is given, then the order of precedence is -n, \-\-hash, then KEYWORD.          

***addAt***     
adds a task at a given index in the list, this is meant to serve a substitute to priority.      
*Usage*     
tasks addAt -n \[INDEX\] \[TASK NAME\] \{-l URL\}   

***create***        
creates a new list.     
*Usage*     
tasks create \[LIST NAME\]      

***use***       
switch to given list for subsequent commands        
*Usage*     
tasks use \[LIST NAME\]     

***tear***      
tears/delete a list     
*Usage*     
tasks tear \[LIST NAME\]        


# Bugs
The list of all the known bugs can be found at <https://github.com/cmaspi/tasks/issues>. Additionally, you can report any new bugs on the same.

# See Also
You can check out <https://taskwarrior.org/> which is a feature-rich, multi-platform CLI to-do list management utility.

# Copyright
Copyright (c) 2022 Chirag Mehta. MIT License : <https://opensource.org/licenses/MIT>. This is free software: you are free to change and redistribute it. There is NO WARRANTY OF ANY KIND.