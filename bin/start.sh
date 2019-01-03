#!/bin/bash
#
# Requirements:
# - bash
# - docker

scriptPos=${0%/*}

#include conf script
source $scriptPos/stackConf.sh

composeFile="$STACK_NAME.yml"


pushd "$scriptPos/.."

databaseDir=volumes/db
if ! [ -d "$databaseDir" ]; then
    mkdir -p "$databaseDir"
fi

tilesDir=volumes/tiles
if ! [ -d "$tilesDir" ]; then
    mkdir -p "$tilesDir"
fi

if docker-compose -v > /dev/null; then
    echo "use docker-compose"
    docker-compose -p "$STACK_NAME" -f $composeFile up -d
else
    # if no compose available use stack
    echo "use docker-stack"
    docker stack deploy -c "${composeFile}" "$STACK_NAME"
fi
popd > /dev/null
