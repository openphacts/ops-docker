# Open PHACTS Docker images

The [Open PHACTS Discovery Platform](http://www.openphacts.org/) can be
installed as a series of [Docker](http://docker.com/) containers.

These containers will also download and use
the latest Open PHACTS data release, and will provide the
Virtuoso SPARQL endpoint, the Open PHACTS REST API and the
Explorer web interface.

**External services**: The following components of the Open PHACTS platform
is not yet included in this release, and invoke public APIs:

- Chemical structure search APIs (e.g. SMILEStoCSID and Similarity search) calls http://ops.rsc.org/
- Text to Concept search calls http://conceptwiki.openlinksw.com/


## Requirements

Minimal hardware requirements:
  - ~ 100 GB of disk space
  - ~ 16 GB of RAM
  - ~ 4 CPU core

Recommended hardware:
  - ~ 250 GB of SSD disk
  - ~ 128 GB of RAM
  - > 8 CPU cores

Prerequisites:

  - Recent x64 Linux distribution (e.g. Ubuntu 14.04 LTS, Centos 7)
  - Recent [Docker](https://docs.docker.com/installation/#installation)
  - Recent [Docker Compose](http://docs.docker.com/compose/install/)
  - Fast Internet connection (during build of data containers)


## Docker installation

These Docker images have been tested on:
* Centos 6.6
* Ubuntu 14.04 LTS

These images have **not** been tested with
Docker virtualization on non-Linux platforms (OS X, Windows).

See the
[Docker installation](https://docs.docker.com/installation/#installation)
guide for details for your Linux distribution. Here's the short-hand
installation for [Ubuntu 14.04](https://docs.docker.com/installation/ubuntulinux/):

    sudo -i
    wget -qO- https://get.docker.com/ | sh

To test the installation, try:

    sudo docker run hello-world

You will additionally need to install
[Docker Compose](http://docs.docker.com/compose/install/). The exact version
used below might be out of date, see the install guide for details.

    sudo -i
    curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

To test the installation, try:

    sudo docker-compose --version


## Retrieving Open PHACTS Docker images

Download this `ops-platform-setup` repository for the `docker` branch:

    curl -L https://github.com/openphacts/ops-platform-setup/archive/docker.tar.gz | tar xzv
    cd ops-platform-setup-docker/docker

To start, make sure you are in the `ops-platform-setup-docker/docker`
folder and run:

    sudo docker-compose pull

This will download the latest version of these
Docker images according to [docker-compose.yml](docker-compose.yml):

  * [openphacts/explorer2](https://registry.hub.docker.com/u/openphacts/explorer2/)
  * [openphacts/ops-linkeddataapi](https://registry.hub.docker.com/u/openphacts/ops-linkeddataapi/)
  * [openphacts/identitymappingservice](https://registry.hub.docker.com/u/openphacts/identitymappingservice/)
  * [mysql](https://registry.hub.docker.com/_/mysql/)
  * [memcached](https://registry.hub.docker.com/_/memcached/)
  * [stain/virtuoso](https://registry.hub.docker.com/u/stain/virtuoso/)

## Building data containers

The Open PHACTS Docker container use separate
[Data Volume Containers](http://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container)
to contain the Open PHACTS datasets.

On installation you will need to build these local
data containers and their data staging counterpaths,
[virtuosodata-frombackup](virtuosodata-frombackup) and
[mysqlstaging](mysqlstaging), which will download
the [Open PHACTS 1.5 data](http://data.openphacts.org/1.5/).

The below will download about ~20 GB and might take some
time to download and stage
(1-3 h depending on network and disk speed).

    sudo docker-compose build
    sudo docker-compose run -d mysqlstaging  # run in background - note name
    sudo docker-compose run virtuosostaging

Once `virtuosostaging` completes, check the progress on `mysqlstaging` using
the noted container name, e.g.:

    sudo docker logs docker_mysqlstaging_run_2

## Configuring Open PHACTS platform

Edit the `docker-compose.yml` file for your host-specific settings.
This is a [Docker Compose configuration file](https://docs.docker.com/compose/yml/).

You may want to change the exposed ports from `300*` to different ports,
or avoid their exposure at all. The only requirement here is that the exposed
port for `api` must correspond to the port in `API_URL`, and that the ports
are not already in use on the host server.

Unless you are going to access the platform on `localhost` exclusively,
you **must**  change the `API_URL` variable for the
`explorer2` container. This URL must use the fully qualified hostname
as it will be accessed in the browser. The port should remain
as `3002` unless you have changed the export port for `api`.

For example:

```yaml
    environment:
      - API_URL=http://server13.example.com:3002/
```


**TODO**: Make a wrapping webserver that provides a common port 80 for api,
sparql and api.


## Running Open PHACTS platform

Assuming the previous loading has completed, you can now start
the rest of the Open PHACTS platform:

    sudo docker-compose up -d

You can follow the progress by looking at the logs (press Ctrl-C to stop watching):

    sudo docker-compose logs

The Open PHACTS platform should be started when you see the equivalent of these
from each container:

api_1 | [Tue Jun 16 16:49:14.309976 2015] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.10 (Debian) PHP/5.6.10 configured -- resuming normal operations
mysql_1           | 2015-06-16 16:48:47 1 [Note] mysqld: ready for connections.
explorer2_1 | [2015-06-16 16:49:35] INFO  WEBrick::HTTPServer#start: pid=1 port=3000
ims_1 | 16-Jun-2015 16:49:06.641 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in 5568 ms

The `virtuoso` container usually takes the longest to start up.

Once started, this should expose the following services (replace `localhost` with your
server's hostname):

  * [http://localhost:3001/](http://localhost:3001/) - Open PHACTS Explorer Web UI  
  * [http://localhost:3002/](http://localhost:3002/) - Open PHACTS REST API
  * [http://localhost:3003/sparql](http://localhost:3003/sparql) - Virtuoso SPARQL
  * [http://localhost:3004/QueryExpander/](http://localhost:3004/QueryExpander/) - Open PHACTS IdentityMappingService (IMS)

**Note:** using the text search in Explorer will use the
remote Text-to-Concept service from conceptiwki.org.


## Stopping Open PHACTS platform

To check the status of the Open PHACTS platform, use:

    sudo docker-compose ps

To stop the platform, use:

    sudo docker-compose stop
