param ($param1)

if ( $param1 -eq "System" ){
get-date;
echo " "
echo "----- Showing Computer System Information -----"
echo "***********************************************"
computer
echo "----- Showing Operating System Information -----"
echo "************************************************"
os
echo "----- Showing Processor Information -----"
echo "*****************************************"
processor
echo " "
echo "----- Showing Video Information -----"
echo "***************************************"
echo " "
video
}
elseif ( $param1 -eq "Disks" ){
get-date;
echo " "
echo "----- Showing Disk Information -----"
echo "************************************"
echo " "
drives
echo " "
}
elseif ( $param1 -eq "Network" ){
get-date;
echo " "
echo "----- Showing Network Information -----"
echo "***************************************"
network
}
else {
get-date;
echo " "
echo "----- Showing Computer System Information -----"
echo "***********************************************"
computer
echo "----- Showing Operating System Information -----"
echo "************************************************"
os
echo "----- Showing Processor Information -----"
echo "*****************************************"
processor
echo "----- Showing RAM Information -----"
echo "***********************************"
ram
echo " "
echo "----- Showing Drive Information -----"
echo "***********************************"
echo " "
drives
echo " "
echo "----- Showing Network Information -----"
echo "***************************************"
network
echo "----- Showing Video Information -----"
echo "***************************************"
echo " "
video
}
