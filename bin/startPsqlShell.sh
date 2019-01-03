#!/bin/bash
#
# Requirements:
# - bash
# - docker

scriptPos=${0%/*}

#include conf script
source $scriptPos/stackConf.sh

CONT_ID=`docker ps | grep "${STACK_NAME}_postgis" | awk '{print $1}'`

if [ -z "$CONT_ID" ]; then
    echo "can't find running postgresql container, exit"
    exit 1
fi

docker exec -it "$CONT_ID" psql -U osm_db
