#!/bin/bash

set -e

# Get the latest chroot details
wget -q http://travis-trusty.timvideos.us/index.txt -O chroot-details.txt
CHROOT_TAR_INFO=$(cat chroot-details.txt | grep tar.bz2 | tail -n 1)
CHROOT_TAR_FILE=$(echo $CHROOT_TAR_INFO | sed -e's/[^ ]* //')
CHROOT_TAR_MD5=$(echo $CHROOT_TAR_INFO | sed -e's/ .*//')

# Download and extra the trusty chroot
sudo mkdir /trusty
sudo mount -t tmpfs tmpfs /trusty
wget http://travis-trusty.timvideos.us/$CHROOT_TAR_FILE -O- | (cd /trusty; sudo tar -jxf -)

# Look at the run script
#sudo wget -q -O/trusty/run.py https://raw.githubusercontent.com/mithro/travis-trusty/master/docker-base/run.py
#sudo wget -q -O/trusty/run-stage2.py https://raw.githubusercontent.com/mithro/travis-trusty/master/docker-base/run-stage2.py
#sudo chmod a+rx /trusty/run*.py
ls -l /trusty/run*.py
md5sum /trusty/run*.py
cat /trusty/run*.py

# Bind mount the required filesystem parts
# Uses --rbind to all sub-filesystems are also bound.
for mountpoint in /dev /sys /proc /home /etc/hosts /etc/resolv.conf; do
  sudo mount --rbind $mountpoint /trusty$mountpoint
done
