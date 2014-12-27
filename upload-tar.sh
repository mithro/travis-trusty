#!/bin/bash

TB_COMMAND="turbolift -u $RACKSPACE_USER -a $RACKSPACE_API --os-rax-auth iad upload -c travis-trusty"

# Upload the tar bz
$TB_COMMAND -s . --sync --pattern-match ".*\.tar\..*"

# Generate an index file
md5sum *.tar.* | sort -k2 > index.txt
$TB_COMMAND -s index.txt
