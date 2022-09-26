#! /bin/bash

#update server
echo "1/5 updating server..."
apt update & apt upgrade -y
echo "done!"

#install, enable and check apache status
echo "2/5 installing apache2 http server..."
apt install apache2 -q -y
echo "apache daemon should be active"
rm /var/www/html/index.html
echo 
#install unzip 
echo "3/5 installing unzip..."
apt install unzip -q -y

#download code from remote repository to tmp folder
echo "4/5 downloading code from remote repository"
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp

#unzip file and move to apache2 default folder
echo "5/5 unziping file and copying to the apache folder"
cd /tmp
unzip main.zip
cp -r /tmp/linux-site-dio-main/* /var/www/html/

