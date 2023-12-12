#!/usr/bin/bash
select var in createDB listDB dropDB connectDB Exit
do
	case $var in
		createDB )	
			 
		;;
		listDB )
			
		;;
		dropDB ) 
		        bash ./dbmenu/dropdb.sh
		;;

		connectDB )
			bash ./dbmenu/connectdb.sh
		;;
		Exit )
		   exit
		;;
		* ) 
		     echo "$REPLY is incorrect input";
		     exit
		;;
	esac

done
