FROM stain/virtuoso

# http settings
RUN sed -i 's/\(ServerThreads.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxCachedProxyConnections.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxKeepAlives.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini

# sparql settings
RUN sed -i 's/\(ResultSetMaxRows.*=\).*/\1 500000000/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxQueryExecutionTime.*=\).*/\1 900/' /etc/virtuoso-opensource-7/virtuoso.ini

## FixMe: temp hack to get virtuoso to not reject '/sources' api call on AWS for 2.1

RUN sed -i 's/\(MaxQueryCostEstimationTime.*=\).*/\1 4000000/' /etc/virtuoso-opensource-7/virtuoso.ini

## FixMe: {R.Kerber} needed to add a line to [Parameters] section.
## Didn't know how, so replaced an existing line there. Definitely needs a real fix.
## Fixed this error:
##  - http://wikis.openlinksw.com/VirtuosoWikiWeb/VirtuosoErrorImageSizeWentAboveLimit
## [Parameters]
RUN sed -i 's/;X509ClientVerifyCAFile.*/TransactionAfterImageLimit       = 1000111000/' /etc/virtuoso-opensource-7/virtuoso.ini
