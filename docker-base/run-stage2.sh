#!/bin/bash
echo "-->" "\"$@\""
cd $1
shift
echo "-->" "\"$@\""
exec "$@"
