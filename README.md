# postgresql_-2019-11-02-antinea-adeline

## Before Starting
:white_check_mark: Make sure all command you type are in sudo.
:warning: Make sure postgresql service is started overwise it will not work.
    
Run:
`sudo service postgresql start`

## Installation

 To install postgresql version 11.3.0, just execute the script named **setup_postgresql.bash** situated in **scripts** folder below. 

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

 You will find below the command to execute the script:
 `./import_github.bash`






