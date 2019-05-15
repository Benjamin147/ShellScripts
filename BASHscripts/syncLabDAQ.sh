#!/bin/bash

## variables
time=$(date +%F)'_'$(date +%T)
mops22="mops22:/scratch/bastian"
local="/home/benni/Desktop/Programs"
localold="/home/benni/Desktop/Programs/Old_Versions_LabDAQ"



## decide which case
if [[ "$1" = "fromLab" ]]; then  ## copy local version to versionfolder and get newest version from mops22
    
    ## read password
    echo "Password: "
    read -s password    
    cp -r $local"/LabDAQ" $localold"/LabDAQ_"$time                                                  ## save local version in Old_Version
    rm -r $local"/LabDAQ"                                                                           ## delete local version
    /home/benni/Desktop/Programs/BASHscripts/copy.sh $mops22"/LabDAQ" $local $password 1> /dev/null ## copy newest version from mops22 
    echo 'Copied from mops22 to local and saved local version as LabDAQ_'$time              

elif [[ "$1" = "toLab" ]]; then  ## copy mops22 version to versionfolder and copy newest version to mops22

    ## read password
    echo "Password: "
    read -s password  
    /home/benni/Desktop/Programs/BASHscripts/copy.sh $mops22"/LabDAQ" $localold"/LabDAQ_"$time $password 1> /dev/null  ## save mops22 version 
                                                                                                                       ## in local Old_Version
    echo 'Copied from mops22 to local old version folder as LabDAQ_'$time
    /home/benni/Desktop/Programs/BASHscripts/loginanddelete.sh $time 1> /dev/null  ## save mops22 version in mops22 Old_Version
                                                                                  ## and delete mops22 LabDAQ
    echo 'Saved old mops22 version on mops22 as LabDAQ_'$time
    /home/benni/Desktop/Programs/BASHscripts/copy.sh $local"/LabDAQ" $mops22 $password 1> /dev/null  ## copy newest version to mops22
                                                                                                     ## 
    echo 'Copied from local to mops22 and saved mops22 version as /LabDAQ_'$time

elif [[ "$1" = "save" ]]; then

    cp -r $local"/LabDAQ" $localold"/LabDAQ_"$time
    echo 'Saved local version as LabDAQ_'$time
else

    echo '"fromLab" for copying from mops22 to this computer. "toLab" to update mops22. "save" for saving current version on local.'
fi
