#!/bin/bash
set -e

if [ -f /staging/.staged ] ; then
  echo "RDF is already loaded. To start again, try:"
  echo "    docker-compose run virtuosostaging rm /staging/.staged"
  exit 0
fi

echo Loading RDF from /staging
tail -F /virtuoso/virtuoso.log &
staging.sh
rm /staging/*
touch /staging/.staged
echo Loading finished
