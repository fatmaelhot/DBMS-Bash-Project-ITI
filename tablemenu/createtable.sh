#!/usr/bin/bash
createFields(){
  if [[ -f $tablename ]];then
      #num of cols
      value=true
      while $value;
      do
         read -p "Enter numbers of columns" cols
         if [[ $cols=+([0-9])*([0-9]) ]];then
            value=false
         else
             echo "enter valid number"
         fi
      done
      
      #pk name
      while $value;
      do
         read -p "Enter name of primary key" pkname
         #check if null
         if [[ $pkname = '' ]];then
            echo "enter the name of pk please"
         #special characters
         elif [[ $pkname ~ [@></.:-&^%$|] ]];then
             echo "you can not use special character in the name"
         #valid name
         elif [[ $pkname =~ ^[a-zA-Z] ]];then
             echo -n $pkname >> ../DBs/$1/$tablename
             echo -n ":" >> ../DBs/$1/$tablename
             value=false
         else
             echo "pk cannot start with numbers or special charachter"
         fi
      done
      
      #pk datatype
      while $value;
      do
         echo "Enter datatype of primary key"
         select datatype in "int" "string"; do
                if [[ $datatype = "int" || $datatype = "string" ]];then
                    echo -n $datatype >> ../DBs/$1/$tablename
                    echo -n ":" >> ../DBs/$1/$tablename
                    value=false
                else
                    echo "enter valid choice"
                fi
         done
      done
      
      #to create the rest of columns
      for (( i = 1; i < cols; i++ ));do
         #column name
      while $value;
      do
         read -p "Enter name of column : " colname
         #check if null
         if [[ $colname = '' ]];then
            echo "incorrect ,enter the name of column please"
         #special characters
         elif [[ $colname ~ [@></.:-&^%$|] ]];then
             echo "you can not use special character in the name"
         #valid name
         elif [[ $colname =~ ^[a-zA-Z] ]];then
             echo -n $colname >> ../DBs/$1/$tablename
             echo -n ":" >> ../DBs/$1/$tablename
             value=false
         else
             echo "column name cannot start with numbers or special charachter"
         fi
      done
         #column datatype
       while $value;
      do
         echo "Enter datatype of column"
         select datatype in "int" "string"; do
                if [[ $datatype = "int" || $datatype = "string" ]];then
                    echo -n $datatype >> ../DBs/$1/$tablename
                    echo -n ":" >> ../DBs/$1/$tablename
                    value=false
                else
                    echo "enter valid choice"
                fi
         done
      done
      
      
    done
 fi
}


read -p "Enter the name of table : " tablename

#check if null
if [[ $tablename = "" ]];then
    echo "please enter the name"
#check special characters
elif [[ $tablename =~ [@></.:-&^%$|] ]];then
    echo "you can not enter these characters"
#check if exist before
elif [[ -e $tablename ]];then
    echo "this name is already exist"
#make new table
elif [[ $tablename =~ ^[a-zA-Z] ]];then
    cd ../DBs/$1/
    touch $tablename
    createFields;
else  
    echo "table name can not start with numbers or special character "
fi


