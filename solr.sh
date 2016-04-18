#!/bin/bash
source=http://archive.apache.org/dist/lucene/solr/4.7.2/solr-4.7.2.zip
solr_command="java -jar start.jar"
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
    echo "-p, --port=The port number       specify the port number for the solr script before the -b flag (if you use it)."
    exit 0
  fi;

  if [[ $var == "-p" || $var == "--port" ]]; then
    solr_command+=" -Djetty.port="${!i}
  fi;

  if [[ $var == "-b" || $var == "--background" ]]; then
    solr_command+=" > /dev/null 2>&1 < /dev/null & "
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

# Activate the solr script.
eval $solr_command
