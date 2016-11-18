#!/bin/bash
##
#  Clear out our temp plog file for debugging
##
touch /shared/logs/ns.log;
echo '' > /shared/logs/ns.log;

##
#    Install bind functions
##
sudo yum -y install bind bind-utils;

##
#  copy over the named conf files, this lets the box know what the safe ip are in the private network
#  you might need to update this if you are adding ip/boxes or changing them.
##
sudo cp /shared/templates/named.conf /etc/named.conf;

##
#  This declairs your zone file and the location of your reverse look up file
##
sudo cp /shared/templates/named.conf.local /etc/named/named.conf.local;

##
#  Updat the perm of the file and then create the zones dir
##
sudo chmod 755 /etc/named;
sudo mkdir -p /etc/named/zones;

##
#  Copy over our zone file. If you need to add ip and boxes then you will need to add them here.
##
sudo cp /shared/templates/db.local.puppet.dev /etc/named/zones/db.local.puppet.dev

##
#  Copy over our reverse look up zone file. If you need to add ip and boxes then you will need to add them here.
##
sudo cp /shared/templates/db.192.168 /etc/named/zones/db.192.168;

##
#  We check to make sure everything parses correctly, if it fails then we throw the content into the log file.
##
sudo named-checkconf >> /shared/logs/ns.log;
sudo named-checkzone local.puppet.dev /etc/named/zones/db.local.puppet.dev >> /shared/logs/ns.log;
sudo named-checkzone 192.168.in-addr.arpa /etc/named/zones/db.192.168 >> /shared/logs/ns.log;
sudo systemctl status named.service >> /shared/logs/ns.log;

##
#  Start the service and add it to the enabled list so it starts on power up
##
sudo systemctl start named >> /shared/logs/ns.log;
sudo systemctl enable named;
