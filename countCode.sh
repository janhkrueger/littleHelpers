#!/bin/bash

# Counts the codes lines in the given filetypes
# just start in the root directory where to start.
#
# Really don't know why I have written this.

find . -name '*.cpp' -o -name '*.php' -o -name '*.h' -o -name '*.py' -o -name '*.pl' | xargs wc -l
