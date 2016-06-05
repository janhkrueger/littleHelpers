#!/bin/bash

# Deletes messages in a maildir folder after a given number of days


# Delete without exception
function deleteFully  {
cleanup-maildir.py --quiet --age=$1 --maildir-root=/var/qmail/mailnames/[MAILDOMAIN]/[MAILACCOUNT]/Maildir/ delete $2
}  

# Preserves threads with marked mails
function deletePreserve {
cleanup-maildir.py --quiet --age=$1 --keep-flagged-threads --maildir-root=/var/qmail/mailnames/[MAILDOMAIN]/[MAILACCOUNT]/Maildir/ delete $2
}  


# sample usage
deletePreserve 15 'FOLDERINMAILACCOUNT'
deletePreserve 15 'Newsletter'
deletePreserve 2 'Server'

deleteFully 30 'Sent'