#!/bin/bash

scriptPos=${0%/*}

source $scriptPos/imageConf.sh

docker run -it --rm --name="$imageName_bash" $imageName:$imageVersion /bin/bash
