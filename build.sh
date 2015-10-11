#!/bin/bash

rm -fr /var/www/html/*

source /etc/apache2/envvars
mkdir -p $APACHE_RUN_DIR
mkdir -p $APACHE_LOCK_DIR
mkdir -p $APACHE_DOC_ROOT
chown $APACHE_RUN_USER.$APACHE_RUN_GROUP $APACHE_LOCK_DIR
