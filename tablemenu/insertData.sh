#!/usr/bin/bash
read -p "enter the name of table" table

cd ./../DBs/$1
if [[ -f "$table" ]];then
cols=$(head -1 "$table" | awk -F: '{print NF}')
   for (( i = 1; i <=$cols; i+=2 )); do
     value=true
     ((v=$i+1))
     while $value;do
        col=$(head -1 "$table" |cut -d ':' -f$i| awk -F ":"  '{print $i}')
        type=$(head -1 "$table" |cut -d ':' -f$v| awk -F ":" '{print $v}')
        if [[ $col = "," ]];then
           echo "," >> $table
           echo "inserted record successfully"
           value=false
        else
        echo "enter $(head -1 "$table" |cut -d ':' -f$i| awk -F ":"  '{print $i}') ,its type $(head -1 "$table" |cut -d ':' -f$v| awk -F ":" '{print $v}') "
        read
         #check pk exist
            f=$(head -1 "$table" |cut -d ':' -f1| awk -F ":"  '{print $1}')
           pk=$(sed '' "$table"|cut -d ':' -f1 |grep "$REPLY")
        if [[ $pk && $col == $f ]];then
              echo "pk already exist"
              (( i=$i-2))
              value=false
               
        #check datatype
        elif [[ $type = "int" && $REPLY = +([0-9])*([0-9]) ]];then
           echo -n "$REPLY" >> "$table"
           echo -n ":" >> "$table"
           value=false
        elif [[ $type = "string" && $REPLY = +([a-zA-Z])*([a-zA-Z0-9]) ]];then
            echo -n "$REPLY" >> "$table"
            echo -n ":" >> "$table"
             value=false
        else
            echo "invalid datatype"
        fi
        fi
     done
   done
 else 
 echo "table is not exist"
fi
