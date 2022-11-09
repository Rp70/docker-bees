#!/usr/bin/env bash
# THIS IS FOR DEVELOPMENT ONLY.

# set -e
# set -x

REPO='rp70/bees';

version=$1
if [ "$version" = '' ]; then
    echo "Please specify bees version/tag to build!"
    echo "Version/tag can be found at https://github.com/Zygo/bees/tags"
    echo "For example: $0 v0.7.1"
    exit
fi

time docker build --pull --build-arg BEES_VERSION=$version --tag $REPO:$version . | tee tmp/build-$version.log

echo
echo
echo "Tag latest image"
latest=`docker images --format '{{.Tag}}' $REPO | sort -V | grep -v latest | tail -1`
docker tag $REPO:$latest $REPO:latest

echo 
echo "Images from $REPO"
docker images $REPO
