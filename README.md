# postgresql_-2019-11-02-antinea-adeline

## Before Starting

:white_check_mark: Check you changed you're pg_hba.conf.

:white_check_mark: Make sure all command you type are in sudo.

:warning: Make sure postgresql service is started overwise it will not work.
    
Run:
`sudo service postgresql start`

## Installation

 To install postgresql version 11.3.0, you just have to run the script named **setup_postgresql.bash** situated in **scripts** folder below. 

 `./setup_postgresql.bash`

 It will : 

 1. Update and Upgrade package lists
 2. Add postgresql repository in sources
 3. Import the repository signing key
 4. Update the package lists again
 5. Proceed to installation of postgresql
 6. Check and Display postgresql version
 7. Start postgresql service

 ## Import Github Data

 The aim of this script is to download data archive of the second of november 2019 as a zip file. Then it will create a folder name resources which will contain the zip file and finally it will unzip the data archive in resources folder.

 You will find below the command to run the script:
 `./import_github.bash`

 ## Create event database 

 This script creates create_event, push_event and issue_comment_events tables that inherit from the event table after creating `github_events` database.
 Theses tables contains have been created to contain datas from the json archive we download just before.

 You will find below the command to run the script:
 `./create_event_database.bash`

 ## Create users
 :warning: Check your pg_hba.conf is updated, overwise this script will throw errors.
 
 First a super admin role will be created which login is `super_admin` and password `12345`.
 Then, it will put the configuration of the role we just created and put it into the file **.pgpass** . After, a user `github_events` will be created by `super_admin` user, owner of `github_events` database. Then **.pgpass** file is updated.

 Finally, it copy .pgpass and .pg_hba.conf files into directory name `etc` at the root of the project.

 You will find below the command to run the script:
 `./create_users.bash`

## Update Configuration script
This script run several sql request that changes system configuration.

It changes:
 1. The port to **1234**
 2. Work memory to **100MB** 
 3. Listen addresses to *

You will find below the command to run the script:
`./update_configuration.bash`








