# http://www.vapor.ucar.edu/

set dir=$ASTROMAKE/opt/vapor

#	look for a new one
if (-e $dir/bin ) then
  echo Using $dir
else if ($#a_version) then
  set dir=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set dir=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/vapor) then
  set dir=$dir/`cat $ASTROMAKE/status/vapor`
else
  goto err
endif

if (-e $dir/bin) then
  set path=($dir/bin $path)
  rehash
  setenv LD_LIBRARY_PATH $dir/lib:$LD_LIBRARY_PATH
endif

err:

# unset dir
