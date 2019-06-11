#!/bin/bash


psql --username=super_admin -f ../sql/event_database/create_event_database.sql
psql --username=super_admin -f ../sql/event_database/insert_event_database.sql