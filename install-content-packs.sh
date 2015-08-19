#!/bin/bash

echo "Waiting for Graylog webinterface...."

until $(curl --output /dev/null --silent --head --fail -u admin:admin http://localhost:12900/system); do
    echo 'Waiting some more...'
    sleep 5
done


set -e


echo ""
echo "============================="
echo "Graylog webinterface is ready"



for file in /tmp/content-packs/*.json; do
    echo "Installing content-pack: $file"; 

    uri=$(curl -s -v -u admin:admin -X POST -H "Content-Type: application/json" -d "@${file}" http://localhost:12900/system/bundles 2>&1 | grep "Location" | awk '{ print $3 }' | tr -d '\r')

    echo "Content pack uri: ${uri}"
    enableUri="${uri}/apply"

    echo "Enabling content-pack: ${enableUri}"
    curl -s -v -u admin:admin -X POST $enableUri
done


touch /opt/content-packs-installed
