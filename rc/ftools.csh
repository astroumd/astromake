#
#  this is not an official astromake package, it only works at UMD
#  courtesy Stephen White
#
setenv LHEASOFT /local/pkg/ftools/lheasoft/Linux_2.4_i686

#  Stephen's 'ftools' alias loads it:

setenv CALDB /local/pkg/ftools/caldb/xte
setenv CALDBCONFIG $CALDB/caldb.config
setenv CALDBALIAS ./
# setenv LD_LIBRARY_PATH "/opt/SUNWspro/lib:/usr/X11R6/lib"; 
source $LHEASOFT/lhea-init.csh


