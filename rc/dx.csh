# no need to source anything, since it's in /usr/local/{bin,lib} etc.
# this is just a placeholder to keep automatic loader scripts happy

# pjt's version is in /usr/local/ds9; also had mirds9 and bswap

setenv DXROOT $ASTROMAKE/opt/dx
set path=($DXROOT/bin $path)
setenv LD_LIBRARY_PATH $DXROOT/lib_pjt
rehash




