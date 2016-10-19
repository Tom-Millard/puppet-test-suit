#!/bin/bash
sudo yum -y install bind bind-utils;
sudo cp /shared/templates/resolv.conf /etc/resolv.conf ;
