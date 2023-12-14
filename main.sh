#!/usr/bin/bash


# Create a database directory if it doesn't exist

[[ -d ./DBs ]] || mkdir ./DBs

while true; do
  PS3="Welcome to BDMS Main Menu: Please Select an option (1-5): "

select var in createDB listDB dropDB connectDB Exit
do
	case $var in
		createDB )	


			 ./dbmenu/createdb.sh

			

		;;
		listDB )
			./dbmenu/listdb.sh
		;;
		dropDB ) 
		         ./dbmenu/dropdb.sh
		;;

		connectDB )

			 ./dbmenu/connectdb.sh	 

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



