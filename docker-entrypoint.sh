#!/bin/bash
set -e

if [ ! -e piwik.php ]; then
	tar cf - --one-file-system -C /usr/src/piwik . | tar xf -
	chown -R www-data .

    sed -i "s/'host'\s*=>\s*'127\.0\.0\.1',/'host'=>'db','username'=>'root','password'=>'piwik','dbname'=>'piwik',/" plugins/Installation/FormDatabaseSetup.php
    sed -i "s/unset(\$config->General\['installation_in_progress'\]);/unset(\$config->General['installation_in_progress']);\$config->mail['transport'] = 'smtp';\$config->mail['host'] = 'mail';/" plugins/Installation/Controller.php
fi

exec "$@"
