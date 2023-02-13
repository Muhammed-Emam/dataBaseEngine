#!/bin/bash
shopt -s extglob
export LC_COLLATE=C
        read -p "Enter Your Database name: " $nameBase
		if [[ $nameBase =~ ^[a-zA-Z]*$ ]]
		then 
				if [ -e "$nameBase" ]  
   				then 
				    cd $PWD/Database/$nameBase
					echo "$PWD"
                	ls $nameBase
        		else
					echo "Sorry this database doesn't exist "	
				fi   
		else 
			echo "you should have entered a string"
		fi	