#  ---> usually "current" is a symlink to the actual (dated) ``YMD'' version
#  OLD non-versionable
#source $ASTROMAKE/opt//miriad/cshrc.MIRIAD

#  set root directory

set dir=$ASTROMAKE/opt/miriad

if ($#a_version == 0) then
  if (-e $dir/VERSIONS) then
    # take the first entry from the list
    setenv MIR $dir/`head -1 $dir/VERSIONS`
  else
    # must be just one version, so find out from the status file
    if (-e $ASTROMAKE/status/miriad) then
      setenv MIR $dir/`cat $ASTROMAKE/status/miriad`
    endif     
  endif
else
  setenv MIR $dir/$a_version[1]
endif
unsetenv MIRHELLO

#  add environment  (linux only for now)
if (-e $MIR/MIRRC.linux) then
  #	dereference any symlinks
  # setenv MIR `ls -l $MIR | awk '{print $NF}'`
  source $MIR/MIRRC.linux
endif


# cheat, temp solution for wip:
setenv WIPHELP $MIR/borrow/wip/wiphelp.dat
