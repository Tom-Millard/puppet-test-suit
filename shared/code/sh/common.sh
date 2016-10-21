#!/bin/bash
sudo yum -y install bind bind-utils;
sudo cp /shared/templates/resolv.conf /etc/resolv.conf;
sudo timedatectl set-timezone Europe/Dublin;
sudo yum -y install ntp;
sudo ntpdate pool.ntp.org;
sudo cp /shared/templates/ntp.conf /etc/ntp.conf;
sudo systemctl restart ntpd;
sudo systemctl enable ntpd;
