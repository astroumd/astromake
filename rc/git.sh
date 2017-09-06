#
dir=$ASTROMAKE/opt/git

# a_version is an astromake variable
# a_root is used in this script

# unset a_root


version=`head -1 $dir/VERSIONS`
a_root=$dir/$version

export PATH=$a_root/bin:$PATH

unset dir
unset a_root
