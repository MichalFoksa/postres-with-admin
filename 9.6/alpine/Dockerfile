# With PostgreSQL 9.6.4
FROM postgres:9.6.4-alpine
RUN apk --no-cache add \
        lighttpd php5-common php5-iconv php5-json php5-gd php5-curl php5-xml \
        php5-pgsql php5-imap php5-cgi fcgi php5-pdo php5-pdo_pgsql php5-soap \
        php5-xmlrpc php5-posix php5-mcrypt php5-gettext php5-ldap php5-ctype \
        php5-dom && \
    apk --no-cache add ca-certificates && \
    update-ca-certificates && \
    apk --no-cache add openssl

RUN mkdir /var/run/lighttpd && \
    chown lighttpd:lighttpd /var/run/lighttpd && \
    chmod -R 777 /var/run/lighttpd

COPY lighttpd.conf    /etc/lighttpd/lighttpd.conf
COPY mod_fastcgi.conf /etc/lighttpd/mod_fastcgi.conf

# Download and install phpPgAdmin 5.1
RUN wget https://codeload.github.com/phppgadmin/phppgadmin/tar.gz/REL_5-1-0 && \
    # Unpack and delete the tar.gz
    tar zxvf REL_5-1-0 && \
    rm REL_5-1-0 && \
    mkdir mkdir /usr/share/webapps && \
    mv phppgadmin-REL_5-1-0 /usr/share/webapps/phppgadmin && \
    # Copy sample config file
    cp /usr/share/webapps/phppgadmin/conf/config.inc.php-dist /usr/share/webapps/phppgadmin/conf/config.inc.php && \
    # Change the folder permissions
    chmod -R 777 /usr/share/webapps && \
    # Create a symlink to the phpPgAdmin folder
    ln -s /usr/share/webapps/phppgadmin/ /var/www/localhost/htdocs/phppgadmin

# Redirect web root to phppgadmin
COPY index.html /var/www/localhost/htdocs/index.html

# Prepend start lighttpd onto original docker-entrypoint.sh
RUN printf "#!/bin/bash\n echo 'Starting lighttpd.'\n /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf\n echo\n" > new-docker-entrypoint.sh && \
    # Copy original docker-entrypoint.sh
    cat /usr/local/bin/docker-entrypoint.sh >> new-docker-entrypoint.sh && \
    chmod +x new-docker-entrypoint.sh && \
    mv new-docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Expose PostreSQL
EXPOSE 5422
# Expose web server
EXPOSE 80
