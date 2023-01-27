#!/bin/bash
network_setup=$1
ip=$2
subnet=$3
gateway=$4
dns1=$5
dns2=$6
domain=$7

if [ -z "$ip" ]; then 
apt install -y openssh-server

else




apt update
apt upgrade -y

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb


fi


if [ "$network_setup" == "Y" ]; then

tee /etc/netplan/00-installer-config.yaml  << EOF
# This is the network config written by 'subiquity'
network:
  ethernets:
    wlp1s0:
            #dhcp4: true
            addresses:
                - $ip/$subnet
            routes:
                - to: default
                  via: $gateway
            nameservers:
                  search: [$domain]
                  addresses: [$dns1, $dns2]
  version: 2
EOF
fi
