#!/bin/bash -x

# Add Postgres-9.4 repos.
touch /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add -
apt-get update

# Install OpenJDK and Postgresql-9.4
apt-get install -y postgresql-9.4 postgresql-client-9.4

su -c "source /home/vagrant/app/vagrant/user-setup.sh" vagrant


