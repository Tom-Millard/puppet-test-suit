#!/bin/bash
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
sudo yum -y install puppet;
sudo -i /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true;
sudo -i puppet agent --server node-master.local.puppet.dev;
sudo -i puppet config set runinterval 5m --section main;
