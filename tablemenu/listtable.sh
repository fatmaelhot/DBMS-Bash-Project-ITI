#! /bin/bash
read -p "enter DB name " DBName
# Check if the data base exist
if [ -d "../DBs/$DBName" ]; then
cd ../DBs/$DBName
else
echo "Error,try again"
exit 1
fi

select var in "list all tables" "list spesific table" "Exit";
do
case $var in

"list all tables")
ls -l ../$DBName/
;;

"list spesific table")

read -p "Enter table name: " TBName

# Check if the table file exists
if [ -f "../$DBName/$TBName" ]; then
    # If the file exists, display its content
    cat "../$DBName/$TBName"
else
    # If the file doesn't exist, show an error message
    echo "Table does not exist"
fi

;;
"Exit" )
exit
;;

* ) 
 echo "$REPLY is incorrect input";
		     exit
		;;

esac
done
