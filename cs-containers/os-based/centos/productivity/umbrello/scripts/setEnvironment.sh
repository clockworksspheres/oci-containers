#!/bin/bash

#####
# Define user home as in future, it won't always be root
PROJECTHOME="/opt/projects"
HOME="/opt/projects"

#####
# Create required user cache directories
mkdir -p $PROJECTHOME/.dbus/session-bus
mkdir -p $PROJECTHOME/.local/share
mkdir -p $PROJECTHOME/.config/InSilmaril

#####
# Set the vym config file content
cat <<EOF > $PROJECTHOME/.config/InSilmaril/vym.conf
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

