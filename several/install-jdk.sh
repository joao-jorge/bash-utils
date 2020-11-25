#! /bin/bash
#
#Script to install jdk and put the path in environment variable
#

FOLDER="$1" #Get the name of the folder

if [ $UID -eq 0 ];then #Verify if the root user is logged
    if [ -e $FOLDER ];then
        cp -R $FOLDER /opt/
        echo "export JAVA_HOME=/opt/$FOLDER" >> /etc/profile
        echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile
        echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
        source /etc/profile
        echo " "
        java -version
    fi
else
    echo "This scritp should be run as root..."
fi