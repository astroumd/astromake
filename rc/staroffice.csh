#

set dir=$ASTROMAKE/opt/staroffice

# set d=$ASTROMAKE/opt/staroffice6.0


if ($#a_version) then
  set d=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set d=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/staroffice) then
  set d=$dir/`cat $ASTROMAKE/status/staroffice`
else
  goto err
endif

if (-e $d/program) then
  set path=($d/program $path)
  rehash
endif

err:

