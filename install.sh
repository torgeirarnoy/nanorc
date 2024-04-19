#!/bin/sh
# Customized to be system wide install, by Torgeir A 19.04.24

# check for unzip before we continue
if [ ! "$(command -v unzip)" ]; then
  echo 'unzip is required but was not found. Install unzip first and then run this script again.' >&2
  exit 1
fi

mkdir -p /usr/share/nanorc/
cp *.nanorc /usr/share/nanorc/
echo "include /usr/share/nanorc/*.nanorc" >> /etc/nanorc

chown -R root:root /usr/share/nanorc
chmod -R 664 /usr/share/nanorc
