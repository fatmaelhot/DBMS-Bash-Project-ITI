#! /bin/bash

read -p "Enter Database Name: " DBName

if [ -d ../DBs/$DBName ]; then
    cd ../DBs/$DBName
    echo "Tables in $DBName:"
    ls -l
    read -p "Enter Table Name: " TName

    if [ -f $TName ]; then
        read -p "Are you sure you want to drop the $TName table? (y/n): " choice

        case $choice in
            [Yy]* ) 
                rm $TName
                echo "$TName has been deleted."
                ;;
            [Nn]* ) 
                echo "Operation canceled."
                ;;
            * ) 
                echo "Invalid choice."
                ;;
        esac
    else
        echo "$TName table doesn't exist."
    fi
else
    echo "$DBName database doesn't exist."
fi


