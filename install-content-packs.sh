#!/bin/bash

echo "Waiting for Graylog webinterface...."

until $(curl --output /dev/null --silent --head --fail -u admin:admin http://localhost:12900/system); do
    echo 'Waiting some more...'
    sleep 5
done




echo "Graylog webinterface seems to be ready ready"
sleep 5 # Just to be safe... 

echo "---- system ----"
curl --silent -u admin:admin http://localhost:12900/system | jq '.'
echo "----------------"
echo ""


echo "---- service-manager ----"
curl --silent -u admin:admin http://localhost:12900/system/serviceManager | jq '.'
echo "-------------------------"
echo ""


for file in /opt/content-packs/*.json; do
    echo "Installing content-pack: $file"; 
    uri=$(curl -s -v -u admin:admin -X POST -H "Content-Type: application/json" -d "@${file}" http://localhost:12900/system/bundles 2>&1 | grep "Location" | awk '{ print $3 }' | tr -d '\r')

    echo "Content pack uri: ${uri}"
    enableUri="${uri}/apply"

    echo "Enabling content-pack: ${enableUri}"
    curl -s -v -u admin:admin -X POST $enableUri
done


touch /opt/content-packs-installed
