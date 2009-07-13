#
# cheat, thre's only 1 version
#

set dir=$ASTROMAKE/opt/gadget

set path=($dir/bin $path)
rehash

setenv  LD_LIBRARY_PATH $dir/lib:$LD_LIBRARY_PATH
