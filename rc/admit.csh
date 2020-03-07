
set dir=$ASTROMAKE/opt/admit

#	look for admit
if (-e $dir/admit_start.csh) then
  set _admit = $dir
else if ($#a_version) then
  set _admit = $dir/$a_version
else if (-e $dir/VERSIONS) then
  set _admit = $dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/admit) then
  set _admit = $dir/`cat $ASTROMAKE/status/admit`
else
  goto err
endif

if (-e $_admit/admit_start.csh) then
  source $_admit/admit_start.csh
endif

err:

unset _admit
unset dir
