
#    Although the official way is to untar a casa tar ball and either
#    use the absolute path path_to_casa/casapy, or add path_to_casa to
#    your $PATH, we do a little more here:
#       set CASAPATH to the root directory ($a_root)  [note CASA has a quad-convention]
#       add $a_root                to $PATH
#       add $a_root/lib/casapy/bin to $PATH  (version 4.2.x and below)
#       add $a_root/lib/casa/bin   to $PATH
#       add $a_root/lib            to $LD_LIBRARY_PATH
#
# See also https://help.nrao.edu/index.php?/Tickets/Ticket/View/4777
#

dir=$ASTROMAKE/opt/casa

# a_version is an astromake variable
# a_root    is used in this script
unset a_root


if [ ${#a_version[@]} -gt 0 ]; then
    a_root=$dir/${a_version}

elif [ -e $dir/VERSIONS ]; then 
    version=`head -1 $dir/VERSIONS`
    a_root=$dir/${version}

elif [ -e $dir/`cat $ASTROMAKE/status/casa` ]; then 
    a_root=$dir/`cat $ASTROMAKE/status/casa`

fi


if [ -e ${a_root} ]; then
   # this adds commands like carmafiller and ipython
   if [ -d ${a_root}/lib/casapy/bin ]; then
      PATH=${a_root}/lib/casapy/bin:$PATH
   elif [ -d ${a_root}/lib/casa/bin ]; then
      PATH=${a_root}/lib/casa/bin:$PATH
   fi
   
   if [ -z ${LD_LIBRARY_PATH} ]; then
      export LD_LIBRARY_PATH=${a_root}/lib/:${LD_LIBRARY_PATH}
   else
      export LD_LIBRARY_PATH=${a_root}/lib
   fi

   # add the main thing (skip a_root/bin for now, they are symlinks)
   PATH=${a_root}/bin:${a_root}:${PATH}

   if [ -d ${a_root}/etc/carta/notyet ]; then
      echo Warning: loading CARTA
      path=(${a_root}/etc/carta/bin ${path})
      export LD_LIBRARY_PATH=$a_root/etc/carta/lib:$LD_LIBRARY_PATH
   fi

   hash -r 
   # setenv CASADATA $a_root/data    # this appears useless, use CASAPATH 
   # CASAPATH is a 4 word env var that is set when casapy starts up, 
   # root_dir  xxx yyy zzz
   # CASAROOT is our astromake invention
   export CASAPATH="${a_root} linux socorro `hostname`"
   export CASAROOT=${a_root}
else
   echo BAD ${a_root}
fi

#unset dir
#unset a_root


