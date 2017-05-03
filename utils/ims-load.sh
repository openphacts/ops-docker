#!/usr/bin/env bash

docker run \
  --link mysql-for-ims:mysql \
  -v /home/ubuntu/d/era/a/staging/links:/links \
  openphacts/identitymappingservice \
     loader file:///links/load-in-docker.xml
