#!/bin/bash
clear

# Converts all databases to utf8mb4_unicode_ci;

# provide MySQL credentials
dbuser=
dbpass=


M1=' -u '
M2=' --password='

MYSQL_LOGIN+=$M1
MYSQL_LOGIN+=$dbuser
MYSQL_LOGIN+=$M2
MYSQL_LOGIN+=$dbpass

for db in $(echo "SHOW DATABASES;" | mysql $MYSQL_LOGIN | grep -v -e "Database" -e "information_schema" )
do
	echo "USE $db; ALTER DATABASE $db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" | mysql $MYSQL_LOGIN  >/dev/null
        TABLES=$(echo "USE $db; SHOW TABLES;" | mysql $MYSQL_LOGIN |  grep -v Tables_in_ | grep -v -e "Tables_in_"   )
        echo "Switching to database $db"
        for table in $TABLES
        do
                echo -n " * CONVERTING  ing table $table ... "
		echo "USE $db; ALTER TABLE $table CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; COMMIT;"| mysql $MYSQL_LOGIN  >/dev/null
                echo "done."
        done
done
