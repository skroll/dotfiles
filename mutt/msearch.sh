#!/bin/sh

mairix=/usr/local/bin/mairix
mairixrc=~/.mairixrc

mbox="`grep mfolder ${mairixrc} | cut -d '=' -f 2`"
echo "Deleting old results folder..."
rm -f ${mbox}
echo "Updating index..."
${mairix} -p
echo "Executing mairix search..."
${mairix} $*

