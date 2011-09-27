#! /bin/bash

# Make sure the correct number of args was passed from the command line
if [ $# -eq 0 ]; then
  echo "Usage $0 [--include-db] [database name]"
  exit 1
fi

mkdir html
cd html

echo "creating make build..."

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
	echo "creating database..."
	mysql -u root -p -e "create database $2;"
	echo '[OK]\n'
	echo "loading db dump... "
	mysql -u root -p $2 < /opt/dev/demo.com/demo.sql
	echo "[OK]\n"
else
	echo "creating database..."
	mysql -u root -p -e "create database $2;"
	echo '[OK]\n'	
fi

