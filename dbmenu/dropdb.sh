#!/usr/bin/bash
echo "Existance DataBases"
ls -1 ./DBs
read -p "Enter DataBase Name: " name
if [[ -d DBs/$name ]]; then
	read -p "Are you Sure You Want To drop $name Database? y/n" choice
	
	case $choice in
		 [Yy]* ) 
			rm -r DBs/$name
			echo "$name has been deleted"
			;;
		 [Nn]* ) 
			echo "Operation Canceled"
			;;
		* ) 
			echo "Invalid Choice"
			;;
	esac
else
	echo "$name doesn't exist"
fi
