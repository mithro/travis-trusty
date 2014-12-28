#!/bin/bash
echo sudo -E chroot /trusty su -p $(whoami) -c /run-stage2.sh "$PWD" "$@"
exec sudo -E chroot /trusty su -p $(whoami) -c /run-stage2.sh "$PWD" "$@"
