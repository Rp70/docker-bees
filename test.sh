#!/usr/bin/env bash
# THIS IS FOR DEVELOPMENT ONLY.

#set -ex
docker run -ti --rm --privileged \
    -e HASH_TABLE=/mnt/.beeshome/beeshash.dat \
    -e HASH_TABLE_SIZE=4G \
    -e OPTIONS="-a -c 2" \
    -v /backup:/mnt \
    rp70/bees $1
