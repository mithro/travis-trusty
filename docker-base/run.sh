#!/bin/sh
sudo chroot /trusty su $(whoami) -c $@
