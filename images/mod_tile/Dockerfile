FROM okieoth/tileserver_base:0.1

RUN mkdir /opt/src 
RUN cd /opt/src && \
    git clone -b switch2osm git://github.com/SomeoneElseOSM/mod_tile.git && \
    cd mod_tile && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    make install-mod_tile && \
    ldconfig
    
