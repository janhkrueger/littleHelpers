#!/bin/sh

# Changing the committer & authors to a desired one
# Original from https://help.github.com/articles/changing-author-info/
# 
# Usage:
# git clone --bare https://github.com/user/repo.git
# cd repo.git
# ./change.sh
# [Change the variables CORRECT_NAME && CORRECT_EMAIL
# git push --force --tags origin 'refs/heads/*'
# cd ..
# rm -rf repo.git
#
# WARNING: can result in many commits!

git filter-branch --env-filter '

CORRECT_NAME=""
CORRECT_EMAIL=""

export GIT_COMMITTER_NAME="$CORRECT_NAME"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
export GIT_AUTHOR_NAME="$CORRECT_NAME"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
' --tag-name-filter cat -- --branches --tags
