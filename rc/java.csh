


#set dir=/home/java/
set dir=/astromake/opt/java/

if ($#a_version) then
  set jroot=$dir/$a_version
else if (-e $dir/VERSIONS) then
  set jroot=$dir/`head -1 $dir/VERSIONS`
else if (-e $ASTROMAKE/status/java) then
  set jroot=$dir/`cat $ASTROMAKE/status/java`
else
  goto err
endif

setenv JDK_HOME  $jroot
setenv JDKHOME   $jroot
setenv JAVA_HOME $jroot
setenv JAVAHOME  $jroot

set path=(. $jroot/bin $path[1-])
rehash

err:

unset dir
