#! /bin/bash

mkdir html
cd html

echo "creating make build...\n"

# generate the make file.
drush make /opt/dev/demo.com/demo.make

echo "[OK]\n"

echo "linking files..."

# link to the files and settings dirs
cd sites/default
ln -s /opt/files files
ln -s /opt/dev/demo.com/settings.inc settings.php

# link to our theme file
cd ../all/themes
ln -s /opt/dev/demo.com/demo_theme demo_theme

echo "[OK]\n"

if [ "$1" = "--include-db" ]; then
	echo "loading db dump... "
	mysql -u root -p demo_db < /opt/dev/demo.com/demo.sql
	echo "[OK]\n"
fi

