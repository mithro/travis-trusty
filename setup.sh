#!/bin/bash

set +x
set +e

# Get the latest chroot details
wget http://travis-trusty.timvideos.us/index.txt -O chroot-details.txt
CHROOT_TAR_INFO=$(cat chroot-details.txt | grep tar.bz2 | tail -n 1)
CHROOT_TAR_FILE=$(echo $CHROOT_TAR_INFO | sed -e's/[^ ]* //')
CHROOT_TAR_MD5=$(echo $CHROOT_TAR_INFO | sed -e's/ .*//')

# Download and extra the trusty chroot
TRUSTY_TAR=/tmp/ubuntu-trusty-chroot.tar.bz2
wget http://travis-trusty.timvideos.us/$CHROOT_TAR_FILE -O $TRUSTY_TAR
sudo mkdir /trusty
(cd /trusty; sudo tar -xvf $TRUSTY_TAR)

# Bind mount the required filesystem parts
for mountpoint in /dev /sys /proc /home; do
  sudo mount -o bind $mountpoint /trusty$mountpoint
done
