#!/bin/bash
:'
  Install puppet agent
'
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm;
sudo yum -y install puppet;

:'
  Start the puppet agent
'
sudo -i /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true;
