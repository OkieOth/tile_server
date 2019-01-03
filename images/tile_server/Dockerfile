FROM okieoth/carto:0.1



RUN mkdir /opt/tiles
RUN mkdir /var/run/renderd
RUN echo "LoadModule tile_module /usr/lib/apache2/modules/mod_tile.so" > /etc/apache2/conf-available/mod_tile.conf
RUN a2enconf mod_tile

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

RUN mkdir /opt/conf

ADD additional/test /opt/test/

ADD additional/my_mapnik.xml /opt/conf/
ADD additional/my_mapnik_gray.xml /opt/conf/
ADD additional/renderd.conf /opt/conf/
ADD additional/000-default.conf /opt/conf/

RUN ln -s /opt/conf/my_mapnik.xml /opt/src/openstreetmap-carto/my_mapnik.xml
RUN ln -s /opt/conf/my_mapnik_gray.xml /opt/src/openstreetmap-carto/my_mapnik_gray.xml
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /opt/conf/000-default.conf /etc/apache2/sites-enabled/000-default.conf


ADD additional/startTileServer.sh /opt/

RUN a2enmod expires

CMD /opt/startTileServer.sh

