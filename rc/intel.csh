#! /bin/tcsh
#
# for astromake, hardcoded for compiler80 and compiler70, 
# nov-2004:  and now V8.1, which doesn't use the compilerNN directory anymore....
# oct 2005:  comments to prepare for V9.0 (which was released june 2005)
# may 2008:  unified for 10.1 style 


set dir=$ASTROMAKE/opt/intel

# a_version is an astromake variable
# a_root is used only in this script

if ($#a_version > 0) then
  set version=$a_version
else if (-e $dir/VERSIONS) then
  set version=`head -1 $dir/VERSIONS`
else if (-e $dir/`cat $ASTROMAKE/status/intel`) then
  set version=`cat $ASTROMAKE/status/intel`
else
  set version=0
endif

#   should only echo if it's an interactive shell
if ($?prompt) echo version=$version


#----------------------------------------------------------------------
# 10.0
if ($version:r:r == 10) then
  set arch=`uname -m`
  if ($arch == x86_64) then
    set e=e
  else
    set e=""
  endif
  source $ASTROMAKE/opt/intel/fc$e/$version/bin/ifortvars.csh
  source $ASTROMAKE/opt/intel/cc$e/$version/bin/iccvars.csh
  source $ASTROMAKE/opt/intel/idb$e/$version/bin/idbvars.csh
  # somehow idb failed to install
  #source /opt/intel/idb/9.0/bin/idbvars.csh

  setenv INTEL_LICENSE_FILE $dir/licenses/noncommercial_for_l_36127178.lic:$dir/licenses/noncommercial_cpp_l_45321397.lic

#----------------------------------------------------------------------
# 9.1
else if ($version == 91) then
  source $ASTROMAKE/opt/intel/fc/9.1.039/bin/ifortvars.csh
  source $ASTROMAKE/opt/intel/cc/9.1.043/bin/iccvars.csh
  # somehow idb failed to install
  #source /opt/intel/idb/9.0/bin/idbvars.csh

#----------------------------------------------------------------------
# 9.0

else if ($version == 90) then
  #source /opt/intel/fc/9.0/bin/ifortvars.csh
  #source /opt/intel/cc/9.0/bin/iccvars.csh
  #source /opt/intel/idb/9.0/bin/idbvars.csh
  echo version 90 Not yet done

#----------------------------------------------------------------------
# 8.1

else if ($version == 81) then

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
  echo Version=$version not implemented for intel compiler
  set path=($dir/bin $path)
  if ($?LD_LIBRARY_PATH) then
      setenv LD_LIBRARY_PATH $dir/lib/intel64:$LD_LIBRARY_PATH
  else
      setenv LD_LIBRARY_PATH $dir/lib/intel64
  endif
endif

rehash

