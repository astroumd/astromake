
set dir=$ASTROMAKE/opt/carma_tools

if ($#a_version) then
  setenv CARMA_TOOLS $dir/$a_version
else if (-e $dir/VERSIONS) then
  setenv CARMA_TOOLS $dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/carma_tools) then
  setenv CARMA_TOOLS $dir/`cat $ASTROMAKE/status/carma_tools`
else
  goto err
endif

set path=($CARMA_TOOLS/bin $path)
rehash

if ($?LD_LIBRARY_PATH) then
  setenv LD_LIBRARY_PATH $CARMA_TOOLS/lib:$LD_LIBRARY_PATH
else
  setenv LD_LIBRARY_PATH $CARMA_TOOLS/lib
endif

err:

unset dir
