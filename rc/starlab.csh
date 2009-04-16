
set dir=$ASTROMAKE/opt/starlab



if ($#a_version) then
  set sl=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set sl=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/starlab) then
  set sl=$dir/`cat $ASTROMAKE/status/starlab`
else
  goto err
endif

if (-e $sl/starlab_start.csh) then
  source $sl/starlab_start.csh
endif

err:

unset dir
