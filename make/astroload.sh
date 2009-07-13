# still need to finish this


# for now only handle pacakge name as first argument
pkg=$1

if [ -d $ASTROMAKE/opt/$pkg ]; then
  source $ASTROMAKE/rc/$pkg.sh
fi