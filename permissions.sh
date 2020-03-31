#!/bin/bash

set -e

# set root path
path=$(echo $(pwd))

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
#semanage fcontext -a -t httpd_sys_rw_content_t "${path}/storage(/.*)?"
#semanage fcontext -a -t httpd_sys_rw_content_t "${path}/bootstrap/cache(/.*)?"
#restorecon -Rv /var/www/
chcon -R -t httpd_sys_rw_content_t /var/www/laravel/storage
echo "Selinux permissions set"

echo "Permission process complete"
