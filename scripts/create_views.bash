#!/bin/bash

#Get current script path
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

psql --username=super_admin -f  $SCRIPT_DIR/../sql/create_views.sql