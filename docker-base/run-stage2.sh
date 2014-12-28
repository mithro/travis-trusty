#!/bin/sh
cd $1
exec "${*:2}"
