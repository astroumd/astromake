#
#  somehow this is needed, shouldn't be since it was supposed to be 
#  compiled into the source
#
setenv PGPLOT_DIR $ASTROMAKE/opt/pgplot
if ($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH ${PGPLOT_DIR}:${LD_LIBRARY_PATH}
else
    setenv LD_LIBRARY_PATH ${PGPLOT_DIR}
endif

