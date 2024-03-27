#!/usr/bin/env bash
# THIS IS FOR DEVELOPMENT ONLY.

#set -ex
docker run -d --rm --privileged \
    -e HASH_TABLE=/mnt/.beeshome/beeshash.dat \
    -e HASH_TABLE_SIZE=4G \
    -e OPTIONS="-a -c 2" \
    -v /data:/mnt \
    --log-driver json-file \
    --log-opt mode=non-blocking \
    --log-opt max-size=1m \
    --log-opt max-file=5 \
    rp70/bees $1
