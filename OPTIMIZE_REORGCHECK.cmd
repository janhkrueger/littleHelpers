REM Do the full db maintenance stuff to a database


db2 connect to [DBNAME] user [USERNAME] using [PASS]

db2 -x "select 'reorg table',substr(rtrim(tabschema)||'.'||rtrim(tabname),1,50),';' from syscat.tables where type = 'T' and tbspace='USERSPACE1'" > reorg.out 
db2 -tvf  reorg.out

db2 -x "select 'reorgchk update statistics on table',substr(rtrim(tabschema)||'.'||rtrim(tabname),1,50),';' from syscat.tables where type = 'T' and tbspace='USERSPACE1'" > reorgchk.out
db2 -tvf reorgchk.out

db2 -x "select 'runstats on table',substr(rtrim(tabschema)||'.'||rtrim(tabname),1,50),' and indexes all;'from syscat.tables where type = 'T' and tbspace='USERSPACE1'" > runstats.out
db2 -tvf runstats_.out

db2 connect reset