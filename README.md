## PostgreSQL Docker image with admin tools.
Docker image with PostgreSQL and phpPgAdmin. Ideal for development and evaluation.

Each image is build on top of an image from official [postres][1] repository so that all amazing features of parent (like configuration through environment variables) are preserved.

### Tag convention
Tag convention mimic that of [postres][1] repository, although this repo might be a bit behind, especially with tags pointing to PostgreSQL major version (its minor version might be behind).

### Quick Start

    docker run --name some-postgres -p 8080:80 -e POSTGRES_PASSWORD=example -d michalfoksa/postres-with-admin

In general, all examples from [postres][1] repository apply also here, just map admin http port 80 to your host. Either by:
- `-p 80` to map admin port to a host ephemeral (dynamic) port. See the actual mapping by `docker ps`, or `docker port CONTAINER_NAME`.

- `-p <hostPort>:80` to map to a particular host port (e.g. `-p 8080:80` maps it to port 8080).

### Accessing Admin Tools
- phpPgAdmin:

      http://<containerIp>:<hostPort>/phppgadmin/

### phpPgAdmin
[phpPgAdmin][2] is web based administration tool for PostgreSQL.

Main features:
- Administer multiple servers
- Browse tables, views & reports
- Execute arbitrary SQL
- Select, insert, update and delete
- Dump table data in a variety of formats: SQL, COPY, XML, XHTML, CSV, Tabbed, pg_dump
- Import SQL scripts, COPY data, XML, CSV and Tabbed

See [phpPgAdmin home page][2] for full feature list.

### About Docker Image
Docker image exposes port PostgreSQL port 5432 and http port 80 with admin tools.

#### Dockerfile
Dockerfile is available on https://github.com/MichalFoksa/postres-with-admin

#### Image Content
- PostgreSQL - version depends on image tag
- lighttpd
- php 5
- phpPgAdmin 5.1

[1]: https://hub.docker.com/_/postgres/
[2]: http://phppgadmin.sourceforge.net/doku.php
