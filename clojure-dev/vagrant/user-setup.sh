#!/bin/bash -x

echo "export EDITOR=vim" >> $HOME/.bashrc

# Add OpenJDK 8 PPA.
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

# Download lein
mkdir -p $HOME/bin
curl -o $HOME/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x $HOME/bin/lein

# Add bin to PATH
echo "export PATH=\"$PATH:$HOME/bin\"" >> $HOME/.bashrc

# Set Postgres values.
echo "export PGPORT=\"5432\"" >> $HOME/.bashrc
echo "export PGUSER=\"brick-gardens\"" >> $HOME/.bashrc
echo "export PGDATABASE=\"brick-gardens\"" >> $HOME/.bashrc
echo "export PGHOST=\"localhost\"" >> $HOME/.bashrc

export PGDATABASE="brick-gardens"
export PGUSER="brick-gardens"

# Create database and user.
sudo -u postgres createdb $PGDATABASE

# Passing command to set password automatically.
sudo -u postgres psql -c "CREATE ROLE $(PGUSER) PASSWORD 'brickgardens' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;"

$HOME/bin/lein
