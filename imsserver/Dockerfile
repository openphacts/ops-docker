FROM tomcat:7-jre7

## !!!  NOTE !!!
##
## Must first manually run the "pre-build.sh" bash script in this directory in order to copy the
## QueryExpander war file and IMS jar file into this directory before running 'docker build'.

## TOMCAT info:

# CATALINA_BASE:   /usr/local/tomcat
# CATALINA_HOME:   /usr/local/tomcat
# CATALINA_TMPDIR: /usr/local/tomcat/temp
# JRE_HOME:        /usr
# CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

# Running on:
# http://container-ip:8080

# EXPOSE 8080
# CMD ["catalina.sh", "run"]

# Using version "7-jre7" because that's what was used for openphacts/identitymappingservice

## Versions of QueryExpander and IMS

ENV QE_VERSION="2.0.6-SNAPSHOT"
ENV IMS_VERSION="2.0.5-SNAPSHOT"

RUN rm -rf webapps
RUN mkdir -p webapps

COPY query.expander.ws.server-${QE_VERSION}.war webapps/QueryExpander.war
COPY loader-${IMS_VERSION}-onejar.jar           /usr/local/lib/ims-loader.jar

# permissions

RUN chmod 755 webapps/QueryExpander.war

# IMS loader script

COPY loader /usr/local/bin/loader
RUN chmod 755 /usr/local/bin/loader

## local.properties file of QueryExpander + IMS + BridgeDb config

RUN mkdir -p /usr/local/tomcat/conf/BridgeDb
COPY local.properties /usr/local/tomcat/conf/BridgeDb/

## from tomcat:
#
# EXPOSE 8080
# ENTRYPOINT <unspecified>
# CMD ["catalina.sh", "run"]
