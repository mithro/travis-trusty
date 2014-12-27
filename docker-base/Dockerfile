FROM ubuntu:14.04

MAINTAINER mithro@mithis.com
RUN apt-get -y update && apt-get -y upgrade

# gst-switch compile stuff
RUN apt-get -y install build-essential dh-autoreconf
RUN apt-get -y install libgtk-3-dev
RUN apt-get -y install gstreamer1.0.* libgstreamer.*1.0.*

# Python stuff for gst-switch API
RUN apt-get -y install python-software-properties python-pip
RUN apt-get -y install libglib2.0-dev gir1.2-glib-2.0 libgirepository1.0-dev libglib2.0-0 python-gi
RUN apt-get -y install python-scipy
RUN pip install mock
RUN pip install pytest-cov
RUN pip install pytest-pep8
RUN pip install pylint

# Needed for tests
RUN apt-get -y install wget libav-tools

# Tools needed
RUN apt-get -y install git

# Add the travis user with sudo
RUN adduser --disabled-password --gecos "" travis
RUN adduser travis sudo

RUN cat /etc/sudoers
RUN sed -i -e's/%sudo	ALL=(ALL:ALL) ALL/%sudo	ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers

ADD run.sh /run.sh

USER travis
WORKDIR /home/travis
