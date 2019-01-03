FROM okieoth/mod_tile:0.1

RUN apt install -y npm nodejs && \
    npm cache clean -f && \
    npm install -g n && \
    n stable && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    npm install -g carto && \
    carto -v && \
    cd /opt/src && \
    git clone git://github.com/gravitystorm/openstreetmap-carto.git && \
    cd openstreetmap-carto && \
    carto project.mml > mapnik.xml && \
    scripts/get-shapefiles.py && \
    apt-get install -y fonts-noto-cjk fonts-noto-hinted fonts-noto-unhinted ttf-unifont

