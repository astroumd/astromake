#  cloudy

set pkg=cloudy
set dir=$ASTROMAKE/opt/$pkg

echo TEMPLATE: $dir

# a_version is an astromake variable
# a_root is used in this script

unset a_root

if ($#a_version > 0) then

  set a_root=$dir/$a_version

else if (-e $dir/VERSIONS) then

  set version=`head -1 $dir/VERSIONS`
  set a_root=$dir/$version

else if (-e $dir/`cat $ASTROMAKE/status/$pkg`) then

  set a_root=$dir/`cat $ASTROMAKE/status/$pkg`

endif

if (-e $a_root) then
   echo Found $a_root
   set path=($a_root/source $path)
   rehash
else
   echo BAD $a_root
endif

unset pkg
unset dir
unset a_root
