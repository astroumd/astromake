#  ---> usually "current" is a symlink to the actual (dated) ``YMD'' version
#  OLD non-versionable
#source $ASTROMAKE/opt//miriad/cshrc.MIRIAD

#  set root directory

if ($#a_version == 0) then
  # take the first entry from the list
  setenv MIR $ASTROMAKE/opt/miriad/`head -1 $ASTROMAKE/opt/miriad/VERSIONS`
else
  setenv MIR $ASTROMAKE/opt/miriad/$a_version[1]
endif

#  add environment  (linux only for now)
if (-e $MIR/MIRRC.linux) then
  #	dereference any symlinks
  setenv MIR `ls -l $MIR | awk '{print $NF}'`
  source $MIR/MIRRC.linux
endif
