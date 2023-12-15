#!/usr/bin/bash

# Create a new database by checking two conditions:
# - Its existence in the Database system.
# - A valid name.


echo "Enter the database name: "
read DataBaseName

# Checking the name validity using regex.
if ! [[ $DataBaseName =~ ^[a-zA-Z_][a-zA-Z0-9_\$\@#]*$ ]]; then

echo "Enter a valid name that satisfies MYSQL naming convention"
    read -p "Enter the database name: " DataBaseName
fi
   # Checking the existence of the database.
      if [[ -d ../../DBs/$DataBaseName ]]; then
      echo "Database with the name '$DataBaseName' already exists. Please choose another name."
	read -p "Enter the database name: " DataBaseName
mkdir ../../DBs/"$DataBaseName"
      echo "Database '$DataBaseName' was created successfully."
	
   
     else
      mkdir ./../DBs/"$DataBaseName"
      echo "Database '$DataBaseName' was created successfully."
    fi

    

