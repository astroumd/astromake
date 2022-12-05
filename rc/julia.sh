
dir=$ASTROMAKE/opt/julia

#	look for a new one
if [ -z $a_version ]; then
  jdir=$dir/$a_version
elif [ -e $dir/VERSIONS ]; then
  jdir=$dir/`head -1 $dir/VERSIONS`
elif [ -e $ASTROMAKE/status/julia ]; then
  jdir=$dir/`cat $ASTROMAKE/status/julia`
fi

export PATH=$jdir/bin:$PATH


