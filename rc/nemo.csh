
set dir=$ASTROMAKE/opt/nemo


if (-e $dir/nemo_start)
  setenv $NEMO $dir
else if ($#a_version) then
  setenv NEMO $dir/a_version
else if (-e $dir/VERSIONS) then
  setenv NEMO $dir/`head -1 $dir/VERSIONS`
else
  goto err
endif

source $NEMO/nemo_start

err:

unset dir
