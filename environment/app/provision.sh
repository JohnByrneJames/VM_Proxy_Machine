#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# unlinking default connection file
sudo unlink /etc/nginx/sites-enabled/default

# moving into relevant folder
cd /etc/nginx/sites-available

# deleting default file
sudo rm -rf default

# creating new file for connection
sudo touch reverse-proxy.conf

# changing permission for file
sudo chmod 666 reverse-proxy.conf

# inserting server information into the connection file
echo "server{
  listen 80;
  location / {
      proxy_pass http://192.168.10.100:3000;
  }
}" >> reverse-proxy.conf

# recreating connection to database with new file(default without explicit statement)
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# test if nginx file was succesfully edited
sudo nginx -t

# restart nginx
sudo service nginx restart

# check status of nginx
sudo service nginx status

# install git
sudo apt-get install git -y

# install nodejs {Getting relevant dependencies including Python)
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install npm (Avoid error of later pm2 install)
sudo apt-get install npm -y

# install pm2
sudo npm install pm2 -g

# app set up
export DB_HOST="mongodb://192.168.10.111:27017/posts"  # ~ Add database connection into an environmental variable
cd /home/vagrant/app  # ~ Navigate to directory where app is
sudo su  # ~ Puts the user into root user (admin permissions)
npm install  # ~ This gets any relevant and missing dependencies need to launch the node app
node app.js  # ~ Finally launch the app