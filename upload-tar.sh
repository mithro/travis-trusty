#!/bin/bash

for FILE in *.tar.*; do
  turbolift \
    -u $RACKSPACE_USER \
    -a $RACKSPACE_API \
    --os-rax-auth iad \
    upload \
    -c travis-trusty \
    -s $FILE
done
