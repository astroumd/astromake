
set dir=$ASTROMAKE/opt/gipsy

if (-e $ASTROMAKE/status/gipsy) then
  setenv gip_root $ASTROMAKE/opt/gipsy/`cat $ASTROMAKE/status/gipsy`
endif

# 	install environment

if (-e $gip_root/sys/gipenv.csh) source $gip_root/sys/gipenv.csh

unset dir

