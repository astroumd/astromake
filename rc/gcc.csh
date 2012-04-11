#
set dir=$ASTROMAKE/opt/gcc

# a_version is an astromake variable
# a_root is used in this script

unset a_root

if ($#a_version > 0) then

  set a_root=$dir/$a_version

else if (-e $dir/VERSIONS) then

  set version=`head -1 $dir/VERSIONS`
  set a_root=$dir/$version

else if (-e $dir/`cat $ASTROMAKE/status/gcc`) then

  set a_root=$dir/`cat $ASTROMAKE/status/gcc`

endif

if ($?a_root) then
   if ($path[1] == ".") then
	set path=(. $a_root/bin $path[2-])
   else
	set path=($a_root/bin $path)
   endif
   rehash

   if (1) then
    set lib=lib
    if (`uname -m` == x86_64)  set lib=lib64
   if ($?LD_LIBRARY_PATH) then
     setenv LD_LIBRARY_PATH $a_root/${lib}:${LD_LIBRARY_PATH}
   else
     setenv LD_LIBRARY_PATH $a_root/$lib
   endif
   endif

endif

unset dir
unset a_root
