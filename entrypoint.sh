#!/usr/bin/env sh

set -e

DB_HOST=${DB_HOST:?}
DB_PORT=${DB_PORT:?}
DB_NAME=${DB_NAME:?}
DB_USER=${DB_USER:?}
DB_PASS=${DB_PASS:?}
DB_TIMEOUT=${DB_TIMEOUT:-10}

# wait for db to be ready
for i in $(seq $DB_TIMEOUT) ; do
  if ! nc -z $DB_HOST $DB_PORT > /dev/null 2>&1; then
    sleep 1
  else
    break
  fi
done

# create auth file
echo "${DB_HOST}":"${DB_PORT}":"${DB_NAME}":"${DB_USER}":"${DB_PASS}" > ~/.pgpass
chmod 0600 ~/.pgpass

# run database query
psql -h ${DB_HOST} -U ${DB_USER} -w ${DB_NAME} -c "$@"