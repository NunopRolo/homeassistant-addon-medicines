#!/usr/bin/with-contenv bashio

DATASOURCE_URL="jdbc:postgresql://$(bashio::config 'datasource_url')?createDatabaseIfNotExist=true"
DATASOURCE_USERNAME="$(bashio::config 'datasource_username')"
DATASOURCE_PWD="$(bashio::config 'datasource_pwd')"
WEBCLIENT_URL="http://supervisor/core/api/services/persistent_notification/create"
HASS_TOKEN=$SUPERVISOR_TOKEN

cd /app
java -DDATASOURCE_URL=$DATASOURCE_URL -DDATASOURCE_USERNAME=$DATASOURCE_USERNAME -DDATASOURCE_PWD=$DATASOURCE_PWD -DWEBCLIENT_URL=$WEBCLIENT_URL -DHASS_TOKEN=$HASS_TOKEN -jar /app/app.jar &