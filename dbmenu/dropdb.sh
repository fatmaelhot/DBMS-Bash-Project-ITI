#!/usr/bin/bash

echo "Existance DataBases"
cd ./../DBs
ls  

    read -p "Enter the database name: " name

if [[ -d $name ]]; then
	read -p "Are you Sure You Want To drop $name Database? y/n" choice
	
	case $choice in
		 [Yy]* ) 
			rm -r ../DBs/$name
			echo "$name has been deleted"
			cd ../..
			;;
		 [Nn]* ) 
			echo "Operation Canceled"
			cd ../..
			;;
		* ) 
			echo "Invalid Choice"
			cd ../..
			;;
	esac
else
	echo "$name doesn't exist"
fi
 
