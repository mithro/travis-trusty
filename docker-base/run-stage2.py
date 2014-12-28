#!/usr/bin/python
import sys
import os
if "DEBUG_TRUSTY" in os.environ:
    print "argv", repr(sys.argv)
os.chdir(sys.argv[1])
if "DEBUG_TRUSTY" in os.environ:
    print "exec", repr(sys.argv[2:])
os.execlp(*sys.argv[2:])
