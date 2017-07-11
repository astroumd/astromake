#
set dir=$ASTROMAKE/opt/git

# a_version is an astromake variable
# a_root is used in this script

unset a_root

if ($#a_version > 0) then

  set a_root=$dir/$a_version

else if (-e $dir/VERSIONS) then

  set version=`head -1 $dir/VERSIONS`
  set a_root=$dir/$version

else if (-e $dir/`cat $ASTROMAKE/status/git`) then

  set a_root=$dir/`cat $ASTROMAKE/status/git`

endif

if ($?a_root) then
   set path=($a_root/bin $path)
   rehash
endif

unset dir
unset a_root
