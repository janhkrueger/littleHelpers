#!/bin/bash
# Renames all files in the current directory
# and strips the first X characters.
                                                                                                                                                                               
# Example here: Renames all txt files and deletes
# the first 7 characters.
                                                                                                                                                                               
# JHK, 01.09.2016
                                                                                                                                                                               
for file in *txt
  do mv "$file" "${file:7}";
done
