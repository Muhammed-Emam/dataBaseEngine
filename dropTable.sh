#!/bin/bash
shopt -s extglob
export LC_COLLATE=C
cd $PWD/Database
read -p "Enter Your Database name:  " $nameBase
if [[ "$nameBase" =~ ^[a-zA-Z]*$ ]] 
then
          
        if [ -e $nameBase ]
		then 
				cd $nameBase
              
				read -p "Enter the name of the table you want to drop :  " nameOfTable
	
				if [[ "$nameOfTable" =~ ^[a-zA-Z]*$ ]]
				then 
						if [ -e $nameOfTable ]
						then 
				      		rm $nameOfTable
					  		echo "Your table has been dropped successfully"
						else
							echo "***ERROR, your table doesn't exist***"

						fi
	    		else
					echo "***ERROR, enter a string for the table name***" 
				fi        
	             
		        
		        
		else 
			echo "***This database doesn't exist***"
		fi		
else
      echo "***ERROR, please enter a string for the database name***"
fi	