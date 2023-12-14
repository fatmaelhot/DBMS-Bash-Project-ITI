#!/usr/bin/bash


# Create a database directory if it doesn't exist
<<<<<<< HEAD
[[ -d ./DBs ]] || mkdir ./DBs
=======
[[ -d ./DataBase ]] || mkdir ./DataBase
>>>>>>> fb37d6de070db90dbc02d07f0f5cd6c3baa65444

while true; do
  PS3="Welcome to BDMS Main Menu: Please Select an option (1-5): "

select var in createDB listDB dropDB connectDB Exit
do
	case $var in
		createDB )	

<<<<<<< HEAD
			 ./dbmenu/createdb.sh
=======
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

			 
>>>>>>> fb37d6de070db90dbc02d07f0f5cd6c3baa65444
		;;
		listDB )
			./dbmenu/listdb.sh
		;;
		dropDB ) 
		         ./dbmenu/dropdb.sh
		;;

		connectDB )
<<<<<<< HEAD
			 ./dbmenu/connectdb.sh	 
=======
			bash ./dbmenu/connectdb.sh

>>>>>>> fb37d6de070db90dbc02d07f0f5cd6c3baa65444
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



