#
set dir=$ASTROMAKE/opt/aips++

# a_version is an astromake variable
# a_root    is the AIPS++ variable you need to override if AIPS++ relocated

unset a_root

if ($#a_version > 0) then

  set a_root=$dir/$a_version

else if (-e $dir/aipsinit.csh) then

  set a_root=$dir/aipsinit.csh

else if (-e $dir/VERSIONS) then

  set version=`head -1 $ASTROMAKE/opt/aips++/VERSIONS`
  set a_root=$dir/$version

else if (-e $dir/`cat $ASTROMAKE/status/aips++`) then

  set a_root=$dir/`cat $ASTROMAKE/status/aips++`

else if (-e $dir/current/aipsinit.csh) then

  set a_root=$dir/current/aipsinit.csh


endif

if ($?a_root) then
  source $a_root/aipsinit.csh
  # private AIPS++ settings
  if (-e ~/.aips++_env) source ~/.aips++_env
endif

unset dir
unset a_root
