#
# -v version pkg       load a specific version of a package
# -i pkg               list all versions a package has
# -h                   help
# pkg                  load the package 

astroload() {
    a=("$@")
    for i in "${a[@]}";  do
	case $i in
	    -h)
		echo "Usage: astroload [-h] [-v version pkg] [-i pkg] "
		shift
		;;
	    -v)
		a_version="$2"
		shift
		shift
		;;
	    -i)
		a_pkg="$2"   
	        if [ -e $ASTROMAKE/opt/$a_pkg/VERSIONS ]; then
		    echo The following version found for $a_pkg
		    grep -v ^# $ASTROMAKE/opt/$a_pkg/VERSIONS
		fi
		shift
		shift
		return
		;;
	    *)
		a_pkg="$1"
		a_dir=$ASTROMAKE/opt/$a_pkg
		shift
		if [ ! $a_pkg ]; then
		    return
		    echo 'ALARM: empty pkg?'
		elif [ -d $a_dir ]; then
		    if [ -z ${a_version+x} ]; then
			if [ -e $ASTROMAKE/status/$a_pkg ]; then
			    a_version=`cat $ASTROMAKE/status/$a_pkg`
			    # echo status file found for $a_pkg with $a_version
			elif [ -e $ASTROMAKE/opt/$a_pkg/VERSIONS ]; then
			    a_version=`grep -v ^# $ASTROMAKE/opt/$a_pkg/VERSIONS | head -1`
			    echo VERSIONS file found for $a_pkg with $a_version
			else
			    a_version="unknown"
			fi
		    fi
		    echo Loading $a_pkg version $a_version
		    source $ASTROMAKE/rc/$a_pkg.sh
		else
		    echo Skipping unknown package $a_pkg
		fi
		unset a_pkg
		unset a_version
		unset a_dir
		;;
	esac
    done
}


