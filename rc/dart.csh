#! /bin/csh -f 
#
# this file does nothing, merely warns
#
# alias dart $ASTROMAKE/opt/dart/current/bin/dart

echo You should actually never astroload dart
echo but make sure your browser has a reference to it.
echo "edit->preferences->Navigotor->Helper Applications"
echo "     MIME Type: application/x-multiget"
echo "     Description: bima data archive retrieval"
echo "     Open it with:   /astromake/opt/dart/current/bin/dart"
echo "Should do it. These are the examples for mozilla"

exit 0

#--- anything below this probably should be someplace in your FIXED path

#!/bin/csh -f
# this application is normally started by netscape, don't execute
# this manually if you don't know what you are doing
# make sure you have in your netscape application preferences:
#	application/x-multiget    /usr/local/bin/dart %s
#
#  pjt - 30-aug-00
set log=/tmp/dart$USER.log

unsetenv CLASSPATH 

#    'current' is usually a symlink to the current version

exec $ASTROMAKE/opt/dart/current/bin/dart $* >> $log
#
exit 0

