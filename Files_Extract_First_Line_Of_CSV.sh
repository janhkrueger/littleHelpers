#!/bin/sh
#
# Exports the first line of a csv file into a new file
# JHK, 14.10.2016
#
cat $1 | cut -d, -f1 > $1.txt
