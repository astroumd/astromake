#  ---> usually "current" is a symlink to the actual (dated) ``YMD'' version
#  OLD non-versionable
#source $ASTROMAKE/opt//miriad/cshrc.MIRIAD

# echo MIR:  $#argv  1=$1  

  setenv MIR $ASTROMAKE/opt/miriad/`head -1 $ASTROMAKE/opt/miriad/VERSIONS`
  goto done

#  set root directory
if ($#argv == 0) then
  # take the first entry from the list
  setenv MIR $ASTROMAKE/opt/miriad/`head -1 $ASTROMAKE/opt/miriad/VERSIONS`
else
  setenv MIR $ASTROMAKE/opt/miriad/$1
endif

done:

#  add environment  (linux only for now)
source $MIR/MIRRC.linux
