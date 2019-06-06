#!/bin/bash

sudo -u postgres psql -f ../sql/postgres_conf.sql

sudo -u postgres psql -c 'ALTER SYSTEM RESET all'

#Restart service postgres
sudo service postgresql restart



