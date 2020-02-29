# CS 1XA3 Project01 - Sharmd36

## Usage
Execute this script from project root with: 
`chmod +x CS1XA3/Project01/project_analyze.sh` `./CS1XA3/Project01/project_analyze.sh`

## Feature 01 - Script Input
###### Description: 
This functionality asks the user for a prompt to type in an option. The option then decided which functionality is then going to be run.
###### Execution: 
Refer to Usage

## Feature 02 - FIXME Log
###### Description: 
This command finds every file in the folder that has `#FIXME` in th last line and puts them in a file named `./Project01/fixme.log`
###### Execution:
Execute the script and select `1`

## Feature 03 - File Type Count
###### Description: 
Prompts the user to enter a specific file type and returns the number of files present in the folder with that specific extension.
###### Execution:
Execute the script and select `2`

## Feature 04 - Find Tag
###### Description: 
Prompts the user for a specifc tag and then searches all python files in the folder. The lines with the tags that are commented using `#` are saved in
a file with the name if `<tag>.log`
###### Execution:
Execution: Execute the script and select `3`

## Feature 05 - Switch To Executable
###### Description: 
Includes two features - Change and Restore. 
Change allows users with write permission to also have execute permission. Also makes a log file("permissions.log") that keeps track of the original permissions.
Restore switches the permissions back to what they were originally were.
* Note: Only works on `.sh` files 
###### Execution:
Execution: Execute the script and select `4` and then select `1` for change and `2` for restore.

## Feature 06 - Backup and Restore
###### Description: 
Includes two features - Backup and Restore. 
Backup creates a folder `./Project01/backup` where all the temporary files have been moved (`.tmp` extension). A `/Project01/backup/restore.log` file has also been created with the original file locations.
Restore places all the files in `/Project01/backup` back in their original locations. 
* Note: Only works on `.tmp` files 
###### Execution:
Execution: Execute the script and select `5` and then select `1` for backup and `2` for restore

## Custom Features

## Feature 07 - Prime number Generator
###### Description:
A script thats prompts the user for the number of prime numbers to display. The script then displays the prime numbers to the user.
###### Execution: 
Execute the script and select `6` and then type in how many prime numbers you want.

## Feature 08 - Fibonacci Check
###### Description:
A script thats prompts the user to type in a number. The script returns true or false based off whether the number is a Fibonacci number or not.
###### Execution:
Execute the script and select `7` and type in the number that you want check if it is fibonacci or not.
* Note: Feature takes `>10s` for numbers greater than 20  

