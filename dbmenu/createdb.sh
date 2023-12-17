#!/bin/bash

echo "Create a new database:"

# Loop to get a valid database name using regex
while true; do
    read -p "Enter the database name: " DataBaseName

    # Checking the name validity using regex.
    if [[ $DataBaseName =~ ^[a-zA-Z_][a-zA-Z0-9_\$\@#]*$ ]]; then
        break
    else
        echo "Enter a valid name that satisfies MYSQL naming convention"
    fi
done

# Checking the existence of the database.
if [[ -d "../DBs/$DataBaseName" ]]; then
    echo "Database with the name '$DataBaseName' already exists. Please choose another name."
    # Loop to get a valid database name after existence check
    while true; do
        read -p "Enter the database name: " DataBaseName
        if [[ ! -d "../DBs/$DataBaseName" ]]; then
            break
        else
            echo "Database with the name '$DataBaseName' already exists. Please choose another name."
        fi
    done
fi

# Creating the database
mkdir "../DBs/$DataBaseName"
echo "Database '$DataBaseName' was created successfully."

 

