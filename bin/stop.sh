#!/bin/bash
# stop the test environment


scriptPos=${0%/*}

if ! [ -z "$1" ]; then
    export STACK_VERSION="_$1"
fi

source $scriptPos/stackConf.sh

if docker-compose -v > /dev/null; then
    echo "use docker-compose"
    docker-compose -p "$STACK_NAME_BASE" -f $scriptPos/../$STACK_NAME.yml down
else
    echo "use docker-stack"
    docker stack rm $STACK_NAME
fi
