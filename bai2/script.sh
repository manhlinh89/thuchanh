#!/bin/bash
sudo su
yum update -y
#amazon-linux-extras install nginx1 -y

# Install Golang lastet
yum install -y golang

cd /home/ec2-user && chmod +x uploads3
./uploads3 && echo "Thanh cong!" && exit
