#!/bin/sh
# Customized to be system wide install, by Torgeir A 19.04.24

# check for root
if [ `id -u` -ne 0 ]
  then echo "Please run as root, as this script install system-wide."
  exit
fi

# check if there is over 100 .nanorc files in current folder
num_of_nanorc=$(ls | grep .nanorc | wc -l)
if [ $num_of_nanorc -lt 100 ]
  then echo "Seems like there is missing .nanorc files in current folder. Ensure that you run this script from its source folder"
  exit 0
fi

mkdir -p /usr/share/nanorc/
cp *.nanorc /usr/share/nanorc/
echo "include /usr/share/nanorc/*.nanorc" >> /etc/nanorc

chown -R root:root /usr/share/nanorc
chmod -R 664 /usr/share/nanorc
echo ""
echo "Hunky dory, we're done!"
