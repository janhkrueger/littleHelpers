REM
REM Generates a nice name for a logfile for windows cmds
REM

@echo off
SET JOBNAME=USEFULLJOBNAME

set LOGFILE_DATE=%date:~-4%%date:~-7,2%%date:~-0,2%
set LOGFILE_TIME=%time:~-0,2%%time:~-8,2%%time:~-5,2%%time:~-2,2%

if "%LOGFILE_TIME:~-0,1%" EQU "1" goto Zeitende
if "%LOGFILE_TIME:~-0,1%" EQU "2" goto Zeitende

:zeitkorrektur
set LOGFILE_TIME=0%LOGFILE_TIME:~1,8%

:zeitende
set LOGFILE=%JOBNAME%-%LOGFILE_DATE%-%LOGFILE_TIME%.log

echo %LOGFILE%