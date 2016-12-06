FROM openphacts/ops-linkeddataapi:2.1.0

MAINTAINER Randy Kerber <randy@d2discovery.com>
## Dockerfile extends Docker Hub image openphacts/ops-linkeddataapi
## by: Stian Soiland-Reyes <soiland-reyes@cs.manchester.ac.uk>
## at: https://hub.docker.com/r/openphacts/ops-linkeddataapi/
## or: https://github.com/openphacts/OPS_LinkedDataApi/blob/docker/Dockerfile

WORKDIR /var/www/html

## For IMS call, replace deprecated command /mapBySetRDF with /mapUriRDF
RUN sed -i "s|'IMS_MAP_ENDPOINT'.*|'IMS_MAP_ENDPOINT', 'http://ims:8080/QueryExpander/mapUriRDF');|" deployment.settings.php
