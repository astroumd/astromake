# Environment manipulation for Python
# Effects: Adds directory to PATH, MANPATH

# You should use code like this to find the directory for the application
set app_name=python

#Standard code to find directory for requested version
set dir=$ASTROMAKE/opt/$app_name
set a_root=$dir
#a specific version has been requested ($a_version is defined by astromake)
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


# Test if this is a Ureke distro

if (-d $a_root/iraf) then
  # for now just echo
  echo WARNING: this is a Ureke based python
endif

# Now make your environment modifications

if !($?PATH) then
    setenv PATH $a_root/bin
else
    setenv PATH $a_root/bin:$PATH
endif

if !($?MANPATH) then
    setenv MANPATH $a_root/man:`man -w`
else
    setenv MANPATH $a_root/man:$MANPATH
endif

#Clear the variables we used
unset app_name
unset dir
unset a_root
