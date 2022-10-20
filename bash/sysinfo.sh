#!/bin/bash
#########
   #Variables
###########

# setting up the hostname
Hostname=$(hostname)

#Setting up the operating system name
System=$(lsb_release -d | awk '{print $2,$3'})

#Setting up the ip address of the machine
IP=$(ip route | grep -w "default" | awk '{print $3}')

##Setting the amount of space available in only the root filesystem
Root=$(df -h /dev/sda3 | awk '{print $4'}| tail -1)

# Setting up the version of the operating system
Version=$(lsb_release -c | awk '{print $2,$3'})
	
###########
 #Main
#############
 
 
 
cat << EOF

================
FQDN:$Hostname
Operating system name and Version: $System / $Version
IP Adresses: $IP
Root Filesystem free space : $Root
================

EOF
