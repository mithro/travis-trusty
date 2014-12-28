#!/bin/sh
sudo -E chroot /trusty su -p $(whoami) -c /run-stage2.sh "$PWD" "$@"
