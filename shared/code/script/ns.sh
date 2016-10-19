#!/bin/bash
sudo yum -y install bind bind-utils;
sudo cp /shared/templates/named.conf /etc/named.conf;
sudo cp /shared/templates/named.conf.local /etc/named/named.conf.local;
sudo chmod 755 /etc/named;
sudo mkdir /etc/named/zones;
sudo cp /shared/templates/ns.puppet.dev /etc/named/zones/ns.puppet.dev
sudo cp /shared/templates/db.168.192 /etc/named/zones/db.168.192;
