# Open PHACTS Docker images

The [Open PHACTS Discovery Platform](http://www.openphacts.org/) can be
installed as a series of [Docker](http://docker.com/) containers.

* [Overview](#overview)
* [Requirements](#requirements)
* [Docker installation](#docker-installation)
  * [Disk space for Docker](#disk-space-for-docker)
* [Retrieving Open PHACTS Docker Images](#retrieving-open-phacts-docker-images)
* [Building data containers](#building-data-containers)
* [Configuring Open PHACTS platform](#configuring-open-phacts-platform)
  * [External services](#external-services)
* [Running the Open PHACTS platform](#running-the-open-phacts-platform)
* [Stopping the Open PHACTS platform](#stopping-the-open-phacts-platform)
* [Removing the Open PHACTS platform](#removing-the-open-phacts-platform)
* [Upgrading the Open PHACTS platform](#upgrading-the-open-phacts-platform)

## Overview

A _Docker container_ is a kind of sandboxed Linux environment, which typically
runs a single server instance, e.g. mySQL. Each Container has its own virtual
filesystem, which is realized from _Docker images_, downloaded from the
central [Docker Hub Registry](https://registry.hub.docker.com/).

The [Open PHACTS Docker images](https://registry.hub.docker.com/repos/openphacts/)
provide the different services that form the Open PHACTS platform.
This page describes how these Docker containers can be installed
and started using [Docker Compose](http://docs.docker.com/compose/).

The Open PHACTS containers will download and use
the latest Open PHACTS data release, and provide the
Virtuoso SPARQL endpoint, the Open PHACTS REST API and the
Explorer web interface.

**External services**: The following components of the Open PHACTS platform
is not yet included in this release.

- Chemical Resolution Service APIs (e.g. SMILEStoCSID and Similarity search)
- Text to Concept search calls

You can modify `docker-compose.yml` to enable usage of the public APIs for these,
see the [External services](-external-services) section below.


## Requirements

Roughly minimal hardware requirements:
  - ~ 150 GB of disk space
  - ~ 10 GB of RAM
  - ~ 4 CPU core

Recommended hardware:
  - ~ 250 GB of SSD disk
  - ~ 128 GB of RAM
  - ~ 8 CPU cores

Prerequisites:

  - Recent x64 Linux distribution (e.g. Ubuntu 14.04 LTS, Centos 7)
  - Recent [Docker](https://docs.docker.com/installation/#installation)
  - Recent [Docker Compose](http://docs.docker.com/compose/install/)
  - Fast Internet connection (during build of data containers)

Note that the disk space must be
[made available for Docker](#disk-space-for-docker)

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

_Note: If you install on Centos 6.6, you should instead install `docker-io` from yum, using `yum install epel-release -y` and `yum install docker-io`. For newer distributions. the `get.docker.com` approach above is preferred as it gives a newer Docker._

To test the installation, try:

    sudo docker run hello-world

You will additionally need to install
[Docker Compose](http://docs.docker.com/compose/install/). The exact version
used below might be out of date, see the install guide for details.

```shell
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

To test the installation, try:

    sudo docker-compose --version

_Hint: If you add your username to the `docker` group, as suggested by the
Docker install, and log out and in again, you can run the remaining `docker`
and `docker-compose` commands without using `sudo`. Note that this would
effectively be giving your user privileged `root` access to the host machine._

### Disk space for Docker

You will need about 150 GB of disk space for the Open PHACTS Docker containers
and data. Check on the docker host:

    sudo df -h /var/lib/docker/

If you do not have enough space on the right permission, you might want
to edit the `-volumes` sections in `docker-compose.yml` to use alternative
folders for the most disk hungry containers. Note that you still need
about 15 GB of disk space in `/var/lib/docker` for the
downloaded Docker images.

Another simpler option is to do the equivalent of:

    sudo service docker stop
    sudo mv /var/lib/docker /bigdisk/
    sudo ln -s /bigdisk/docker /var/lib/
    sudo service docker start

If you are using a virtual machine to run Docker (e.g. on Windows and OS X)
ensure you have allocated enough disk space (and memory) to the virtual machine.

It is **not recommended** to use an externally mounted volume
(e.g. USB, NFS or network share) for the Docker disk space.

## Retrieving Open PHACTS Docker images

Download this `ops-platform-setup` repository from the `master` branch:

    curl -L https://github.com/openphacts/ops-platform-setup/archive/master.tar.gz | tar xzv
    cd ops-platform-setup-master/docker

You can also use the above to upgrade the `ops-platform-setup` download, but this would
overwrite any changes you have made to `docker-compose.yml`.

Now make sure you are in the equivalent of the
`ops-platform-setup-master/docker` folder and run:

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

On installation you will need to run once these local
data containers and their data staging counterpaths,
[virtuosodata-frombackup](virtuosodata-frombackup) and
[mysqlstaging](mysqlstaging), which will download
the [Open PHACTS 1.5 data](http://data.openphacts.org/1.5/).

If you do not have sufficient disk space in your

The below will download about ~20 GB and might take some
time to download and stage
(~ 2h depending on network and disk speed).

    sudo docker-compose up --no-recreate -d mysqlstaging virtuosostaging

To follow the progress, use:

    sudo docker-compose ps
    sudo docker-compose logs mysqlstaging
    sudo docker-compose logs virtuosostaging

Note that `docker-compose logs` may not terminate even if its contanier does,
use *Ctrl-C* to cancel log listing.

Expected output from `mysqlstaging`:

```
mysqlstaging_1 | Preparing to stage ims
mysqlstaging_1 | Waiting for mySQL
mysqlstaging_1 | mySQL staging
mysqlstaging_1 | -rw-r--r-- 1 root root 1.2G Jul 22 15:43 /tmp/staging.sql
mysqlstaging_1 |  out: 8737.224ms at  937.6kB/s ( 937.6kB/s avg)    8.0MB
mysqlstaging_1 |  out: 1009.888ms at    7.9MB/s (   1.6MB/s avg)   16.0MB
..
mysqlstaging_1 |  out: 677.916ms at   11.8MB/s (   8.6MB/s avg)    1.1GB
mysqlstaging_1 |  out: 761.496ms at   10.5MB/s (   8.6MB/s avg)    1.1GB
(long wait)
mysqlstaging_1 | mySQL staging finished
docker_mysqlstaging_1 exited with code 0

```

Expected output from `virtuosostaging`:

```
virtuosostaging_1 | Downloading checksums from http://data.openphacts.org/dev/1.5/virtuoso/
virtuosostaging_1 | 2015-07-22 15:43:29 URL:http://data.openphacts.org/dev/1.5/virtuoso/ [1634/1634] -> "index.html" [1]
virtuosostaging_1 | 2015-07-22 15:43:29 URL:http://data.openphacts.org/dev/1.5/virtuoso/?C=N;O=D [1634/1634] -> "index.html?C=N;O=D" [1]
..
virtuosostaging_1 | Downloaded: 29 files, 1.5M in 0.1s (10.2 MB/s)
virtuosostaging_1 | Downloading Virtuoso backup set to /download
virtuosostaging_1 | Initializing download: http://data.openphacts.org/dev/1.5/virtuoso/ghard-dump-20150415.tar
virtuosostaging_1 | File size: 21715220480 bytes
virtuosostaging_1 | Opening output file ghard-dump-20150415.tar
virtuosostaging_1 | Starting download
(long wait)
virtuosostaging_1 | ghard-dump-20150415/bak_325.bp
virtuosostaging_1 | Data download complete
virtuosostaging_1 | Loading bak_ -- 677 files
(..)
virtuosostaging_1 | 08:46:24 OpenLink Virtuoso Universal Server
virtuosostaging_1 | 08:46:24 Version 07.20.3212-pthreads for Linux as of Jun  3 2015
virtuosostaging_1 | 08:46:24 uses parts of OpenSSL, PCRE, Html Tidy
virtuosostaging_1 | 08:46:24 Begin to restore with file prefix bak_
virtuosostaging_1 | 08:46:24 --> Backup file # 1 [0x3F02-0x74-0x8A]
virtuosostaging_1 | 08:46:25 --> Backup file # 2 [0x3F02-0x74-0x8A]
(..)
virtuosostaging_1 | 09:13:35 --> Backup file # 675 [0x3F02-0x74-0x8A]
virtuosostaging_1 | 09:13:36 --> Backup file # 676 [0x3F02-0x74-0x8A]
virtuosostaging_1 | 09:13:37 End of restoring from backup, 6751701 pages
virtuosostaging_1 | 09:13:37 Server exiting
virtuosostaging_1 | Loading completed
docker_virtuosostaging_1 exited with code 0
```

You may want to inspect the download progress:

```
stain@heater:~/ops-platform-setup/docker$ docker exec docker_virtuosostaging_1 du -hs /download
5.5G    /download
```


Staging is finished when both `mysqlstaging` and
`virtuosostaging` have exited. Note that the `mysql` container
will remain up. Check with:

    sudo docker-compose ps


## Configuring Open PHACTS platform

Edit the `docker-compose.yml` file for your host-specific settings.
This is a [Docker Compose configuration file](https://docs.docker.com/compose/yml/).

You can modify `-volumes` to use an explicit folder for the data containers,
e.g. to use a faster/bigger disk partition. See comments in-line in
`docker-compose.yml`.

You may want to change the exposed `-port` from `300*` to different ports,
or avoid their exposure at all. The only requirement here is that the exposed
port for `api` must correspond to the port in `API_URL`, and that the ports
are not already in use on the host server.

Unless you are going to access the platform on `localhost` exclusively,
you **must**  change the `API_URL` variable for the
`explorer2` container. This URL must use the fully qualified hostname
as it will be accessed in the browser. The port should remain
as `3002` unless you have changed the export port for `api`.

**Important**: Do **not** include the trailing `/` of the `API_URL`.

For example:

```yaml
    environment:
      - API_URL=http://server13.example.com:3002
```


**TODO**: Make a wrapping webserver that provides a common port 80 for api,
sparql and api.


### External services

The APIs for the [Chemical Resolution Service](https://ops.rsc.org/)
and [ConceptWiki](http://conceptwiki.org/) are not currently
available as Docker images. The default configuration for the
Open PHACTS Docker platform is to not access these APIs.

The APIs call below rely on these services and would therefore not
normally be functional in this Docker installation:

- `/structure?inchi={inchi}`
- `/structure?inchi_key={inchi_key}`
- `/structure?smiles={smiles}`
- `/structure/similarity?searchOptions.Molecule={searchOptions.Molecule}`
- `/structure/substructure?searchOptions.Molecule={searchOptions.Molecule}`
- `/structure/exact?searchOptions.Molecule={searchOptions.Molecule}`
- `/search/freetext?q={q}`
- `/search/byTag?q={q}&uuid={uuid}`
- `/getConceptDescription?uuid={uuid}`

To enable usage of the public APIs as a fallback for these calls,
modify `docker-compose.yml` to uncomment these lines (keep the indendation):

```yaml
  environment:
    - CRS=https://ops.rsc.org/api/v1/
    - CONCEPTWIKI=http://www.conceptwiki.org/web-ws/concept
```

Usage of the public Open PHACTS API is covered by the
[Terms of Use](https://www.openphacts.org/terms-and-conditions/terms-of-use) and
[Privacy Policy](https://www.openphacts.org/terms-and-conditions/privacy-policy).

## Running the Open PHACTS platform

Assuming the previous loading has completed, you can now start
the rest of the Open PHACTS platform:

    sudo docker-compose up --no-recreate -d

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


## Stopping the Open PHACTS platform

To check the status of the Open PHACTS platform, use:

    sudo docker-compose ps

To stop the platform, use:

    sudo docker-compose stop

## Removing the Open PHACTS platform

    sudo docker-compose stop
    sudo docker-compose rm -v

To recover additional disk space by the docker images, and don't have any other non-running docker images you want to keep:

    sudo docker images -q | xargs sudo docker rmi

Sometimes you might also need to remove all old containers - which would free up the images for the above:

    sudo docker ps -aq | xargs sudo docker rm -v

## Upgrading the Open PHACTS platform

Unless a new data release needs to be loaded, you do not need to repeat
the staging. To upgrade the software within the docker images
(e.g. newer mySQL or OPS Platform API), do:

    sudo docker-compose pull

Then rebuild the containers to use the newer images:

    sudo docker-compose up -d

If you need to restart staging from blank, then first remove their data volumes:

    sudo docker-compose rm -v mysqldata virtuosodata

Then follow the procedure "Building data containers" above.
