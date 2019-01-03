# Purpose
This is a simple docker-compose setup for a mapmik and mod_tile based OSM tile server.


# Usage
To start the servers simply run `./bin/start.sh`. The similar stop script shut down the stack.

By default the tile server exposes its port 80 to the host port 9000. After a successful start
the function can be tested in a browser call the following URL `http://LOCAL_IP_ADDRESS:9000/tile_test/`.

After the very first start the tile server setup doesn't contain any data.




To delete aready rendered tiles it's fine to remove the the content of the host-mounted tile folder.
```bash
sudo rm -rf ./volumes/tiles/ajt
```

To delete the current database it's enough to remove the the host mounted database directory. 
```bash
sudo rm -rf ./volumes/db
```

The start script takes care that missing directories are created before the docker stack is started.

# Import data
To import the data is there an example script in the bin folder. I expects the berlin-latest.osm.pbf 
file into the import folder. If other data should be imported, download them from `http://download.geofabrik.de/`, place them into the import folder and add a seperate import script.

## Steps to import data
1. download the desired data from `http://download.geofabrik.de/`, f.e. `http://download.geofabrik.de/europe/germany/berlin-latest.osm.pbf`
2. save it into the import folder
3. start the tile server stack `./bin/start.sh`
4. expected the import script points to the right import file - currently berlin, call `./bin/importData.sh`
5. restart renderd in the tile server to renew the database connections  `./bin/restartRenderd.sh`
