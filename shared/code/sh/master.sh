#!/bin/bash
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
sudo yum -y install puppetserver;
sudo sed -i 's/-Xms2g -Xmx2g/-Xms512m -Xmx512m/g' /etc/sysconfig/puppetserver;
sudo systemctl start puppetserver;
sudo systemctl enable puppetserver;
