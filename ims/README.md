### Running IMS in docker in AWS for openphacts

First build and install IMS components into local Maven repository.

```
mkdir -p ~/gh/openphacts
cd ~/gh/openphacts/BridgeDb
mvn clean install -DskipTests
cd ~/gh/openphacts/Validator
mvn clean install -DskipTests
cd ~/gh/openphacts/IdentityMappingService
mvn clean install -DskipTests
cd ~/gh/openphacts/queryExpander
mvn clean install -DskipTests
```

Change version numbers of IMS and QueryExpander in `pre-build.sh` and `Dockerfile`.

Then run:

```
cd ~/gh/openphacts/queryExpander/run/docker
./pre-build.sh
docker build -t ims-tomcat .
docker run -d --name ops-ims -p "3004:8080" ims-tomcat
```

Point your browser to:

[http://thehostname:3004/QueryExpander](http://thehostname:3004/QueryExpander)
