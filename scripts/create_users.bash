#!/bin/bash

#Get current script path
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Get current user
USER="$USER"

USER_DIR=/home/$USER

#Create Super admin role
sudo -u postgres psql -f ../sql/create_super_admin.sql

#Edit pg_hba.conf
#sudo nano /etc/postgresql/main/11/pg_hba.conf


#Go to current user directory
cd $USER_DIR

#Create .pgpass file
touch .pgpass

truncate -s 0 .pgpass

chmod 0600 .pgpass

#Insert data in .pgpass file
echo '*:*:*:super_admin:12345' >>.pgpass
psql --username super_admin -c "SELECT 'Je suis connecté en super admin.';"


#Get current dir path
CURRENT_DIR=`pwd`

#Go to current script directory
cd $SCRIPT_DIR

#Create /etc directory if not exist
mkdir -p ../etc

#Copy .pgpass and .pg_hba.conf in /etc/.pgpass
cp $CURRENT_DIR/.pgpass ../etc
sudo cp /etc/postgresql/11/main/pg_hba.conf ../etc


# create user with super_admin

psql --username super_admin -f ../sql/create_user.sql

#Go to current user directory
cd $USER_DIR

#Insert data in .pgpass file
 echo '*:*:*:github_events:12345' >>.pgpass
 psql --username github_events -c "SELECT 'Je suis connecté sur github.';"

#Copy .pgpass and .pg_hba.conf in /etc/.pgpass
cd $SCRIPT_DIR
cp $CURRENT_DIR/.pgpass ../etc