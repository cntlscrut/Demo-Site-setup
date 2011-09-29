#! /bin/bash

# Make sure the correct number of args was passed from the command line
if [ $# -eq 0 ]; then
  echo "Usage $0 [--include-db] [database name] [--db-file] [make file]"
	echo "[--stand-new] [database name]"
  exit 1
fi
 CALLPATH=`pwd`

#clean out the old code first
rm -rf $CALLPATH/html

mkdir html
cd html

echo "creating make build..."

# generate the make file.
drush make $CALLPATH/demo.make

echo "[OK]\n"

echo "linking files..."

# link to the files and settings dirs
cd sites/default
ln -s /opt/files files
ln -s $CALLPATH/settings.inc settings.php

# link to our theme file
cd ../all/themes
ln -s /$CALLPATH/demo_theme demo_theme

echo "[OK]\n"

if [ "$1" = "--include-db" ]; then
	if [ "$3" = "--db-file" ]; then
		DUMP=$4
	fi
	echo "creating database..."
	mysql -u root -p -e "drop database $2; 	create database $2;"
	echo '[OK]\n'
	echo "loading db dump... "
	mysql -u root -p $2 < $CALLPATH/$DUMP
	echo "[OK]\n"
fi

if [ "$1" = "--stand-new" ]; then
	echo "dropping $2"
	echo "[OK]\n"
	echo "creating database..."
	mysql -u root -p -e "drop database $2; create database $2;"
	echo '[OK]\n'	
fi

