#!/bin/sh
sudo -E chroot /trusty su -p $(whoami) -c $@
