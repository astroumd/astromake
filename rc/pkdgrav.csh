
set dir=$ASTROMAKE/opt/pkdgrav

set os=`uname`-`uname -m`

#	look for a new one
if (-e $dir/bin/$os ) then
  echo Using $dir
else if ($#a_version) then
  set dir=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set dir=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/pkdgrav) then
  set dir=$dir/`cat $ASTROMAKE/status/pkdgrav`
else
  goto err
endif

if (-e $dir/bin/$os) then
  set path=($dir/bin/$os $dir/bin/scripts $path)
  rehash
  setenv PKDGRAV $dir
endif

err:

# unset dir
