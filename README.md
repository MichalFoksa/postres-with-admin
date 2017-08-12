## PostgreSQL Docker image with admin tools.
Docker image with PostgreSQL and phpPgAdmin.

Each image is build on top of an imaged from official [postres][1] repository so that all parent amazing features are preserved.

### Tag convention

Tag convention mimic that of [postres][1] repository, althrough might be behind, especially with tag pointing to PostreSQL major versions.

### phpPgAdmin
[phpPgAdmin][2] is web based administration tool for PostreSQL.

Main features:
- Administer multiple servers
- Browse tables, views & reports
- Execute arbitrary SQL
- Select, insert, update and delete
- Dump table data in a variety of formats: SQL, COPY, XML, XHTML, CSV, Tabbed, pg_dump
- Import SQL scripts, COPY data, XML, CSV and Tabbed

See [phpPgAdmin home page][2] for full feature list.

### Docker Image Content
- PostreSQL - version depends on image tag
- lighttpd
- php 5
- phpPgAdmin 5.1

[1]: https://hub.docker.com/_/postgres/
[2]: http://phppgadmin.sourceforge.net/doku.php
