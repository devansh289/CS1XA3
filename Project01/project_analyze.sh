#!/bin/bash

echo "Welcome to the script for CS1XA3 Project 1!"
echo "Enter 1 for FIXME Log"
echo "Enter 2 for File Type Count"
echo "Enter 3 for Find Tag"
read userOption

if [ "$userOption" -eq "1" ]
then
        echo "Working on FIXME Log"
        if [ ! -f "fixme.log" ]
        then
                touch fixme.log
        else
                rm fixme.log
                touch fixme.log
        fi

        for f in `find .. -type f`
        do
                if tail -1 "$f" | grep -q "#FIXME"
                then
                        echo "$f" >> fixme.log
                fi
        done
        echo "Finished working with fixme.log"

elif [ "$userOption" -eq 2 ]
then
        echo "Type in a file extension (eg. 'txt')"
        read fileType

        fileCount=`find .. -type f -name "*.$fileType" | wc -w`

        if [ "$fileCount" -gt 0 ]
        then
                ls *."$fileType" | wc -l
        else
                echo 0
        fi
elif [ "$userOption" -eq 3 ]
then
        echo "Enter the tag you are looking for"
        read tag

        if [ -f "$tag".log ]
        then
                rm "$tag".log
        fi

        touch "$tag".log
        pyCount=`find .. -type f -name "*.py" | wc -w`

        if [ "$pyCount" -gt 0 ]
        then
                cat *.py | grep ^# | grep "$tag" >> "$tag".log
        fi
fi
