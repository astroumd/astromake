#! /bin/csh -f

set dir=$ASTROMAKE/opt/time

if ($#a_version) then
  set so=$dir/$a_version[1]/libtimefake.so
  if (-e $so) then
    setenv LD_PRELOAD $so
  else
    echo Cannot find $so
  endif
else
  echo No default for this module supported, check one of:
  (cd $ASTROMAKE/opt/time ; ls)
endif
