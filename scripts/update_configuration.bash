#!/bin/bash

sudo -u postgres psql -f ../sql/postgres_conf.sql



#Restart service postgres
sudo service postgresql restart

