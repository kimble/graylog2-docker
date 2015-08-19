#!/bin/bash


if [ ! -f /opt/content-packs-installed ]; then
    echo "Forking process that will install any content packs"
    /opt/install-content-packs.sh &
fi



echo "Starting..."
/opt/graylog/embedded/share/docker/my_init
