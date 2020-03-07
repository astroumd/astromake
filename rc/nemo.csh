
set dir=$ASTROMAKE/opt/nemo

#	remove an old one if one is there
#if ($?NEMO) then
#  source $NEMO/nemo_end
#endif

#	look for a new one
if (-e $dir/nemo_start) then
  setenv NEMO $dir
else if ($#a_version) then
  setenv NEMO $dir/$a_version
else if (-e $dir/VERSIONS) then
  setenv NEMO $dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/nemo) then
  setenv NEMO $dir/`cat $ASTROMAKE/status/nemo`
else
  goto err
endif

if (-e $NEMO/nemo_start) then
  # derefence any symlinks
  # setenv NEMO `ls -l $NEMO | awk '{print $NF}'`
  source $NEMO/nemo_start
endif

err:

unset dir
