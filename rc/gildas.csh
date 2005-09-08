
set dir=$ASTROMAKE/opt/gildas

unset a_root

if ($#a_version > 0) then
  set a_root=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set version=`head -1 $dir/VERSIONS`
  set a_root=$dir/$version
else if (-e $dir/`cat $ASTROMAKE/status/gildas`) then
  set a_root=$dir/`cat $ASTROMAKE/status/gildas`
endif

# old style, e.g. mar01 version
# set path=($a_root/bin $path)

# new style, e.g. jul05 version
if (-e $a_root/etc/login) then
  source $a_root/etc/login
else
  echo "GILDAS not loaded from $a_root, no etc/login file"
endif


rehash

