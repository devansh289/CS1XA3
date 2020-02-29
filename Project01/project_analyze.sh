#!/bin/bash

echo "Welcome to the script for CS1XA3 Project 1!"
echo "Enter 1 for FIXME Log"
echo "Enter 2 for File Type Count"
echo "Enter 3 for Find Tag"
echo "Enter 4 for Switch to Executable"
echo "Enter 5 for Backup and Restore"
echo "Enter 6 for Prime Number Generator (CUSTOM FEATURE)"
echo "Enter 7 for Fibonacci Check (CUSTOM FEATURE)"
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
elif [ "$userOption" -eq 4 ]
then
	if [ ! -f "permissions.log" ]
	then
		touch "permissions.log"
	fi

	echo "Type 1 for Change, Type 2 for Restore"
	read option

	if [ "$option" -eq 1 ]
	then
		> "permissions.log"
		for file in `find . -name '*sh' -ls | awk {'print substr($3,2,10) substr($11,0)'}`
		do
			echo `stat -c '%a' "${file:9}"` "$file" >> "permissions.log"
			if [[ `echo "${file:1:1}"`  == "w" ]]
			then
				chmod u+x "${file:9}"
			fi

			if [[ `echo "${file:4:1}"`  == "w" ]]
                        then
				chmod g+x "${file:9}"
			fi

			if [[ `echo "${file:7:1}"`  == "w" ]]
                        then
                                 chmod o+x "${file:9}"
                        fi

		done
		echo "Updated Permissions"
	elif [ "$option" -eq 2 ]
	then
		cat permissions.log | while read line
		do
   			chmod "${line:0:3}" "${line:13}"
		done
		echo "Permissions Restored"
	fi
elif [ "$userOption" -eq 5 ]
then
	echo "Type in 1 for Backup and 2 for restore"
	read option

	if [ "$option" -eq 1 ]
	then

		echo "You have selected Backup"

		if [ -d "backup" ]
        	then
                	rm -r "backup"
        	fi

		mkdir backup
		find .. -path "../Project01/backup" -prune -o -name '*tmp' -print > "./backup/restore.log"
		find .. -path ../Project01/backup -prune -o -name '*tmp' -exec mv {} backup \;

		echo "You have created a Backup!"
	elif [ "$option" -eq 2 ]
	then
		echo "You have selcted Restore"
		cat ./backup/restore.log | while read line
                do
			defaultLoco="./backup/"
                        filename="${line##*/}"

			if [ -f "${defaultLoco}${filename}" ]
			then
				defaultLoco="./backup/"
				filename="${line##*/}"
				mv "${defaultLoco}${filename}" "$line"
			else
				echo "${defaultLoco}${filename}" "could not be recovered"
			fi
                done
                echo "Restore performed"
	fi
elif [ "$userOption" -eq 6 ]
then
	echo -n "How many prime numbers to print?"
	read n
	echo -n "First prime numbers are: 2 "
	count=1
	isPrime=1
	for(( i=3; "$count"<n; i++))
	do
		for(( j=2; j<i-2; j++))
		do
			if [ `expr $i % $j` -eq 0 ]
			then
				isPrime=0
			fi
		done
		if [ "$isPrime" -eq 1 ]
		then
			echo -n "$i "
			count=`expr "$count" + 1`
		fi
		isPrime=1

	done
elif [ "$userOption" -eq 7 ]
then
	echo "Fibonacci number check"
	echo "Enter the number you want to test"
	echo "Caution: numbers above 20 might take >10s"
	read n
	perfect_square() {
		isFib=0
        	i=1
        	tempSquare=0
        	while [ "$i" -le "$1" ]
        	do
        		tempSquare=`expr $i \* $i`
        		if [ "$tempSquare" -eq "$1" ]
        		then
                		isFib=1
                		break
        		fi
        		i=`expr $i + 1`
		done

		if [ "$isFib" -eq 1 ]
		then
			echo 1
		else
			echo 0
		fi

	}

	a1=`expr 5 \* $n \* $n + 4`
	a2=`expr 5 \* $n \* $n - 4`
	l1=`perfect_square "$a1"`
	l2=`perfect_square "$a1"`

	if [ "$l1" -eq 1 ] ||  [ "$l2" -eq 1 ]
	then
		echo "$n is a Fibonacci number"
	else
		echo "$n is not a Fibonacci number"
	fi

fi
