#! /bin/tcsh
#
# for astromake, hardcoded for compiler80 and compiler70, 
# nov-2004:  and now V8.1, which doesn't use the compilerNN directory anymore....

set dir=$ASTROMAKE/opt/intel

# a_version is an astromake variable
# a_root is used only in this script

if ($#a_version > 0) then
  set version=$a_version
else if (-e $dir/VERSIONS) then
  set version=`head -1 $dir/VERSIONS`
else if (-e $dir/`cat $ASTROMAKE/status/intel`) then
  set version=`cat $ASTROMAKE/status/intel`
endif

#----------------------------------------------------------------------
# 8.1

if ($version == 81) then

if !($?PATH) then
    setenv PATH $ASTROMAKE/opt/intel/bin
else
    setenv PATH $ASTROMAKE/opt/intel/bin:$PATH
endif

if !($?LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH $ASTROMAKE/opt/intel/lib
else
    setenv LD_LIBRARY_PATH $ASTROMAKE/opt/intel/lib:$LD_LIBRARY_PATH
endif

if !($?MANPATH) then
    setenv MANPATH $ASTROMAKE/opt/intel/man:`man -w`
else
    setenv MANPATH $ASTROMAKE/opt/intel/man:$MANPATH
endif

if !($?NLSPATH) then
    setenv NLSPATH $ASTROMAKE/opt/intel/lib/ifcore_msg.cat
else
    setenv NLSPATH $ASTROMAKE/opt/intel/lib/ifcore_msg.cat:$NLSPATH
endif

#----------------------------------------------------------------------
# compiler80

else if ($version == 80) then

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

if !($?NLSPATH) then
    setenv NLSPATH $ASTROMAKE/opt/intel/compiler80/lib/ifcore_msg.cat
else
    setenv NLSPATH $ASTROMAKE/opt/intel/compiler80/lib/ifcore_msg.cat:$NLSPATH
endif

#----------------------------------------------------------------------
# compiler70

else if ($version == 70) then
if ! ($?IA32ROOT) then
    setenv IA32_SAVE_PATH $PATH
    if ($?LD_LIBRARY_PATH) then
        setenv IA32_SAVE_LD_LIBRARY_PATH $LD_LIBRARY_PATH
    endif
else
    echo Caution - changes to PATH and LD_LIBRARY_PATH since IA32ROOT originally set will be lost
    echo Saving old setting as IA32_CURRENT_PATH and IA32_CURRENT_LD_LIBRARY_PATH
    setenv IA32_CURRENT_PATH $PATH
    setenv IA32_CURRENT_LD_LIBRARY_PATH $LD_LIBRARY_PATH
    endif

setenv IA32ROOT $ASTROMAKE/opt/intel/compiler70/ia32
set    _manroot=$ASTROMAKE/opt/intel/compiler70/man
if !($?IA32_SAVE_PATH) then
    setenv PATH $IA32ROOT/bin
else
    setenv PATH $IA32ROOT/bin:$IA32_SAVE_PATH
    endif

if !($?IA32_SAVE_LD_LIBRARY_PATH) then
    setenv LD_LIBRARY_PATH $IA32ROOT/lib
else
    setenv LD_LIBRARY_PATH $IA32ROOT/lib:$IA32_SAVE_LD_LIBRARY_PATH
    endif

setenv INTEL_FLEXLM_LICENSE $ASTROMAKE/opt/intel/licenses

# with 7.0 ?
# setenv INTEL_LICENSE_FILE /astromake/opt/intel/licenses

if ($?MANPATH) then
  setenv MANPATH ${MANPATH}:$_manroot
else
  setenv MANPATH $_manroot
endif
unset _manroot

#--------------------------------------------------------------------------------
# older compilers not supported
else
  echo Version $version not implemented for intel compiler
endif

rehash
