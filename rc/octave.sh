# Bash environment for Octave
# an actual bash user is encouraged to test/improve this
# BUT, I can't get astromake to work with bash anyway, so no idea
# how right or wrong this is

dir="/astromake/opt/octave/2.1.69"

if [ $PATH ]
then
    export PATH="$dir/bin:$PATH"
else
    export PATH="$dir/bin"
fi

if [ $MANPATH ]
then
    export MANPATH="$dir/man:$PATH"
else
    export PATH="$dir/man"
fi


exit 0
