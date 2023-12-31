#!/bin/bash

read -p "Enter Database Name: " DBName
if [ -d "../DBs/$DBName" ]; then
read -p "Enter Table Name: " TName
else
echo "DB name doesn't exist"
exit 
fi
# Check if the database and table exist

 if [ -f "../DBs/$DBName/$TName" ]; then
    # Change to the table's directory
    cd "../DBs/$DBName"

    # Display the current records in the table
    echo "Current records in $TName:"
    cat "$TName"
    echo
else
    echo " table doesn't exist."
    exit 1
fi


select var in "Delete all from table" "Delete Record" "Exit"; do
    case $var in
        "Delete Record")
    read -p "Enter the Record ID to delete: " RecordID

    # Check if the record ID is valid (non-empty and a number)
    if [[ -n $RecordID && $RecordID =~ ^[0-9]+$ ]]; then
        # Use awk to find the line number based on the ID and sed to delete the record
        linenum=$(awk -F':' -v id="$RecordID" '$1 == id {print NR; exit}' "$TName")

        if [[ -n $linenum ]]; then
            sed -i "${linenum}d" "$TName"

            # Check if sed operation was successful
            if [ $? -eq 0 ]; then
                echo "Record with ID $RecordID has been deleted."

                # Display the updated records in the table
                echo "Updated records in $TName:"
                cat "$TName"
            else
                echo "Something went wrong. Record not deleted."
            fi
        else
            echo "Record with ID $RecordID not found."
        fi
    else
        echo "Invalid Record ID. Operation canceled."
    fi
    ;;


        "Delete all from table" )
            # Get the number of rows in the table
            no_rows=$(wc -l "$TName" | cut -d " " -f1)

            # Create an empty file to effectively delete all rows
            cp /dev/null "$TName"

            # Check if the copy operation was successful
            if [ $? -eq 0 ]; then
                echo "$no_rows rows deleted successfully."
            else
                echo "Something went wrong. Rows not deleted."
            fi
            ;;
	"Exit")
	exit
	;;


    esac
done
