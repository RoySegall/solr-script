#!/bin/bash
background=false
source=http://archive.apache.org/dist/lucene/solr/4.7.2/solr-4.7.2.zip
i=1;

for var in "$@"
do

  i=$((i + 1))

  if [ $var == "-s" ]; then
    echo ${!i}
  fi;

done



#
# # Go through the flags.
# while test $# -gt 0; do
#   case "$1" in
#     -h|--help)
#       echo " "
#       echo "solr-script by roy segall"
#       echo " "
#       echo "options:"
#       echo "-b, --background=TRUE/FALSE     specify if solr will execute in the background or not."
#       echo "-s, --source=TRUE/FALSE         specify the source destination to download solr from."
#       exit 0
#       ;;
#     -b|--background)
#       shift
#         background=true
#       shift
#       ;;
#     -s|--source)
#       shift
#         source=$1
#       shift
#       ;;
#     -sgd|--source-google-drive)
#       shift
#         source=$1
#       shift
#       ;;
#     esac
# done
#
# # Download apache solr.
# if [ ! -f solr-4.7.2.zip ]; then
#   wget - $source
# fi;
#
# # Exctracting apache solr from the zip file.
# if [ ! -d solr ]; then
#   unzip -o solr-4.7.2.zip
#   mv solr-4.7.2 solr
# fi;
#
# # Go to apache solr conf folder.
# cd solr/example/solr/collection1/conf
#
# # Copy the settings file.
# yes | cp ../../../../../config/* .
#
# # Go back.
# cd -
#
# # Start the server.
# cd solr/example/
#
# if [ "$background" = true ]; then
#   java -jar start.jar > /dev/null 2>&1 < /dev/null &
#   exit 0
# else
#   java -jar start.jar
#   exit 0
# fi
