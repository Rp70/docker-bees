# rp70/bees
Dockerized version of https://github.com/Zygo/bees (Best-Effort Extent-Same, a btrfs dedupe agent)

This repo builds Docker image `rp70/bees` based on the latest release found at https://github.com/Zygo/bees/tags.

This repo was inspired by the following repos:
* [github.com/deatheibon/bees-docker](https://github.com/deatheibon/bees-docker): I like the simple idea from him.
* [gitlab.com/c8160/bees](https://gitlab.com/c8160/bees)
So you may found some code lines was copied from or inspired by them

## What are differences from other docker images?
* Build from latest tagged releases
* Will support multiple BTRFS filesystems

## Usage
### docker run
#### Daemon mode
```
docker run -d --privileged --rm \
    -e HASH_TABLE=/mnt/.beeshome/beeshash.dat \
    -e HASH_TABLE_SIZE=4G \
    -e OPTIONS="-a -c 1" \
    -v /root/BTRFS/mounted/volume:/mnt rp70/bees
```

#### Interactive mode
```
docker run -ti --privileged --rm \
    -e HASH_TABLE=/mnt/.beeshome/beeshash.dat \
    -e HASH_TABLE_SIZE=4G \
    -e OPTIONS="-a -c 1" \
    -v /root/BTRFS/mounted/volume:/mnt rp70/bees
```
#### Docker Compose
See [docker-compose.yaml](docker-compose.yaml)

## TODO
[ ] Support multiple BTRFS filesystems

