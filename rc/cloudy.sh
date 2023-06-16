pkg=cloudy
dir=$ASTROMAKE/opt/$pkg

echo CLOUDY: $dir

# a_version is an astromake variable
# a_root    is used in this script
unset a_root


if [ ${#a_version[@]} -gt 0 ]; then
    a_root=$dir/${a_version}

elif [ -e $dir/VERSIONS ]; then 
    version=`head -1 $dir/VERSIONS`
    a_root=$dir/${version}

elif [ -e $dir/`cat $ASTROMAKE/status/$pkg` ]; then 
    a_root=$dir/`cat $ASTROMAKE/status/$pkg`

fi

export CLOUDY_DATA_PATH=$a_root/data

if [ -e ${a_root} ]; then
    echo Found ${a_root}
    PATH=${a_root}/source:$PATH
else
    echo BAD ${a_root}
fi

#unset dir
#unset a_root

# https://data.nublado.org/cloudy_releases/c22/old/c22.01.tar.gz
