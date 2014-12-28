#!/usr/bin/python
import sys
import os
if "DEBUG_TRUSTY" in os.environ:
    print "argv", repr(sys.argv)
cmd = ["sudo", "-E", "chroot", "/trusty", "su", "-p", os.environ['USER'], "-c", " ".join('"%s"' % a for a in sys.argv[1:])]
if "DEBUG_TRUSTY" in os.environ:
    print " cmd", repr(cmd)
os.execlp(*cmd)
