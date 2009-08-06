# Environment for Octave (matlab like numerical package)
# Effects: sets variables for octave

set dir = $ASTROMAKE/opt/octave/

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

set PREFIXDIR=$a_root

if !($?PATH) then
    setenv PATH $PREFIXDIR/bin
else
    setenv PATH $PREFIXDIR/bin:$PATH
endif


if !($?MANPATH) then
    setenv MANPATH $PREFIXDIR/man:`man -w`
else
    setenv MANPATH $PREFIXDIR/man:$MANPATH
endif

unset dir
unset PREFIXDIR
unset a_root

