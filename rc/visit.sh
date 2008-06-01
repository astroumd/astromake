# Bash environment for Visit
# an actual bash user is encouraged to test/improve this
# BUT, I can't get astromake to work with bash anyway, so no idea
# how right or wrong this is

dir="/astromake/opt/visit/1.6/bin"

if [ $PATH ]
then
    export PATH="$dir/:$PATH"
else
    export PATH="$dir/"
fi

exit 0
