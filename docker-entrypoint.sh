#!/usr/bin/env bash

# set -e
# set -x

if [ "$TZ" != '' ]; then
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
fi

if [ ! -f ${HASH_TABLE} ]; then
	mkdir /mnt/.beeshome
	truncate -s ${HASH_TABLE_SIZE} ${HASH_TABLE}
	chmod 700 ${HASH_TABLE}
fi

if [ "$1" = 'bash' ]; then
    bash
else
    bees --no-timestamps ${OPTIONS} /mnt
fi
