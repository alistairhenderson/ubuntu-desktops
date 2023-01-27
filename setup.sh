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

rm google-chrome-stable_current_amd64*

fi


if [ "$network_setup" == "Y" ]; then

tee /etc/netplan/02-static-ip.yaml  << EOF
# Set static ip address for enp1s0 interface
network:
    version: 2
    renderer: NetworkManager
    ethernets:
        id0:
            match:
                name: wlp1s0
            dhcp4: false
            addresses:
                - $ip/$subnet
            nameservers:
                addresses:
                    search: [radius-systems-ads]
                    addresses: [$dns1, $dns2]
            routes:
                - to: default
                  via: $gateway
EOF
fi
