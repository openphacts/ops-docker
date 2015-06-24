FROM stain/virtuoso

# http settings
RUN sed -i 's/\(ServerThreads.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxCachedProxyConnections.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxKeepAlives.*=\).*/\1 30/' /etc/virtuoso-opensource-7/virtuoso.ini

# sparql settings
RUN sed -i 's/\(ResultSetMaxRows.*=\).*/\1 500000000/' /etc/virtuoso-opensource-7/virtuoso.ini
RUN sed -i 's/\(MaxQueryExecutionTime.*=\).*/\1 900/' /etc/virtuoso-opensource-7/virtuoso.ini
