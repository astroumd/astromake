
set dir=$ASTROMAKE/opt/mozilla

#  should it set MOZILLA_FIVE_HOME ???

if ($#a_version) then
  set m_path=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set m_path=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/mozilla) then
  set m_path=$dir/`cat $ASTROMAKE/status/mozilla`
else
  goto err
endif


if ($path[1] == ".") then
  set path=(. $m_path $path[2-])
else
  set path=($m_path $path)
endif

rehash

err:

unset m_path
