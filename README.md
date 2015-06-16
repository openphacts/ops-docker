# Open PHACTS Docker images

The [Open PHACTS Discovery Platform](http://www.openphacts.org/) can be
installed as a combination of [Docker](http://docker.com/) images.

These images will also download and use
the latest Open PHACTS data release, and will provide the
Virtuoso SPARQL endpoint, the Open PHACTS REST API and the
Explorer web interface.

**External services**: The following components of the Open PHACTS platform
is not yet included in this release, and can instead be configured to
invoke public APIs:

- Chemical structure search (calls http://ops.rsc.org/)
- Text to Concept search (calls to http://conceptwiki.org/)

## Requirements

Minimal hardware requirements:
  - ~ 100 GB of disk space
  - ~ 16 GB of RAM
  - ~ 4 CPU core

Recommended hardware:
  - ~ 250 GB of SSD
  - ~ 100 GB of RAM
  - ~ 16 cores

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

To start:

    cd ops-platform-setup
    sudo docker-compose pull

This will download the latest version of these
Docker images according to [docker-compose.yml](docker-compose.yml):

  * [openphacts/explorer2](https://registry.hub.docker.com/u/openphacts/explorer2/)
  * [openphacts/ops-linkeddataapi](https://registry.hub.docker.com/u/openphacts/ops-linkeddataapi/)
  * [openphacts/identitymappingservice](https://registry.hub.docker.com/u/openphacts/identitymappingservice/)
  * [mysql](https://registry.hub.docker.com/_/mysql/)
  * [memcached](https://registry.hub.docker.com/_/memcached/)
  * [stain/virtuoso](https://registry.hub.docker.com/u/stain/virtuoso/)

Next we'll build the two local data docker containers
[virtuosodata-frombackup](virtuosodata-frombackup) and
[mysqlstaging](mysqlstaging), which will download
the [Open PHACTS 1.5 data](http://data.openphacts.org/1.5/) - this
is about ~20 GB and might take some time to download and stage.

    docker-compose up mysqlstaging virtuosodata

## Running Open PHACTS Docker images

Assuming the previous loading has completed, you can now start
the Open PHACTS platform:

    sudo docker-compose start

This should expose the following services:

  * [http://localhost:3000/](http://localhost:3000/) - Open PHACTS Explorer Web UI  
  * [http://localhost:8181/](http://localhost:8181/) - Open PHACTS REST API
  * [http://localhost:8182/QueryExpander/](http://localhost:8182/QueryExpander/) - Open PHACTS IdentityMappingService (IMS)
  * [http://localhost:8895/sparql](http://localhost:8895/sparql) - Virtuoso SPARQL

**Note:** that using the text search in Explorer will use the
external Text-to-Concept service from conceptiwki.org.
