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

**add** : This command adds a task to current list.      

**addAt** : This command adds the task at given index in the list.        

**cl** : cl stands for change list, it is used to switch to mentioned list for subsequent commands      

**done** : This command marks a task done in the current list        

**ls** : This command shows the names of all the lists         

**mklist** : This command stands for make list, it is used to create another list and also it changes list to newly created list.       

**rm** : This command removes a task from the current list, it can also be used to clear entire list.       

**rmlist** : rmlist stands for remove list, it is used to remove/delete a list.     

**show** : This command lists out all the tasks from to-do list along with the tasks that have been marked as done

**use** : This command is a substitute for cl command.

**vi** : This command opens the to-do list in vi.          

**xdg** : This command opens the to-do list in default text editor.       

# Details
***add***       
Adds a task to the current list.        
*Usage*     
tasks add \[task name\] \{ -l URL \}    

***addAt***     
adds a task at a given index in the list, this is meant to serve a substitute to priority.      
*Usage*     
tasks addAt -n \[INDEX\] \[TASK NAME\] \{-l URL\}   

***cl***       
cl stands for change list, it is used to switch to given list for subsequent commands        
*Usage*     
tasks cl \[LIST NAME\]     

***done***      
marks a task as done in the current list.        
*Usage*       
tasks done \{KEYWORD\}  \{-n INDEX\} \{\-\-hash=HASH\}        
Atleast one of the parameters is important, if more than one is given, then the order of precedence is -n, \-\-hash, then KEYWORD.    

***ls***        
shows the list of lists.    
*Usage*     
tasks ls    

***mklist***        
mklist stands for make list, it is used to create a new list.     
*Usage*     
tasks mklist \[LIST NAME\]      

***rm***      
deletes a task in the current list.        
*Usage*       
tasks rm \{KEYWORD\}  \{-n INDEX\} \{\-\-hash=HASH\}        
Atleast one of the parameters is important, if more than one is given, then the order of precedence is -n, \-\-hash, then KEYWORD.      
**tasks rm .** : This command is used to clear the current list which includes both sublists.	
**tasks rm ** : This command is used to clear the "done" sublist.

***rmlist***      
rmlist stands for remove list, it tears/delete a list.     
*Usage*     
tasks rmlist \[LIST NAME\]     

***use***
use command is a substitute for the cl command.		
*Usage*
tasks use \[LIST NAME\]

***vi***    
opens the to-do list in vi         
*Usage*     
tasks vi    

***xdg***   
opens the to-do list in default text editor     
*Usage*     
tasks xdg   

# Bugs
The list of all the known bugs can be found at <https://github.com/cmaspi/tasks/issues>. Additionally, you can report any new bugs on the same.

# See Also
You can check out <https://taskwarrior.org/> which is a feature-rich, multi-platform CLI to-do list management utility, but if you are looking for something more simple, make sure to checkout <https://stevelosh.com/projects/t/>.

# Copyright
Copyright (c) 2022 Chirag Mehta. MIT License : <https://opensource.org/licenses/MIT>. This is free software: you are free to change and redistribute it. There is NO WARRANTY OF ANY KIND.
