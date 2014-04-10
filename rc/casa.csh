#
#    Although the official way is to untar a casa tar ball and either
#    use the absolute path path_to_casa/casapy, or add path_to_casa to
#    your $PATH, we do a little more here:
#       set CASAPATH to the root directory ($a_root)  [note CASA has a quad-convention]
#       add $a_root                to $PATH
#       add $a_root/lib/casapy/bin to $PATH
#       add $a_root/lib            to $LD_LIBRARY_PATH
#
# See also https://help.nrao.edu/index.php?/Tickets/Ticket/View/4777
#
set dir=$ASTROMAKE/opt/casa

# a_version is an astromake variable
# a_root    is used in this script

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
   # this adds commands like carmafiller and ipython
   set path=($a_root/lib/casapy/bin $path)
   if ($?LD_LIBRARY_PATH) then
      setenv LD_LIBRARY_PATH $a_root/lib/:$LD_LIBRARY_PATH
   else
      setenv LD_LIBRARY_PATH $a_root/lib
   endif
   # add the main thing (skip a_root/bin for now, they are symlinks)
   if ($path[1] == ".") then
	set path=(. $a_root $path[2-])
   else
	set path=($a_root $path)
   endif
   rehash
   # setenv CASADATA $a_root/data    # this appears useless, use CASAPATH 
   # CASAPATH is a 4 word env var that is set when casapy starts up, 
   # root_dir  xxx yyy zzz
   setenv CASAPATH $a_root
endif

unset dir
unset a_root
