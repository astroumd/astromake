#
set dir=$ASTROMAKE/opt/wcstools

# a_version is an astromake variable
# a_root is used in this script

set a_root=$dir

if ($?a_root) then
   if ($path[1] == ".") then
	set path=(. $a_root/bin $path[2-])
   else
	set path=($a_root/bin $path)
   endif
   rehash
  
   if ($?MANPATH) then
      setenv MANPATH $a_root/man:$MANPATH
   else
      setenv MANPATH $a_root/man
   endif

endif

unset dir
unset a_root
