#!/bin/bash

# Download apache solr.
if [ ! -f solr-4.10.2.zip ]; then
  wget http://apache.spd.co.il/lucene/solr/4.10.2/solr-4.10.2.zip
fi;

# Exctracting apache solr from the zip file.
if [ ! -d solr ]; then
  unzip -o solr-4.10.2.zip
  mv solr-4.10.2 solr
fi;