#!/bin/bash

# Import script occupational survey data from O*Net
# source: US Bureau of Labor Statistics
# Download from
# https://www.onetcenter.org/database.html#all-files
# store data in MySQL database "onet"


echo "Download from https://www.onetcenter.org/database.html#all-files"

# Settings. These must be set before import

# location of zipped database files of current onet release
onet_url="https://www.onetcenter.org/dl_files/database/db_27_3_mysql.zip"
# my working directory. Also location of these Git-files
# change or comment out if you use somewhere else!
# cd srv/onet_labour_market_stat

echo "importing from " $onet_url
echo "into " pwd
echo "downloading data to dir onet_database_download"

# store downloaded file in a dir not versioned by git (exempt in .gitignore)
rm -rf onet_database_download
mkdir -p onet_database_download
cd onet_database_download && echo "wd onet_database_download"
# download mysql data, extract without directory structure
curl -O $onet_url && tar xzf *mysql.zip --strip 1 && echo "curl download zip with database"
rm *.zip

# empty/re-create database
mysql -e "DROP DATABASE IF EXISTS onet" && echo "Database onet removed "
mysql -e "CREATE DATABASE IF NOT EXISTS onet" && echo "Database onet (re-)created "

# create tables 

pwd

mysql -Donet < ../00_setup_tables.sql && echo "tables created "

# only import sql-files starting with two digits and underscore.
# merge these into one file, onet_db_all.sql
cat [0-9][0-9]_*.sql > onet_db_all.sql && echo "All sql-files merged into file onet_db_all "

echo "import data from onet_db_all.sql"
mysql -Donet < onet_db_all.sql && echo "finished importing downloaded data from O*Net "

# move to wd onet_labour_market_stat/
cd ..

# c
mysql -Donet < 02_create_databaseviews.sql && echo "created database views "

# download tables for storing Norwegian translations of content
# curl -O "https://raw.githubusercontent.com/haraldgroven/onet_labour_market_stat/master/03_translation_storage.sql"

mysql -D onet < 03_translation_storage.sql && echo "finished creating tables from 03_translation_storage.sql "

# clean up mess
# rm onet_db_all.sql

# import translations

# copy to directory readable by database
# Solves various LOCAL INFILE problems
rsync -avz translations/ /tmp/translations/


mysql -Donet -e "TRUNCATE content_model_reference_nb"
mysql -Donet -e "LOAD DATA INFILE '/tmp/translations/content_model_reference_nb.tsv' REPLACE INTO TABLE content_model_reference_nb FIELDS TERMINATED BY '\t' ENCLOSED BY '\"' IGNORE 1 LINES"
mysql -Donet -e "SELECT 'ant. oversettinger fra content_model_reference_nb ' AS kilde, COUNT(*) FROM content_model_reference_nb"
echo "import of content_model_reference_nb"

mysql -Donet -e "TRUNCATE dwa_reference_nb"
mysql -Donet -e "LOAD DATA INFILE '/tmp/translations/dwa_reference_nb.tsv' REPLACE INTO TABLE dwa_reference_nb FIELDS TERMINATED BY '\t' ENCLOSED BY '\"' IGNORE 1 LINES"
mysql -Donet -e "SELECT 'ant. oversettinger fra dwa_reference_nb ' AS kilde, COUNT(*) FROM dwa_reference_nb"
echo "import of dwa_reference_nb"

mysql -Donet -e "TRUNCATE iwa_reference_nb"
mysql -Donet -e "LOAD DATA INFILE '/tmp/translations/iwa_reference_nb.tsv' REPLACE INTO TABLE iwa_reference_nb FIELDS TERMINATED BY '\t' ENCLOSED BY '\"' IGNORE 1 LINES"
mysql -Donet -e "SELECT 'ant. oversettinger fra iwa_reference_nb ' AS kilde, COUNT(*) FROM iwa_reference_nb"
echo "import of iwa_reference_nb"

mysql -Donet -e "TRUNCATE occupation_data_nb"
mysql -Donet -e "LOAD DATA INFILE '/tmp/translations/occupation_data_nb.tsv' REPLACE INTO TABLE occupation_data_nb FIELDS TERMINATED BY '\t' ENCLOSED BY '\"' IGNORE 1 LINES"
mysql -Donet -e "SELECT 'ant. oversettinger fra occupation_data_nb ' AS kilde, COUNT(*) FROM occupation_data_nb"
echo "import of occupation_data_nb"

mysql -Donet -e "TRUNCATE onet_uno_category_nb"
mysql -Donet -e "LOAD DATA INFILE '/tmp/translations/onet_uno_category_nb.tsv' REPLACE INTO TABLE onet_uno_category_nb FIELDS TERMINATED BY '\t' ENCLOSED BY '\"' IGNORE 1 LINES"
mysql -Donet -e "SELECT 'ant. oversettinger fra occupation_data_nb ' AS kilde, COUNT(*) FROM onet_uno_category_nb"
echo "import of occupation_data_nb"


pwd

# compare translated strings to new import
mysql -Donet < 04_translation_maintenance.sql && echo "number of entities which may need translation "

# set new wd
cd ..

 

echo " "
echo "finished import"
