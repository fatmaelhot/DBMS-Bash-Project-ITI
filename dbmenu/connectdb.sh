#!/usr/bin/bash
echo "Available DataBases"
ls -1 ../DBs/

read -p "Enter DataBase Name: " db

if [[ $db = '' ]];then
   echo "please enter correct name"
   
elif [[ -d ../DBs/$db ]]; then
	select var in "create table" "insert record" "Select from table" "drop table" "list table" "update table" "Delete from table" "disconnect"
	do
		case $var in
			"create table" )	
				bash tableMenu/createtable.sh $db
				;;
			"drop table" )
				bash tableMenu/droptable.sh $db
				;;
			"update table" )  
				tableMenu/updatetable.sh $db
				;;
			"insert record")
				tableMenu/insert.sh $db
				;;
			"Delete from table" )  
					bash tableMenu/deleterec.sh $db
				;;
			"Select from table" )
					bash tableMenu/selectrec.sh $db
				;;
			"disconnect" )
			        exit
			        ;;
			* ) 
			         echo "$REPLY is incorrect input";
			
				;;
		esac

	done
else
	echo "$db isn't exist";
fi
