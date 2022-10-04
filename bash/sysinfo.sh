#!/bin/bash
echo -e "Report for myvm\n==============="
#Setting the system’s fully-qualified domain name (FQDN)
echo "FQDN:$(hostname)" 

#Setting  the  operating system name and version,
echo -e "Operating system name and Version: $(lsb_release -d | awk '{print $2,$3'})"

#Setting any IP addresses the machine has; 
echo -e "IP Adresses: $(hostname -I)"

#Setting the amount of space available in only the root filesystem
echo -e "Root Filesystem free space : $(df -h /dev/sda3 | awk '{print $4'}| tail -1)"
echo -e "================"
