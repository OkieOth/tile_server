#!/bin/bash

/etc/init.d/apache2 start
renderd -f -c /opt/conf/renderd.conf

