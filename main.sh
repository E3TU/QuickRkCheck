#!/bin/bash
# Author : E3TU
continueUse=1;

while [ $continueUse = 1 ]
do
    if [[ $UID != 0 ]]; then
        echo "Please run this script as root:"
        echo "sudo $0 $*"
        exit 1
    fi
    echo "Do you want to run (1)Rkhunter (2)Chkrootkit (3)Both (4)Quit"
    read -r input
    if [ "$input" == 1 ]
    then
        echo "Checking for rkhunter updates..."
        sudo rkhunter --update
        echo "Updating the file properties database(this might take a while)..."
        sudo rkhunter --propupd
        echo "Scanning for rootkits..."
        sudo rkhunter --checkall --sk
    fi

    if [ "$input" == 2 ]
    then
        echo "Running chkrootkit..."
        sudo chkrootkit
    fi

    if [ "$input" == 3 ]
    then
        echo "Running both chkrootkit and rkhunter"
        echo "Checking for rkhunter updates..."
        sudo rkhunter --update
        echo "Running propupd(this might take a while)..."
        sudo rkhunter --propupd
        sudo rkhunter --checkall --sk
        sudo chkrootkit
    fi

    if [ "$input" == 4 ]
    then
        continueUse=2;
    fi
done
