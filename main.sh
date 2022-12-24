#!/bin/bash
# Author : E3TU
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
echo "Do you want to run (1)Rkhunter (2)Chkrootkit (3)Both"
read input
echo "test $input"
if [ $input == 1 ]
then
    echo "Checking for rkhunter updates..."
    sudo rkhunter --update
    echo "Running propupd(this might take a while)..."
    sudo rkhunter --propupd
    echo "Scanning for rootkits..."
    sudo rkhunter --checkall --sk
fi

if [ $input == 2 ]
then
    echo "Running chkrootkit..."
    sudo chkrootkit
fi

if [ $input == 3 ]
then
    echo "Running both rkhunter(includes update checking) and chkrootkit..."
    sudo rkhunter --update
    sudo rkhunter --propupd
    sudo rkhunter --checkall --sk
    sudo chkrootkit
fi