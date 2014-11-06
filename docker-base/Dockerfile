FROM ubuntu:14.04

MAINTAINER mithro@mithis.com
RUN apt-get -y update && apt-get -y upgrade

# gst-switch compile stuff
RUN sudo apt-get -y install build-essential dh-autoreconf
RUN sudo apt-get -y install libgtk-3-dev
RUN sudo apt-get -y install gstreamer1.0.* libgstreamer.*1.0.*

# Python stuff for gst-switch API
RUN sudo apt-get -y install python-software-properties python-pip
RUN sudo apt-get -y install libglib2.0-dev gir1.2-glib-2.0 libgirepository1.0-dev libglib2.0-0 python-gi
RUN sudo apt-get -y install python-scipy
RUN sudo pip install mock
RUN sudo pip install pytest-cov
RUN sudo pip install pytest-pep8
RUN sudo pip install pylint

# Needed for tests
RUN sudo apt-get -y install wget libav-tools

# Tools needed
RUN sudo apt-get -y install git
