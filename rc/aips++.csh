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
  # if (-e ~/.aips++_env) source ~/.aips++_env
  set _a=($AIPSPATH)
  setenv AIPSDATA $_a[1]/data
  setenv AIPSCODE $_a[1]/code
  setenv AIPSBIN  $_a[1]/$_a[2]/bin
  setenv AIPSLIB  $_a[1]/$_a[2]/lib
  setenv AIPSARCH $_a[1]/$_a[2]
  setenv AIPSROOT $_a[1]
  setenv AIPSEXEC $_a[1]/$_a[2]/libexec
  setenv AIPSSITE $_a[1]/$_a[2]/$_a[3]
  setenv AIPSHOST $_a[1]/$_a[2]/$_a[3]/$_a[4]
  unset _a
endif

unset dir
unset a_root
