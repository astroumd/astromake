#
# you can source this file, and it will load all installed packages
# (in random order) or set the shell variable "astromake" and it
# will parse those packages in order
#

set _root=/usr/local/astro

if (-e $_root/status) then
  pushd $_root/rc >& /dev/null
  if ($?astromake) then
    set _packages=($astromake)
  else
    set _packages=(`echo *.csh | sed s/.csh//g`)
  endif
  foreach p ($_packages)
    if (-e ../status/$p) then
      if ($?debug) echo Loading $p
      source $p.csh
    endif
  end
  popd >& /dev/null
else
  echo Odd, no astro packages installed yet
endif

unset _root
unset _packages
