echo "FQDN:$(hostname)" 
echo -e "Host Information:\n $(hostnamectl)"
echo -e "IP Adresses:\n $(hostname -I && ifconfig ens33 |  awk '/inet6/{print $2}')"
echo -e "Root Filesystem Status:\n $(df /dev/sda3)"
