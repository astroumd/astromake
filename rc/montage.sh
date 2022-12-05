pkg=montage
dir=$ASTROMAKE/opt/$pkg

echo TEMPLATE: $dir

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


if [ -e ${a_root} ]; then
    echo Found ${a_root}
    PATH=${a_root}/bin:$PATH
else
    echo BAD ${a_root}
fi

#unset dir
#unset a_root


