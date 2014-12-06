#!/bin/bash

# Download apache solr.
if [ ! -f solr-4.7.2.zip ]; then
  wget http://apache.spd.co.il/lucene/solr/4.7.2/solr-4.7.2.zip
fi;

# Exctracting apache solr from the zip file.
if [ ! -d solr ]; then
  unzip -o solr-4.7.2.zip
  mv solr-4.7.2 solr
fi;

# Go to apache solr conf folder.
cd solr/example/solr/collection1/conf

# Copy the settings file.
- yes | cp ../../../../../4.x/* .

# Start the server.
cd solr/example/

java -jar start.jar