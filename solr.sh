#!/bin/bash

# Download apache solr.
if [ ! -f solr-4.7.2.zip ]; then
  wget http://archive.apache.org/dist/lucene/solr/4.7.2/solr-4.7.2.zip
fi;

# Exctracting apache solr from the zip file.
if [ ! -d solr ]; then
  unzip -o solr-4.7.2.zip
  mv solr-4.7.2 solr
fi;

# Go to apache solr conf folder.
cd solr/example/solr/collection1/conf

# Copy the settings file.
yes | cp ../../../../../config/* .

# Go back.
cd -

# Start the server.
cd solr/example/

#
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo " "
      echo "solr-script by roy segall"
      echo " "
      echo "options:"
      echo "-h, --help                      show brief help"
      echo "-b, --background=TRUE/FALSE     specify if solr will execute in the background or not"
      exit 0
      ;;
    -b|--background)
      shift
        java -jar start.jar > /dev/null 2>&1 < /dev/null &
        exit 0
      shift
      ;;
    esac
done

java -jar start.jar
