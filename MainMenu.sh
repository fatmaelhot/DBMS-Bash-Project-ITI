#!/bin/bash



#!/bin/bash

# Create database directory if it doesn't exist
[[ -d ./DataBase ]] || mkdir ./DataBase

while true; do
  PS3="Welcome in BDMS MainMenue: Please Select an option (1-5): "
  options=("list Database" "Create Database"  "Drop Database" "connect Databases" "Exit")

  select choice in "${options[@]}"; do
    case $REPLY in
      1)
        read -p "Enter Database Name: " DBName
        if [[ $DBName =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
          if [[ -d "./DataBase/$DBName" ]]; then
            . ./listDB.sh
          else
            echo "Database $DBName does not exist."
          fi
        else
          echo "Invalid database name. Please use only letters, numbers, and underscores "
        fi
        break
        ;;
      2)
        read -p "Enter Database Name: " DBName
        if [[ $DBName =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
          if [[ ! -d "./DataBase/$DBName" ]]; then
            . ./createDB.sh
          else
            echo "Database $DBName already exists."
          fi
        else
          echo "Invalid database name. Please use only letters, numbers, and underscores "
        fi
        break
        ;;
      
      3)
        read -p "Enter Database Name: " DBName
        . ./dbmenu/dropdb.sh
        break
        ;;
      4)
        read -p "Enter Database Username: " username
        read -s -p "Enter Database Password: " password
        echo  # Move to the next line after entering the password

        # Placeholder for actual logic to connect to the database
        echo "Connecting to database with username: $username"
        . ./dbmenu/connectdb.sh
        break
        ;;
      5)
        exit
        ;;
      *)
        echo "Invalid option. Please choose again."
        ;;
    esac
  done
  done

  
