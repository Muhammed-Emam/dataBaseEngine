#!/bin/bash
shopt -s extglob
export LC_COLLATE=C
# cd $PWD/Database
# read -p "Enter the name of databse: " databaseName
# echo "                                             "

# if [[ "$databaseName" =~ ^[a-zA-Z]*$ ]]
# then 
#      if  [ -e "$databaseName" ]
 
#     then 
#             cd $databaseName

            read -p "Enter the name of your table: " tableName
            echo "                                             "
            if [[ "$tableName" =~ ^[a-zA-Z]*$ ]]

            then     if [ -f "$tableName" ]
                     then 
                                PS3="Enter your Choice ----> "

                                set -x
                                select choice in select_all select_by_col select_by_row Exit
		                        do
		                        case $choice in 	
		                                select_all)  
			                            awk '{if(NR>3)print $0}' $tableName
                                                break;;
		                                select_by_col)

                                            NumberOfFields= awk -F":" '{if(NR==1) print NF}' "$tableName"
                                            # echo "$NumberofFields"
                                            awk '{if(NR<2)print $0}' "$tableName"
                                            read -p "Here is your columns, please choose the number of column that you want: " colNumber
                                            echo "      ---------------     " 

                                            if [[ $colNumber > $NumberOfFields ]]
                                            then echo " ERROR, your [ $colNumber ] doesn't exist in the table "
                                            else
                                                
                                                echo "---> Column number [ $colNumber ] will be:  "
                                                awk -F: '{if(NR>3)print $'$colNumber'}' "$tableName"
                                            fi
			                                ;;

		                                select_by_row)
                                            echo "Do You want to select by ID or by any other column ? "
                                            PS3=":) ----> "
                                            select ch in Yes No
                                            do
                                                case $ch in 

                                                Yes)
                                                    read -p "Enter the Id by which you want to select -->  " idNo
                                                    Allids=(awk -F: '{if(NR>3)print $1}' $tableName)
                                                    for element in $Allids
                                                    do
                                                        if [ $idNo == $element ]
                                                        then
                                                            selRow=`awk -F: '{if(NR>3){if('$idNo'==$1)print $0}}' $tableName`
                                                            echo "Your row will be ---> [$selRow]"
                                                        else
                                                            echo "sorry your id number $idNo is not found in the table"
                                                        fi
                                                    done
                                                    ;;

                                                No)
                                                    read -p "which is the word that you want to select by: " selWord
                                                    AllData=`awk -F: '{if(NR>3)print $0}' $tableName`
                                                    for element in $AllData
                                                    do
                                                        if [ $selWord == $element ]
                                                        then 
                                                                selectRow=`awk -F: '{if(NR>3){
                                                                            for(i=1;i<=NF;i++){
                                                                            if($i=='$selWord')
                                                                            print $0
                                                                            }
                                                                                }
                                                                        }' $tableName`
                                                                echo "$selectRow"
                                                        else
                                                            echo "ERROR The word $selWord is not found in the table"
                                                        fi
                                                    done   
                                                esac
                                            done
                                            ;;

                                        Exit) 
                                            break;;
                                esac
                                done
                                set +x
                    else 
                        echo "This table is not found"
                    fi
            else 
                echo "please enter the table name in string"
            fi
#     else
#         echo "The database is not found"
    
#     fi
# else
#     echo "This database should be String"
# fi


