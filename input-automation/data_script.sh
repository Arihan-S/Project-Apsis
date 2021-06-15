#! /bin/bash

#notes
#Place Script in Master Directory


for (( startYear = 1958 ; startYear <= 2034 ; startYear += 2 ));
do

    #declares end year for simulation
    endYear=$(($startYear+2))
    dataDirectory=[$startYear]-[$endYear]_MASTER-8_Data

    #makes directories to store data
    mkdir $dataDirectory
    mkdir $dataDirectory/output
    mkdir $dataDirectory/input
    

    #copies acsii files to directory
   
    cp masterFiles/input/master.inp $dataDirectory/input
    cp masterFiles/input/default.con $dataDirectory/input
    cp masterFiles/input/default.def $dataDirectory/input
    cp masterFiles/input/default.sdf $dataDirectory/input
    cp -R masterFiles/input/focus $dataDirectory/input
    
    

    #replacing paths on master.cfg
    sed -i "24s|.*|  $dataDirectory/output/ -(120 char)-       Output path|" master.cfg
    sed -i "27s|.*|  $dataDirectory/input/ -(120 char)-       Input path|" master.cfg
    sed -i "28s|.*|  $dataDirectory/input/focus -(120 char)-       Input path|" master.cfg
     
    #no need to change data directory stuff

    cd $dataDirectory
    
    #replacing years on master.inp
    sed -i "27s|.*|$dataDirectory-Run|" input/master.inp
    sed -i "34s|.*| $startYear 01 01 00 -(yyyy mm dd hh)- Begin|" input/master.inp
    sed -i "35s|.*| $endYear 12 31 23 -(yyyy mm dd hh)- End|" input/master.inp

    #exit directory
    cd /home/linux/MASTER-8.0.2


    #copy config file for refrence
    cp master.cfg $dataDirectory/input
    
    #run simulation
    ./master-linux64

    #copies logfiles
    cp progress.dat $dataDirectory/
    cp logfile $dataDirectory/

done
exit 0
