# still need to finish this


# for now only handle pacakge name as first argument
pkg=$1

set tst1=

if [ -z $pkg ]; then
  echo Empty args supported yet
elif [ -d $ASTROMAKE/opt/$pkg ]; then
  echo checking $ASTROMAKE/opt/$pkg/VERSIONS
  if [ -e $ASTROMAKE/opt/$pkg/VERSIONS ]; then
    echo VERSIONS file found for $pkg
  else
    echo $ASTROMAKE/rc/$pkg.sh
    source $ASTROMAKE/rc/$pkg.sh
  fi
else
  echo Failed to astroload $pkg 
fi

