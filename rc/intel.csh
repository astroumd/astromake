#! /bin/tcsh
#
#   for ASTROMAKE
#
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

#setenv IA32ROOT $ASTROMAKE/opt/intel/compiler50/ia32
#setenv IA32ROOT $ASTROMAKE/opt/intel/compiler60/ia32
setenv IA32ROOT $ASTROMAKE/opt/intel/compiler70/ia32
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

