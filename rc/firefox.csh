# Environment code for Firefox web browser
# Effects: adds alias 'firefox'

set app_name=firefox

#Standard code to find directory for requested version
set dir=$ASTROMAKE/opt/$app_name
set a_root=$dir
#a specific version has been requested
if ($#a_version > 0) then
	set a_root=$dir/$a_version
#No version requested, check VERSIONS file for preference
else if (-e $dir/VERSIONS) then
	#take first one in VERSIONS file
	set version=`head -1 $dir/VERSIONS`
	set a_root=$dir/$version
#No VERSIONS file, get version number from status file
else if (-e $dir/`cat $ASTROMAKE/status/$app_name`) then
  set a_root=$dir/`cat $ASTROMAKE/status/$app_name`
endif

alias firefox $a_root/firefox

#Clear the variables we used
unset dir
unset a_root
unset app_name
