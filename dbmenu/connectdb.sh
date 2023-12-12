#!/usr/bin/bash
echo "Available DataBases"
ls -1 ~/DBMS-bashScript/DBs/
read -p "Enter DataBase Name: " db
if [[ -d ~/DBMS-bashScript/DBs/$db ]]; then
	select var in "create table" "insert record" "Select from table" "drop table" "list table" "update table" "Delete from table" "disconnect"
	do
		case $var in
			"create table" )	
				bash tableactions/createtable.sh $db
				;;
			"drop table" )
				bash tableactions/droptable.sh $db
				;;
			"update table" )  
				tableactions/updatetable.sh $db
				;;
			"insert record")
				tableactions/insert.sh $db
				;;
			"Delete from table" )  
					bash tableactions/deleterec.sh $db
				;;
			"Select from table" )
					bash tableactions/selectrec.sh $db
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
