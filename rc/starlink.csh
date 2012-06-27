
set dir=$ASTROMAKE/opt/starlink


#	look for a new one
if (-e $dir/starjava) then
  setenv STARLINK_DIR $dir
else if ($#a_version) then
  setenv STARLINK_DIR $dir/$a_version
else if (-e $dir/VERSIONS) then
  setenv STARLINK_DIR $dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/starlink) then
  setenv STARLINK_DIR $dir/`cat $ASTROMAKE/status/starlink`
else
  goto err
endif

echo STARLINK = $STARLINK_DIR
set path=($STARLINK_DIR/bin $path)
rehash
setenv LD_LIBRARY_PATH $STARLINK_DIR/lib

err:

unset dir
