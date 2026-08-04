#!/bin/bash

set -euxo pipefail
exec > >(tee /var/log/bootstrap.log)
exec 2>&1

yum update -y

dnf install -y \
    postgresql18.aarch64 \
    unzip \
    git \
    jq \
    curl --allowerasing

dnf install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
dnf install -y terraform

mkdir -p /tmp/dvdrental

cd /tmp/dvdrental

curl -L -o dvdrental.zip https://neon.tech/postgresqltutorial/dvdrental.zip

unzip -o dvdrental.zip

export PGPASSWORD='${source_password}'

pg_restore \
  --host=${source_endpoint} \
  --port=${source_port} \
  --username=${source_username} \
  --dbname=${source_database} \
  --verbose \
  dvdrental.tar