#!/bin/bash

read -p "Enter Database Name: " db_name
if [ -d "../DBs/$db_name" ];then

read -p "Enter Table Name: " table_name
else
echo "DB Name doesn't exist"
exit
fi

table_path="../DBs/$db_name/$table_name"

# Validate path 
if [ ! -f "$table_path" ]; then
    echo "Table file does not exist at: $table_path"
    exit 1
fi


# Prompt the user for a record ID
read -p "Enter record ID: " record_id

# Validate input: Check if ID is empty or not a number
if [[ -z "$record_id" || ! "$record_id" =~ ^[0-9]+$ ]]; then
    echo "Invalid or empty record ID."
    exit 
fi

# Check if the record with the specified ID exists
if grep -q "^$record_id:" "$table_path"; then
    echo "Record with ID $record_id found."
else

    echo "Record with ID $record_id not found."
    exit 
fi


# Continue with prompts for new values
read -p "Enter New Value for Field 1: " new_value_1
read -p "Enter New Value for Field 2: " new_value_2
# Add more prompts for other fields as needed


# Use AWK to update the specified record by ID
awk -v id="$record_id" -v value1="$new_value_1" -v value2="$new_value_2" '
    BEGIN { FS = ":"; OFS = ":" }
    NR == 1 { print; next }
    $1 == id { $2 = value1; $3 = value2; updated = 1 }
    { print }
    END { if (!updated) print "Record with ID " id " not found." }
' "$table_path" > "${table_path}.new"

# Replace the original table with the updated table
mv "${table_path}.new" "$table_path"

# Display success message
<<<<<<< HEAD
echo "Record with ID $record_id updated successfully."


=======
<<<<<<< HEAD
echo "Record with ID $record_id updated successfully."


 
=======
echo "Record with ID $record_id updated successfully."
>>>>>>> 9519cc7c9ed1369031d30c6365786955ef0c757c
>>>>>>> 3067ad452bcb9b3ee7188d453cbd958e9b87ecd4
