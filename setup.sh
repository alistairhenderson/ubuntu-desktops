#!/bin/bash
ip_address=$1
subnet=$2
gateway=$3
DNS_1=$4
DNS_2=$5


if [ -z "$var" ]; then 
apt install -y openssh-server

else


apt update
apt upgrade

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

dpkg -i google-chrome-stable_current_amd64.deb


fi
