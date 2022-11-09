FROM ubuntu:20.04
LABEL   maintainer="github.com/Rp70/docker-bees" \
        summary="Performs best-effort extent-same deduplication on btrfs." \
        inspired-by="https://gitlab.com/c8160/bees" \
        inspired-by="https://github.com/deatheibon/bees-docker"

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && apt update \
    && apt -y install build-essential btrfs-progs markdown git tzdata

ARG BEES_VERSION
RUN set -ex \
    && git clone -b $BEES_VERSION --single-branch https://github.com/Zygo/bees.git /usr/src/bees

RUN set -ex \
    && cd /usr/src/bees && make
RUN set -ex \
    && cp /usr/src/bees/bin/bees /bin/bees

ADD docker-entrypoint.sh /
RUN set -ex \
    && chmod +x /docker-entrypoint.sh

RUN set -ex \
    && rm -rf /usr/src/bees \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint.sh"]
