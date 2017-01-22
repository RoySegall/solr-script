#!/bin/bash
background=false
source=http://archive.apache.org/dist/lucene/solr/4.7.2/solr-4.7.2.zip
i=1;

# Go through the flags.
for var in "$@"
do

  i=$((i + 1))

  if [[ $var == "-h" || $var == "--help" ]]; then
    echo " "
    echo "solr-script by roy segall"
    echo " "
    echo "options:"
    echo "-b, --background=TRUE / FALSE    specify if solr will execute in the background or not."
    echo "-s, --source=The Source          specify the source destination to download solr from."
    exit 0
  fi;

  if [[ $var == "-b" || $var == "--background" ]]; then
    background=true
  fi;

  if [[ $var == "-s" || $var == "--source" ]]; then
    source=${!i}
  fi;
done

# Download apache solr.
if [ ! -f solr-4.7.2.zip ]; then
  wget - $source
fi;

# Exctracting apache solr from the zip file.
if [ ! -d solr ]; then
  unzip -oq solr-4.7.2.zip
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

# Activate the solr script.
if [ "$background" = true ]; then
  java -jar start.jar > /dev/null 2>&1 < /dev/null &
  exit 0
else
  java -jar start.jar
  exit 0
fi
