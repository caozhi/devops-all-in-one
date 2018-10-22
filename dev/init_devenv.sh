#!/bin/bash
###############################################################################
######  This script will do clone codes from GitHub then init your       ######
######  Eclipse project.                                                  ######
###############################################################################

target_path=$1
file_count=`ls $target_path | wc -l | awk '{print $1}'`

###############################################################################
######      check the target path must be an empty folder                ######
###############################################################################
if [[ $file_count != 0 ]] ;
then  
    echo Please make sure target path is an empty folder !!! 
    exit 1
fi



###############################################################################
######      1. clone reposiroy from GitHub                               ######
######      2. init the project as a Eclipse project                     ######
###############################################################################
cd $target_path
git clone git@github.com:caozhi/sample-project.git
cd sample-project/sample-app
mvn eclipse:eclipse -Dwtpversion=2.0 

echo You can import the project into your Eclipse now !!! 









