#
set dir=$ASTROMAKE/opt/aips++

# a_version is an astromake variable
# a_root    is the AIPS++ variable you need to override if AIPS++ relocated

if ($#a_version > 0) then

  source $dir/$a_version/aipsinit.csh

else if (-e $dir/aipsinit.csh) then

  source $dir/aipsinit.csh

else if (-e $dir/VERSIONS) then

  set version=`head -1 $ASTROMAKE/opt/aips++/VERSIONS`
  source $dir/$version/aipsinit.csh

else if (-e $dir/current/aipsinit.csh) then

  source $dir/current/aipsinit.csh

endif

# private AIPS++ settings
if (-e ~/.aips++_env) source ~/.aips++_env

unset dir
