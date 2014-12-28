#!/usr/bin/python
import sys
import os
stage2 = ["/run-stage2.py", os.getcwd()] + sys.argv[1:]
if "DEBUG_TRUSTY" in os.environ:
    print "argv", repr(sys.argv)
    print "stg2", repr(stage2)
cmd = ["sudo", "-E", "chroot", "/trusty", "su", "-p", os.environ['USER'], "-c", " ".join('"%s"' % a for a in stage2)]
if "DEBUG_TRUSTY" in os.environ:
    print " cmd", repr(cmd)
os.execlp(*cmd)
