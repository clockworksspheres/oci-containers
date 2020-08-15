#!/bin/bash

#####
# Define user home as in future, it won't always be root
USERHOME="/root"

#####
# Create required user cache directories
mkdir -p $USERHOME/.dbus/session-bus
mkdir -p $USERHOME/.local/share
mkdir -p $USERHOME/.config/InSilmaril

#####
# Set the vym config file content
cat <<EOF > $USERHOME/.config/InSilmaril/vym.conf
[downloads]
cookies\vymID\value=@ByteArray(5e40c3d704a25)
enabled=true
permissionLastAsked=2020-08-10
updates\lastChecked=2020-08-10

[history]
stepsTotal=1000

[system]
autosave\ms=20000
readerPDF=xdg-open
readerURL=xdg-open
writeBackupFile=true

EOF

exit 0

