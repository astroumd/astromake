
set dir=$ASTROMAKE/opt/ciao

if ($#a_version == 0) then
  if (-e $dir/VERSIONS) then
    # take the first entry from the list
    set root=$dir/`head -1 $dir/VERSIONS`
  else
    # must be just one version, so find out from the status file
    if (-e $ASTROMAKE/status/miriad) then
      set root=$dir/`cat $ASTROMAKE/status/ciao`
    endif     
  endif
else
  set root=$dir/$a_version[1]
endif

if (-e $root/bin/ciao.csh) then
   source $root/bin/ciao.csh
else
   echo astromake ERROR: could not find $root/bin/ciao.csh
endif
