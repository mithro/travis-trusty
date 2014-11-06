travis-trusty
=============

Tools for testing running a Ubuntu 14.04 (trusty) chroot on Travis.

Steps
=============

 * We use docker to generate a "tar.gz" chroot for travis (using docker-squash
   to get a single image).
 * We upload the "tar.gz" to cloud storage.
 * We download the "tar.gz" from cloud storage.
