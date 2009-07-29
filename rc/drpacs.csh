
set dir=$ASTROMAKE/opt/drpacs


#	look for a new one
if (-e $dir/drpacs_start.csh) then
  set v=$dir
else if ($#a_version) then
  set v=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set v=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/drpacs) then
  set v=$dir/`cat $ASTROMAKE/status/drpacs`
else
  goto err
endif

if (-e $v/drpacs_start.csh) then
  source $v/drpacs_start.csh
endif

err:

unset dir
