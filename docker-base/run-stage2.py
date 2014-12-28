#!/usr/bin/python
import sys
import os
print "argv", repr(sys.argv)
os.chdir(sys.argv[1])
print "exec", repr(sys.argv[2:])
os.execpl(*sys.argv[2:])
