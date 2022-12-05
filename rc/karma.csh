#
# as long as karma is in /usr/local/karma, only their .login needs to be sourced
# note: their .cshrc file uses KARMAROOT
#
#  KARMA needs 32bit libraries
#
set lib32 = $ASTROMAKE/opt/i386-linux-gnu

setenv KARMABASE $ASTROMAKE/opt/karma/karma-1.7.25
source $KARMABASE/.login
if ($?LD_LIBRARY_PATH) then
  setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$KARMABASE/lib:$lib32
else
 setenv LD_LIBRARY_PATH $KARMABASE/lib:$lib32
endif

