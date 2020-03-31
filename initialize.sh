#!/bin/bash

set -e

# set root path
path=$(echo $(pwd))

# create .env
cp .env.example .env

# generate key
php artisan key:generate

# give apache ownership
chown -R apache:apache ${path}
echo "Chown set"

# set correct file permissions
find ${path} -type f -exec chmod 644 {} \;
echo "File permissions set"

# set correct directory permissions
find ${path} -type d -exec chmod 755 {} \;
echo "Directory permissions set"

# set permissions to storage and bootstrap/cache
chgrp -R apache ${path}/storage ${path}/bootstrap/cache
chmod -R ug+rwx ${path}/storage ${path}/bootstrap/cache
echo "Permissions set for storage and bootstrap/cahce directories"

# set selinux permissions
chcon -R -t httpd_sys_rw_content_t ${path}/storage
echo "Selinux permissions set"

echo "Initialization process complete - don't forget to update .env with the correct db parameters"
