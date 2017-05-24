#!/usr/bin/env bash

## Versions of QueryExpander and IMS

QE_VERSION="2.0.6-SNAPSHOT"
IMS_VERSION="2.0.5-SNAPSHOT"

SERVER_WAR=${HOME}/.m2/repository/uk/ac/manchester/cs/openphacts/queryexpander/query.expander.ws.server/${QE_VERSION}/query.expander.ws.server-${QE_VERSION}.war

LOADER_JAR=${HOME}/.m2/repository/uk/ac/manchester/cs/openphacts/ims/loader/${IMS_VERSION}/loader-${IMS_VERSION}-onejar.jar

cp ${SERVER_WAR} .
cp ${LOADER_JAR} .
