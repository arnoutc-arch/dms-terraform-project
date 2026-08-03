#!/bin/bash

yum update -y

dnf install -y \
    postgresql15 \
    unzip \
    jq \
    curl

mkdir -p /tmp/dvdrental

cd /tmp/dvdrental

curl -L -o dvdrental.zip https://neon.tech/postgresqltutorial/dvdrental.zip

unzip -o dvdrental.zip

export PGPASSWORD="${source_password}"

psql \
  -h ${source_endpoint} \
  -U ${source_username} \
  -d ${source_database} \
  -c "CREATE ROLE ${dms_username} LOGIN PASSWORD '${dms_password}';"

psql \
  -h ${source_endpoint} \
  -U ${source_username} \
  -d ${source_database} \
  -c "GRANT rds_replication TO ${dms_username};"

psql \
  -h ${source_endpoint} \
  -U ${source_username} \
  -d ${source_database} \
  -c "GRANT CONNECT ON DATABASE ${source_database} TO ${dms_username};"

pg_restore \
  --host=${source_endpoint} \
  --port=${source_port} \
  --username=${source_username} \
  --dbname=${source_database} \
  --verbose \
  dvdrental.tar