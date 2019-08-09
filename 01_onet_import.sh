#!/bin/bash 

# Import script occupational survey data from O*Net
# source: US Bureau of Labor Statistics
# Download from 
# https://www.onetcenter.org/database.html#all-files
# store data in MySQL database "onet"
# version 0.1 - 2015-01
# version 0.2 - 2018-09
# version 0.3 - 2019-01
# version 0.4 - 2019-08

echo "Download from https://www.onetcenter.org/database.html#all-files"

# Settings. These must be set before import

# location of zipped database files of current onet release 
onet_url="https://www.onetcenter.org/dl_files/database/db_24_0_mysql.zip" 
# my working directory. Also location of these Git-files
# change or comment out if you use somewhere else!
cd /srv/onet_labour_market_stat

echo "importing from " $onet_url 
echo into `pwd`
echo "downloading data to dir onet_database_download"

# store downloaded file in a dir not versioned by git (exempt in .gitignore)
rm -rf onet_database_download
mkdir -p onet_database_download
cd onet_database_download
# download mysql data, extract without directory structure 
curl -O $onet_url && tar xzf *mysql.zip --strip 1
rm *.zip

# empty/re-create database
mysql -e "DROP DATABASE IF EXISTS onet" && echo "Database onet removed " 
mysql -e "CREATE DATABASE IF NOT EXISTS onet" && echo "Database onet (re-)created " 

# only import sql-files starting with two digits and underscore. 
# merge these into one file, onet_db_all.sql 
cat [0-9][0-9]_*.sql > onet_db_all.sql && echo "All sql-files merged into file onet_db_all "

mysql -Donet < onet_db_all.sql && echo "onet data imported to mysql"

# download tables for storing Norwegian translations of content 
# curl -O "https://raw.githubusercontent.com/haraldgroven/onet_labour_market_stat/master/03_translation_storage.sql"
mysql -Donet < ../03_translation_storage.sql && echo "created tables from 03_translation_storage.sql to store translations of content "

# clean up mess
# rm onet_db_all.sql 

