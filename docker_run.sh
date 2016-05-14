set -ex

DOCKER_IMAGE=orangain/opencv-ppa-dev:trusty
docker run --rm -it -w /work/opencv -v `pwd`:/work -v ~/.gnupg:/root/.gnupg -e DEBEMAIL=$DEBEMAIL -e DEBFULLNAME=$DEBFULLNAME $DOCKER_IMAGE "$@"
