#! /bin/csh -f
#
# Set up the java environment.
#    -- PJT's astromake version

#
# Note that this file should be "sourced" rather than executed.
#

# pjt
setenv NVOSS_HOME $ASTROMAKE/opt/nvoss
setenv VO_HOME $NVOSS_HOME
setenv JAVA_HOME /astromake/opt/java/j2sdk1.4.2_04
setenv ANT_HOME $VO_HOME/apache-ant-1.5.2

#setenv CATALINA_HOME $NVOSS_HOME/NetBeans3.6/jakarta-tomcat-5.0.19
setenv CATALINA_HOME /home/jakarta-tomcat-5.0.27

setenv AXIS_DEPLOY $CATALINA_HOME/webapps/axis
setenv WEB_DEPLOY $CATALINA_HOME/webapps

# check the existance of installation directories.  
set installation = ("NVO toolkit" "Java SDK" Ant Tomcat)
set installdir = ($VO_HOME $JAVA_HOME $ANT_HOME $CATALINA_HOME)
unset badconfig
foreach i (1 2 3 4)
   if (! -d $installdir[$i]) then
       set badconfig = 1
       echo "Can't find $installation[$i] directory: $installdir[$i]"
   endif
end
if ($?badconfig) exit(1)

set path = ($JAVA_HOME/bin $VO_HOME/bin $ANT_HOME/bin $path)

set alib = $VO_HOME/axis-1_2beta/lib
set lib = $VO_HOME/lib

setenv CLASSPATH $VO_HOME/dev:.:./classes


setenv CLASSPATH ${CLASSPATH}:$lib/fits.jar:$alib/image.jar:$alib/util.jar

# add the axis libs for web services
setenv CLASSPATH ${CLASSPATH}:$alib/axis-ant.jar:$alib/axis.jar:$alib/commons-discovery.jar:$alib/commons-logging.jar:$alib/saaj.jar:$alib/jaxrpc.jar:$alib/wsdl4j.jar::$alib/log4j-1.2.4.jar

# add the other needed jars
setenv CLASSPATH ${CLASSPATH}:$lib/xercesImpl.jar:$lib/xmlParserAPIs.jar:$lib/mail.jar:$lib/activation.jar

# add IVOA jars
setenv CLASSPATH ${CLASSPATH}:$lib/ivaofits-0.2.jar:$lib/ivoa-0.3.2.jar

echo VO_HOME = $VO_HOME
echo JAVA_HOME = $JAVA_HOME
echo ANT_HOME = $ANT_HOME
echo CATALINA_HOME = $CATALINA_HOME
echo All set up for NVO Summer School.

