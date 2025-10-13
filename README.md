<a href=https://engineering-metrics.typeform.tf/standards-adoption-tool/reports/docker-postgresql-client/><img src=https://api.typeform.com/repositories/docker-postgresql-client/badges.svg /></a>
# Postgresql Client

This client is compatible with the official postgresql image, which means that it uses the environment variables provided by the image.

## Usage

### Create a postgres database

```
docker run -e DB_HOST=host DB_USER=user -e DB_PASS=pwd -d --name=postgresql-client "CREATE DATABASE mydb;"
```

### Use psql or pg_dump command

```
docker run --rm --link pg_container:db kalumkalac/postgresql-client:9.5 psql -c 'create database foo'
docker run --rm --link pg_container:db -v /tmp/foo:/dump kalumkalac/postgresql-client:9.5 pg_dump foo -f /dump/dump_foo.sql
```
