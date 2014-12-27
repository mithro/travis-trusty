#!/bin/bash

set -e

# Get the latest chroot details
wget http://travis-trusty.timvideos.us/index.txt -O chroot-details.txt
CHROOT_TAR_INFO=$(cat chroot-details.txt | grep tar.bz2 | tail -n 1)
CHROOT_TAR_FILE=$(echo $CHROOT_TAR_INFO | sed -e's/[^ ]* //')
CHROOT_TAR_MD5=$(echo $CHROOT_TAR_INFO | sed -e's/ .*//')

# Download and extra the trusty chroot
TRUSTY_TAR=/tmp/ubuntu-trusty-chroot.tar.bz2
wget http://travis-trusty.timvideos.us/$CHROOT_TAR_FILE -O $TRUSTY_TAR
sudo mkdir /trusty
echo "Extracting $TRUSTY_TAR"
(cd /trusty; sudo tar -xf $TRUSTY_TAR)

# Look at the run script
sudo chmod a+rx /trusty/run.sh
ls -l /trusty/run.sh
md5sum /trusty/run.sh
cat /trusty/run.sh

# Bind mount the required filesystem parts
for mountpoint in /dev /sys /proc /home /etc/hosts /etc/resolv.conf; do
  sudo mount -o bind $mountpoint /trusty$mountpoint
done
