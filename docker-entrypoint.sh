#!/bin/bash
set -e

if [ ! -e /var/www/puffin ]; then
    sleep 2
    sed -i "s/'host'\s*=>\s*'127\.0\.0\.1',/'host'=>'db','username'=>'root','password'=>'piwik','dbname'=>'piwik',/" /var/www/html/plugins/Installation/FormDatabaseSetup.php
    sed -i "s/unset(\$config->General\['installation_in_progress'\]);/unset(\$config->General['installation_in_progress']);\$config->mail['transport'] = 'smtp';\$config->mail['host'] = 'mail';/" /var/www/html/plugins/Installation/Controller.php
    touch /var/www/puffin
fi

exec "$@"
