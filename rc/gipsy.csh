
set dir=$ASTROMAKE/opt/gipsy

if ($#a_version == 0) then
  if (-e $dir/VERSIONS) then
    # take the first entry from the list
    set gip=$dir/`head -1 $dir/VERSIONS`
  else
    # must be just one version, so find out from the status file
    if (-e $ASTROMAKE/status/gipsy) then
      set gip=$dir/`cat $ASTROMAKE/status/gipsy`
    endif     
  endif
else
  set gip=$dir/$a_version[1]
endif

# 	install environment

if (-e $gip/sys/gipenv.csh) then
  setenv gip_root $gip
  source $gip_root/sys/gipenv.csh
else
  echo Warning: $gip not a valid gip_root, gipsy not loaded
endif

unset dir
unset gip
