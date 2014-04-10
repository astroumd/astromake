#
# as long as karma is in /usr/local/karma, only their .login needs to be sourced
# note: their .cshrc file uses KARMAROOT
#
setenv KARMABASE $ASTROMAKE/opt/karma/
source $KARMABASE/.login
if ($?LD_LIBRARY_PATH) then
  setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$KARMABASE/lib
else
 setenv LD_LIBRARY_PATH $KARMABASE/lib
endif

