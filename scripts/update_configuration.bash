#!/bin/bash

sudo -u postgres psql -f ../sql/update_configuration.sql

#Restart service postgres
sudo service postgresql restart



