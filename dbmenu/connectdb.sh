#!/usr/bin/bash
echo "Available DataBases"
ls -1 ./../DBs

read -p "Enter DataBase Name: " db

if [[ $db = '' ]];then
   echo "please enter correct name"
   
elif [[ -d ../DBs/$db ]]; then
	select var in "create table" "insert record" "Select from table" "drop table" "list table" "update table" "Delete from table" "disconnect"
	do
		case $var in
			"create table" )	
				cd ./../tablemenu
				./createtable.sh $db
				;;
			"drop table" )
				cd ./../tablemenu 
				./droptable.sh $db
				;;
			"list table" )
				cd ./../tablemenu
				./listtable.sh $db
				;;
			"update table" )  
				cd ./../tablemenu
				./updattable.sh $db
				;;
			"insert record")
				cd ./../tablemenu 
				./insertData.sh $db
				;;
			"Delete from table" )  
					cd ./../tablemenu
                                           ./deletetable.sh $db
					
				;;
			"Select from table" )
				cd ./../tablemenu 
				./select.sh $db
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
