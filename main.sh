#!/usr/bin/bash

# Create a database directory if it doesn't exist
[[ -d ./DataBase ]] || mkdir ./DataBase

while true; do
  PS3="Welcome to BDMS Main Menu: Please Select an option (1-5): "
select var in createDB listDB dropDB connectDB Exit
do
	case $var in
		createDB )	
			 ./CreateDB.sh
		;;
		listDB )
			./listDB.sh
		;;
		dropDB ) 
		         ./dropdb.sh
		;;

		connectDB )
			 ./connectdb.sh
		;;
		Exit )
		   exit
		;;
		* ) 
		     echo "$REPLY is incorrect input";
		     exit
		;;
	esac
break

done
done
