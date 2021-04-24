#!/bin/bash

# Converts all Databases to compressed row format with a bock size 8

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
        TABLES=$(echo "USE $db; SHOW TABLES;" | mysql $MYSQL_LOGIN |  grep -v Tables_in_ | grep -v -e "Tables_in_"  )
        echo "Switching to database $db"
        for table in $TABLES
        do
                echo -n " * ALTER TABLE $table ENGINE=InnoDB ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;  ing table $table ... "
                echo "USE $db; ALTER TABLE $table ENGINE=InnoDB ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;" | mysql $MYSQL_LOGIN  >/dev/null

                echo -n " * OPTIMIZING  ing table $table ... "
                echo "USE $db; OPTIMIZE TABLE $table;" | mysql $MYSQL_LOGIN  >/dev/null
                echo "done."
        done
done
