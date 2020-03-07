#

set _dir = /astromake/opt/duchamp

set path = ($_dir/bin $path)
rehash

setenv LD_LIBRARY_PATH $_dir/lib:LD_LIBRARY_PATH
