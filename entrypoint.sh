#!/bin/sh

APP_DIR=/var/www/nextcloud

# If the application directory is empty, extract
# the latest.tar.bz2
if [ -z "$(ls -A $APP_DIR)" ]; then
    echo "Extracting nextcloud tarball"
    tar -xvf latest.tar.bz2 --strip-components=1 -C nextcloud
    chown -R nginx:nginx nextcloud
fi

/usr/bin/supervisord -c /etc/supervisord.conf