#!bin/bash

#this is my testing script using the container -

#installing the lxd 
which lxd > /dev/null
if [ $? -ne 0 ];then
     #need to install
     echo "Installing lxd in the virtual machine"
     sudo snap install lxd
     if [ $? -ne 0 ];then
     #failed to install lxd in the machine
     exit 1
     fi
 fi

# installing the sudo--init
ip a | grep -w "lxdbr0" > /dev/null
if [ $? -ne 0 ];then
     #need to install sudo--init
     echo "Initializing interface"
     lxd init --auto
     if [ $? -ne 0 ];then
     #failed to install sudo--init 
     exit 1
     fi
 fi
 
 ##launching a container running Ubuntu 20.04 server named COMP2101-S22
lxc list | grep -w "COMP2101-S22" > /dev/null
if [ $? -ne 0 ];then
     #need to install
     echo "Initializing interface"
     lxc launch ubuntu:20.04 COMP2101-S22
     if [ $? -ne 0 ];then
     #failed to launch a container running ubuntu 20.04 server
     exit 1
     fi
 fi
 
 ##updating the entry in /etc/hosts for hostname COMP2101-S22 with the container’s current IP address 
ip=$(lxc list | grep -w "COMP2101-S22" | awk '{print $6}' )
sudo sed -i.bkp " 2a $ip \t COMP2101-S22" /etc/hosts

##installing Apache2 
lxc exec COMP2101-S22 -- which apache2 > /dev/null
if [ $? -ne 0 ];then
     #need to install apache 2
     echo "Initializing interface"
     lxc exec COMP2101-S22 -- apt install apache2 -y >> /dev/null
     if [ $? -ne 0 ];then
     #failed to install apache2
     exit 1
     fi
 fi

#installing the curl
curl http://COMP2101-S22 
if [ $? -ne 0 ];then
     #need to install
     echo "Unsuccessful"
     else
     echo "Successful"
      
 fi
 
