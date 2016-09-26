#!/bin/bash  
#
###
#
# Cleans the filenames and removes often occurances of name patterns from 
# german news portals Golem.de and Spiegel Online
#
# 2013 by Jan H. Krueger
#
# Feel free to adapt :-)
#
###

###
#
# Reqirements:
# detox
# rename (Perl)
#
###

clear screen


detox *.$1

rename 's/Druckversion-//' *.$1

#Golem behandlung
rename 's/Golem.de-//' *.$1

rename 's/-SPIEGEL_ONLINE//' *.$1

# Die Welt
rename 's/-Nachrichten_Politik-Ausland-DIE_WELT//' *.$1

# Ars Technica
rename 's/_Ars_Technica//' *.$1

# Zeit Online
rename 's/_ZEIT_ONLINE//' *.$1
