FROM openjdk:8-jre-alpine

ARG OSMOSIS_URL="https://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz"
ENV OSMOSIS_URL $OSMOSIS_URL

RUN set -x \
&& mkdir -p /opt/osmosis \
&& wget -O - $OSMOSIS_URL | tar xz -C /opt/osmosis \
&& ln -s /opt/osmosis/bin/osmosis /usr/local/bin/osmosis

CMD ["osmosis"]
