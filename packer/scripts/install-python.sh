#!/bin/bash

sudo yum update -y
sudo yum install -y python3
sudo amazon-linux-extras install -y python3.8
sudo alternatives --set python /usr/bin/python3.8
sudo yum install -y python3-pip
sudo pip3 install flask
sudo yum clean all
sudo rm -rf /var/cache/yum
