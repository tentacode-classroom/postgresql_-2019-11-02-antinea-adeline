#!/bin/bash


sudo -u postgres psql -f ../sql/event_database/create_event_database.sql
sudo -u postgres psql -f ../sql/event_database/insert_event_database.sql