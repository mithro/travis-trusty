#!/bin/sh
set -x
set -e
sudo -E chroot /trusty su -p $(whoami) -c $@
