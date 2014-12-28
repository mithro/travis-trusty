#!/usr/bin/python
import sys
import os
print "argv", repr(sys.argv)
cmd = ["sudo", "-E", "chroot", "/trusty", "su", "-p", os.environ['USER'], "-c", " ".join('"%s"' % a for a in sys.argv[1:])]
print " cmd", repr(cmd)
os.execlp(*cmd)
