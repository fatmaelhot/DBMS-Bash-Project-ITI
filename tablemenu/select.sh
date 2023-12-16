#!/usr/bin/bash
 read -p "enter the name of table" table

cd ./../DBs/$1
if [[ -f "$table" ]];then
     select choice in "select all" "select specific record"
     do
     case $REPLY in 
        1)
        sed 1d $table|cat -n  
        ;;
        2)
         
        select col in `head -1 "$table" |awk -F':' '{ for ( i = 1; i <NF; i+=2 ) print $i}' ` 
          do
            read -p "enter value" value
            
               cols=$(head -1 "$table" | awk -F: '{print NF}')
                for (( i = 1; i <=$cols/2; i++)); do
                   case $REPLY in
                   $i)
                     
                    awk -F':' -v value="$value" -v reply="$REPLY" '{ for (i = 1; i < NF; i++) if ($i == value && i == reply) print $0 }' "$table"

                   ;;
                   esac
                done
             
          done
        ;;
      esac  
     done 
    
else 
 echo "table is not exist"
fi
