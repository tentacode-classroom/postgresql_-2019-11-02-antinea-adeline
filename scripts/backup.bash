#!/bin/bash

BACKUP_DIR=../backup

#Create /backup directory if not exist
mkdir -p $BACKUP_DIR

#Saving of github_events database
pg_dump --username=super_admin github_events -f $BACKUP_DIR/backup_github_events.sql

if [ "$?" -ne 0 ]; then
    echo 'Github_events backup failed'
    exit 1;
    else
    echo 'github_events database backup finished'
fi

#Saving of all roles

pg_dumpall --roles-only --username=super_admin -f $BACKUP_DIR/roles.sql

if [ "$?" -ne 0 ]; then
    echo 'Roles backup failed' 
    exit 1; 
    else 
    echo 'Roles backup finished' 
fi
