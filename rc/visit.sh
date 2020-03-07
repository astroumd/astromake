# Bash environment for Visit


dir="$ASTROMAKE/opt/visit/"
version=`cat $ASTROMAKE/status/visit`

a_root=$dir/$version
echo Loading visit from $a_root

export PATH=$a_root/bin:$PATH


