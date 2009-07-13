
dir=$ASTROMAKE/opt/nemo

#	look for a new one
if [ -e $dir/nemo_start.sh ]; then
  export NEMO=$dir
elif [ -z $a_version ]; then
  export NEMO=$dir/$a_version
elif [ -e $dir/VERSIONS ]; then
  export NEMO=$dir/`head -1 $dir/VERSIONS`
elif [ -e $ASTROMAKE/status/nemo ]; then
  export NEMO=$dir/`cat $ASTROMAKE/status/nemo`
fi

if [ -e $NEMO/nemo_start.sh ]; then
  source $NEMO/nemo_start.sh
fi


