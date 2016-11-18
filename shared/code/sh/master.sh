#!/bin/bash
##
# Get and install puppet server
##
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
sudo yum -y install puppetserver;

##
# Config puppet server to run off 512mb of ram, our box should be double this size
##
sudo sed -i 's/-Xms2g -Xmx2g/-Xms512m -Xmx512m/g' /etc/sysconfig/puppetserver;

##
#  Start puppetserver and make sure it starts when the system starts
##
sudo systemctl start puppetserver;
sudo systemctl enable puppetserver;
