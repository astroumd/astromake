#

if (0) then

  #  the hardcoded way
  setenv LHEASOFT /local/pkg/ftools/lheasoft/Linux
  source $LHEASOFT/lhea-init.csh

else

  # the more astromake minded way

  set dir=$ASTROMAKE/opt/lheasoft

  if ($#a_version > 0) then
    set version=$a_version
  else if (-e $dir/VERSIONS) then
    set version=`head -1 $dir/VERSIONS`
  else if (-e $dir/`cat $ASTROMAKE/status/lheasoft`) then
    set version=`cat $ASTROMAKE/status/lheasoft`
  endif


  setenv LHEASOFT $dir/$version/Linux
  source $LHEASOFT/lhea-init.csh
  
  

endif






endif
