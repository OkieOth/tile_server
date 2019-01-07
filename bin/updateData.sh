#!/bin/bash

# updates the database
scriptPos=${0%/*}

source $scriptPos/stackConf.sh


nowTime=$(date +%Y%m%d-%I%M%S)


logDir=$scriptPos/../logs
logFile=$logDir/update.log

CONT_ID=`docker ps | grep "${STACK_NAME}_postgis" | awk '{print $1}'`

if [ -z "$CONT_ID" ]; then
    echo "[$nowTime] can't find running postgresql container, exit" | tee -a $logFile
    exit 1
fi



dbContainer=`docker ps | grep "${STACK_NAME}_postgis" | sed -e "s-.*${STACK_NAME}_postgis-${STACK_NAME}_postgis-"`
cartoDir=`pushd $scriptPos/../carto > /dev/null; pwd; popd > /dev/null`
osmosisChangesDir=`pushd $scriptPos/../osmosis/changes > /dev/null; pwd; popd > /dev/null`
osmosisConfDir=`pushd $scriptPos/../osmosis/conf > /dev/null; pwd; popd > /dev/null`


# step 1: query the changes
if ! docker run -v $osmosisConfDir:/opt/working -v $osmosisChangesDir:/opt/output --rm \
    okieoth/osmosis:0.1 osmosis --read-replication-interval workingDirectory=/opt/working \
    --simplify-change --write-xml-change /opt/output/diff.osc >> $logFile
then
    echo "[$nowTime] error while retrieve changes, exit" | tee -a $logFile
    exit 1
fi

# bug or wrong osmosis call??
if [ -f $osmosisConfDir/download.lock ]; then
    rm -f $osmosisConfDir/download.lock
fi




if ! docker run -it --network tile_server_default --rm --link ${dbContainer}:pg \
    -v ${osmosisChangesDir}:/osm -v ${cartoDir}:/carto  -e PGPASSWORD=osmRocks! disrvptor/osm2pgsql \
    -c 'osm2pgsql --create --slim --cache 2000 -k --database osm_db --username osm_db --host pg \
    --tag-transform-script /opt/carto/openstreetmap-carto.lua -S /carto/openstreetmap-carto.style /osm/diff.osc' >> $logFile
then
    echo "[$nowTime] error while update database, exit" | tee -a $logFile
    exit 1
fi
