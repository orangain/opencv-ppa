# PPA of OpenCV 3.0

This is a PPA of OpenCV 3.0 for Ubuntu trusty ported from [Debian's experimental OpenCV 3.0 package](https://packages.debian.org/experimental/python-opencv). Also provide the python3-opencv package.

## How to Use the PPA

```
$ sudo add-apt-repository ppa:orangain/opencv
$ sudo apt-get update
$ sudo apt-get install python3-opencv
```

## How to Build

### Setup

```
$ git clone https://github.com/orangain/opencv-ppa
$ cd opencv-ppa/
$ wget http://http.debian.net/debian/pool/main/o/opencv/opencv_3.0.0+dfsg.orig.tar.xz
$ tar xvf opencv_3.0.0+dfsg.orig.tar.xz -C opencv/ --strip 1
```

### Build

```
$ cd opencv/
$ debuild -b -rfakeroot -uc -us
```

### Release

```
$ dch -U -D xenial  # Then write release notes in your editor
$ git add . ; git commit ; git tag ubuntu/ppaN
$ debuild -S -sa  # GPG key is required
$ dput ppa:orangain/opencv ../opencv_3.0.0+dfsg-1ubuntu1ppaN_source.changes
```

### Build with Docker

```
$ ./docker_run.sh debuild -b -rfakeroot -uc -us
```

### Release with Docker

```
$ ./docker_run.sh dch -U -D xenial  # Then write release notes in your editor
$ git add . ; git commit ; git tag ubuntu/xenial-ppaN
$ ./docker_run.sh debuild -S -sa  # GPG key is required
$ ./docker_run.sh dput ppa:orangain/opencv ../opencv_3.0.0+dfsg-1ubuntu1ppaN_source.changes
```
