#! /bin/tcsh
#
# for astromake, hardcoded for compiler80

if !($?PATH) then
    setenv PATH $ASTROMAKE/opt/intel/compiler80/bin
else
    setenv PATH $ASTROMAKE/opt/intel/compiler80/bin:$PATH
endif

if !($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH $ASTROMAKE/opt/intel/compiler80/lib
else
    setenv LD_LIBRARY_PATH $ASTROMAKE/opt/intel/compiler80/lib:$LD_LIBRARY_PATH
endif

if !($?MANPATH) then
    setenv MANPATH $ASTROMAKE/opt/intel/compiler80/man:`man -w`
else
    setenv MANPATH $ASTROMAKE/opt/intel/compiler80/man:$MANPATH
endif

if !($?INTEL_LICENSE_FILE) then
    setenv INTEL_LICENSE_FILE $ASTROMAKE/opt/intel/compiler80/licenses
else
    setenv INTEL_LICENSE_FILE $ASTROMAKE/opt/intel/compiler80/licenses:$INTEL_LICENSE_FILE
endif

