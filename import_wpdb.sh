#!/bin/bash
unzip database.sql.zip
clear
echo "Database Name: " 
read DBName
clear
echo "Local website URL:" 
read WebsiteName
clear
mysql -u root -ppassword -e "DROP DATABASE IF EXISTS $DBName";
mysql -u root -ppassword -e "CREATE DATABASE $DBName";

mysql -u root -ppassword $DBName < database.sql;

mysql -u root -ppassword --database=$DBName -e "UPDATE wp_options set option_value = 'http://$WebsiteName' where option_name = 'siteurl'";
mysql -u root -ppassword --database=$DBName -e "UPDATE wp_options set option_value = 'http://$WebsiteName' where option_name = 'home'";

echo "Database imported correctly"

rm database.*