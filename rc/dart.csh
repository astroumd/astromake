#! /bin/csh -f 
#
# this file does nothing, merely warns
#
# alias dart $ASTROMAKE/opt/dart/current/bin/dart

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

