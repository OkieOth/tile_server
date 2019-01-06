# Remarks
All contained configuration steps based on the following documentation: 
https://ircama.github.io/osm-carto-tutorials/updating-data/#continue-set-up

# Usage of the image
## To test the basic work of the image type 

```bash
docker run --rm okieoth/osmosis:0.1 osmosis
```

## Create a default configuration file

```bash
# creates the standard osmosis configuration file (configuration.txt) in the current directory
docker run --rm -v `pwd`:/opt/conf okieoth/osmosis:0.1 osmosis --read-replication-interval-init workingDirectory=/opt/conf
# the lock file (download.lock) to prevent concurent runs can be ignored
```

## Get the initial state file for your data
The easiest way is to use the web site here: https://replicate-sequences.osm.mazdermind.de/

As an alternative the initial state file can be downloaded with wget.
```bash
wget https://planet.openstreetmap.org/replication/hour/000/003/000.state.txt -O "$WORKOSM_DIR/state.txt"
# or with specific date information
wget "https://replicate-sequences.osm.mazdermind.de/?"`date -u +"%Y-%m-%d"`"T00:00:00Z" -O $WORKOSM_DIR/state.txt
```

## Implementation of the update process
 ```bash
# expects that the configuration files are into the current directory
# output will also be written into host mounted dir, f.e. changesOutput
docker run -v `pwd`:/opt/working -v ABS_PATH/changesOutput:/opt/output --rm \
    okieoth:/osmosis:0.1 osmosis --read-replication-interval workingDirectory=/opt/working \
    --simplify-change --write-xml-change file="planetdiff.osc"
```
docker run -v `pwd`:/opt/conf -v /tmp/changesOutput:/opt/output --rm okieoth:/osmosis:0.1 osmosis --read-replication-interval workingDirectory=/opt/working --simplify-change --write-xml-change file="/opt/output/planetdiff.osc"
