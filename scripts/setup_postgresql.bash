#!/bin/bash
# This script will install postgresql proprely


#Update 
sudo apt update && sudo apt upgrade

#Add postgresql repo in sources

echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list


# Then we can import the repository signing key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add

#Update the package lists
sudo apt-get update

#Proceed to installation of postgresql
sudo apt install postgresql-11 -y

# Start the service

echo "Starting postgresql service : "

sudo service postgresql start

service postgresql status