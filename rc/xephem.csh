#! /bin/csh -f
#	xephem lives in /usr/local/bin;
#		this script can even be executed, it merely checks
#		for the correct home directory setup for your
#		personal setup files
#
set _xephemdir=/usr/local/astro/packages/xephem

if (-e $_xephemdir) then
  if (! -d $HOME/XEphem) then
    echo First time xephem user: creating $HOME/XEphem
    mkdir $HOME/XEphem
    cp $_xephemdir/GUI/xephem/XEphem.ad $HOME/XEphem/XEphem
    ln -s /usr/local/astro/packages/xephem/GUI/xephem $HOME/XEphem
  endif
else
  echo Problem, $_xephemdir does not exist
endif
