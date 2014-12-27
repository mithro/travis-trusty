#!/bin/sh
set -x
set -e
sudo chroot /trusty su $(whoami) -c $@
