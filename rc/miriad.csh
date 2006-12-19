#  ---> usually "current" is a symlink to the actual (dated) ``YMD'' version
#  OLD non-versionable
#source $ASTROMAKE/opt//miriad/cshrc.MIRIAD

#  set root directory

set dir=$ASTROMAKE/opt/miriad

if ($#a_version == 0) then
  if (-e $dir/VERSIONS) then
    # take the first entry from the list
    set mir=$dir/`head -1 $dir/VERSIONS`
  else
    # must be just one version, so find out from the status file
    if (-e $ASTROMAKE/status/miriad) then
      set mir=$dir/`cat $ASTROMAKE/status/miriad`
    endif     
  endif
else
  set mir=$dir/$a_version[1]
endif

if (-e $mir/MIRRC.linux) then
  setenv MIR $mir
  unsetenv MIRHELLO

  #  add environment  (linux only for now)
  if (-e $MIR/MIRRC.linux) then
    #	dereference any symlinks
    # setenv MIR `ls -l $MIR | awk '{print $NF}'`
    source $MIR/MIRRC.linux
  endif


  # cheat, temp solution for wip:
  setenv WIPHELP $MIR/borrow/wip/wiphelp.dat


  # LD_LIBRARY_PATH

  if ($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$MIRLIB
  else
    setenv LD_LIBRARY_PATH $MIRLIB
  endif

else if (-e $mir/miriad_start.csh) then

  source $mir/miriad_start.csh

else
  echo "$mir does not contain a recognized miriad tree"
  exit 1
endif


