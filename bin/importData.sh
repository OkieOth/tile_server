#!/bin/bash

# start latest version of service stack
scriptPos=${0%/*}

source $scriptPos/stackConf.sh

CONT_ID=`docker ps | grep "${STACK_NAME}_postgis" | awk '{print $1}'`

if [ -z "$CONT_ID" ]; then
    echo "can't find running postgresql container, exit"
    exit 1
fi

docker exec -it "$CONT_ID" psql -U osm_db -c 'create extension hstore;'


dbContainer=`docker ps | grep "${STACK_NAME}_postgis" | sed -e "s-.*${STACK_NAME}_postgis-${STACK_NAME}_postgis-"`
dataDir=`pushd $scriptPos/../import > /dev/null; pwd; popd > /dev/null`
cartoDir=`pushd $scriptPos/../carto > /dev/null; pwd; popd > /dev/null`

echo "dbContainer: $dbContainer"

docker run -it --network tile_server_default --rm --link ${dbContainer}:pg \
    -v ${dataDir}:/osm -v ${cartoDir}:/carto  -e PGPASSWORD=osmRocks! disrvptor/osm2pgsql \
    -c 'osm2pgsql --create --slim --cache 2000 -k --database osm_db --username osm_db --host pg -S /carto/openstreetmap-carto.style /osm/berlin-latest.osm.pbf'

# restart renderd in mod_tile image to renew database connections
$scriptPos/restartRenderd.sh
