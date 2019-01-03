#!/bin/bash

scriptPos=${0%/*}

source $scriptPos/imageConf.sh

pushd $scriptPos/.. > /dev/null

docker build -t $imageName:$imageVersion .

popd > /dev/null
