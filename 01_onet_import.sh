#!/bin/bash 

# Import script occupational survey data from O*Net
# source: US Bureau of Labor Statistics
# Download from 
# https://www.onetcenter.org/database.html#all-files
# store data in MySQL database "onet"
# version 1 - 2015-01
# version 2 - 2018-09
# version 3 - 2019-01
# version 3.1 - 2019-08

echo "Download from https://www.onetcenter.org/database.html#all-files"

# settings 

# current onet release 
onet_url="https://www.onetcenter.org/dl_files/database/db_24_0_mysql.zip" 


# store 
mkdir -p ~/Downloads/onet
cd ~/Downloads/onet && rm -rf db*
curl -O $onet_url && tar xzf db*mysql.zip --strip 1 && rm -rf *.zip

# empty/re-create database
mysql -e "DROP DATABASE IF EXISTS onet" && echo "Database onet removed" 
mysql -e "CREATE DATABASE IF NOT EXISTS onet" && echo "Database onet recreated" 

cat ~/Downloads/onet/[0-9][0-9]*.sql > ~/Downloads/onet/onet_db_all.sql && echo "All sql-files merged into onet_db_all"
mysql -Donet < ~/Downloads/onet/onet_db_all.sql && echo "onet data imported"

rm onet_db_all.sql && echo "file onet_db_all removed"
