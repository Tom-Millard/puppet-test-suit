#!/bin/bash
echo '' > /shared/logs/ns.log;
sudo yum -y install bind bind-utils;
sudo cp /shared/templates/named.conf /etc/named.conf;
sudo cp /shared/templates/named.conf.local /etc/named/named.conf.local;
sudo chmod 755 /etc/named;
sudo mkdir -p /etc/named/zones;
sudo cp /shared/templates/ns.puppet.dev /etc/named/zones/ns.puppet.dev
sudo cp /shared/templates/db.168.192 /etc/named/zones/db.168.192;
sudo named-checkconf >> /shared/logs/ns.log;
sudo named-checkzone ns.puppet.dev /etc/named/zones/ns.puppet.dev >> /shared/logs/ns.log;
sudo named-checkzone 168.192.in-addr.arpa /etc/named/zones/db.168.192 >> /shared/logs/ns.log;
sudo systemctl start named >> /shared/logs/ns.log;
sudo systemctl enable named;
