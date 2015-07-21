#!/bin/bash
set -e

if [ -f /staging/.staged ] ; then
  echo RDF is already loaded. 
  echo Remove /staging/.staged to start again.
else
  echo Loading RDF form /staging
  #staging.sh
  #rm /staging/*
  touch /staging/.staged
fi

