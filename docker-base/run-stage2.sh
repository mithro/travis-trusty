#!/bin/bash
cd $1
echo $0
echo $1
echo "${@:2}"
echo "${*:2}"
echo "------"

exec "${@:2}"
