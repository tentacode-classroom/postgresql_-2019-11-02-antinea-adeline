#!/bin/bash

# Test if resources/archive.json exist
FILE=../resources/2018-11-02-2.json
if [ -f "$FILE" ]; then
    echo "$FILE already exist, update of the file "
    rm $FILE
fi


# Download zip data archive of 2nd november 2019 
wget --no-check-certificate https://data.gharchive.org/2018-11-02-2.json.gz -O $FILE.gz


# Unzip zip file

gunzip $FILE.gz