#!/bin/bash

##
#   Install bind functions
##
sudo yum -y install bind bind-utils;

##
#    Set time zone to Europe, this is so puppet stays uptodate with all its nodes
##
sudo timedatectl set-timezone Europe/Dublin;

##
#   Install ntp
#
sudo yum -y install ntp;

##
#  Set ntpdata url so we can look up time zones
##
sudo ntpdate pool.ntp.org;

##
#  Copy over the ntp nameservers so we know where to look
##
sudo cp /shared/templates/ntp.conf /etc/ntp.conf;

##
#  Restart ntpd and enable it on start-up
##
sudo systemctl restart ntpd;
sudo systemctl enable ntpd;

##
#  Copy over resolv
##
sudo cp /shared/templates/resolv.conf /etc/resolv.conf;
