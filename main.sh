#!/bin/bash
# Author : E3TU
continueUse=1;

while [ $continueUse = 1 ]
do
    if [[ $UID != 0 ]]; then
        echo "Please run this script with sudo:"
        echo "sudo $0 $*"
        exit 1
    fi
    echo "Do you want to run (1)Rkhunter (2)Check for rkhunter updates (3)Chkrootkit (4)Both (5)Quit"
    read input
    if [ $input == 1 ]
    then
        echo "Scanning for rootkits..."
        sudo rkhunter --checkall --sk
    fi

    if [ $input == 2 ]
    then
        echo "Checking for rkhunter updates..."
        sudo rkhunter --update
        echo "Running propupd(this might take a while)..."
        sudo rkhunter --propupd
    fi

    if [ $input == 3 ]
    then
        echo "Running chkrootkit..."
        sudo chkrootkit
    fi

    if [ $input == 4 ]
    then
        echo "Running both chkrootkit and rkhunter"
        sudo rkhunter --checkall --sk
        sudo chkrootkit
    fi
    if [ $input == 5 ]
    then
        continueUse=2;
    fi
done