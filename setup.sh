#!/bin/bash

set +x
set +e

# Download and extra the trusty chroot
wget XXXXXX
sudo mkdir /trusty
sudo tar -xvf $TRUSTY_TAR /trusty

# Bind mount the required filesystem parts
for mountpoint in /dev /sys /proc /home; do
  sudo mount -o bind $mountpoint /trusty$mountpoint
done

# Run the real set up script
$PWD/.travis-run-trusty.sh $PWD/.travis-setup.sh
