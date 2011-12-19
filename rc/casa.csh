#
set dir=$ASTROMAKE/opt/casa

# a_version is an astromake variable
# a_root is used in this script

unset a_root

if ($#a_version > 0) then

  set a_root=$dir/$a_version

else if (-e $dir/VERSIONS) then

  set version=`head -1 $dir/VERSIONS`
  set a_root=$dir/$version

else if (-e $dir/`cat $ASTROMAKE/status/casa`) then

  set a_root=$dir/`cat $ASTROMAKE/status/casa`

endif

if ($?a_root) then
   # hack for test versions with carmafiller
   set path=($a_root/lib/casapy/bin $path)
   if ($?LD_LIBRARY_PATH) then
      setenv LD_LIBRARY_PATH $a_root/lib/:$LD_LIBRARY_PATH
   else
      setenv LD_LIBRARY_PATH $a_root/lib
   endif
   # add the main thing
   if ($path[1] == ".") then
	set path=(. $a_root $path[2-])
   else
	set path=($a_root $path)
   endif
   rehash
   setenv CASADATA $a_root/data
endif

unset dir
unset a_root
