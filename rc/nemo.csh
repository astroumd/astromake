#
#echo nemo.csh:  $#argv ... 1 = $1   2 = $2

#setenv NEMO $ASTROMAKE/opt/nemo/`head -1 $ASTROMAKE/opt/nemo/VERSIONS`
#goto done

#  set root directory
if ($#argv == 0) then
  # take the first entry from the list
  setenv NEMO $ASTROMAKE/opt/nemo/`head -1 $ASTROMAKE/opt/nemo/VERSIONS`
else
  setenv NEMO $ASTROMAKE/opt/nemo/$1
endif

done:

#  add environment
source $NEMO/nemo_start
