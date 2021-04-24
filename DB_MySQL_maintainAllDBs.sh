#!/bin/bash
# ANALYZE all Tables in all databases. As long you have the right to do so :-)
# uses O_WRITE_TO_BINLOG to speed up the process. Take care if this fits your 
# server activities.

dbcommand=ANALYZE

MYSQL_LOGIN='-u USER --password=PASSWORD'

for db in $(echo "SHOW DATABASES;" | mysql $MYSQL_LOGIN | grep -v -e "Database" -e "information_schema")
do
        TABLES=$(echo "USE $db; SHOW TABLES;" | mysql $MYSQL_LOGIN |  grep -v Tables_in_)
        echo "Switching to database $db"
        for table in $TABLES
        do
                echo -n " * $dbcommand ing table $table ... "
                echo "USE $db; $dbcommand NO_WRITE_TO_BINLOG TABLE $table" | mysql $MYSQL_LOGIN  >/dev/null
                echo "done."
        done
done
