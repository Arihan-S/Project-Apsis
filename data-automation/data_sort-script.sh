#! /bin/bash

#place script in drectory containg folders generated from previous script
#make sure paths are correct for echo and grep commands

#creates results file and adds boilerplate
touch densityMaster.txt
echo -e  "----------------SOF-------------------\n" > densityMaster.txt

for (( startYear = 1958 ; startYear <= 2034 ; startYear += 2 ));
do


    #declares end year for simulation
    endYear=$(($startYear+2))
    dataDirectory=\[$startYear\]-\[$endYear\]_MASTER-8_Data

    #controls directory of data
    cd $dataDirectory/output
    
    #fetches results line and formats it
    echo -e  "$dataDirectory " >> /Users/lithereum/Desktop/OUTPUT_DATA_UPDATED/densityMaster.txt
    grep cell  master_t.__2 >> /Users/lithereum/Desktop/OUTPUT_DATA_UPDATED/densityMaster.txt
    echo -e  "\n"  >> /Users/lithereum/Desktop/OUTPUT_DATA_UPDATED/densityMaster.txt
    cd /Users/lithereum/Desktop/OUTPUT_DATA_UPDATED 

done
exit 0
