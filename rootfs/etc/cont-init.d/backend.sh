#!/usr/bin/with-contenv bashio
DATASOURCE_URL_CONFIG=$(bashio::config 'datasource_url')
DATASOURCE_USERNAME="$(bashio::config 'datasource_username')"
DATASOURCE_PWD="$(bashio::config 'datasource_pwd')"

WEBCLIENT_URL="http://supervisor/core/api/services/persistent_notification/create"
HASS_TOKEN=$SUPERVISOR_TOKEN

cd /app

if [ "$DATASOURCE_URL_CONFIG" == 'null' ] || [ "$DATASOURCE_USERNAME"  == 'null' ] || [ "$DATASOURCE_PWD" == 'null' ]; then
  # Application run
  java -DWEBCLIENT_URL=$WEBCLIENT_URL -DHASS_TOKEN=$HASS_TOKEN -Dspring.profiles.active=sqlite -jar /app/app.jar &
else
  DATASOURCE_URL="jdbc:postgresql://$DATASOURCE_URL_CONFIG"

  # Regex variables for postgresql connection
  HOST=$(echo $DATASOURCE_URL_CONFIG | cut -d ':' -f 1)
  PORT=$(echo $DATASOURCE_URL_CONFIG | cut -d ':' -f 2 | cut -d '/' -f 1)
  DB_NAME=$(echo $DATASOURCE_URL_CONFIG | cut -d '/' -f 2)

  # Create Database If Not Exists
  echo "SELECT 'CREATE DATABASE $DB_NAME' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME')\gexec" | PGPASSWORD=$DATASOURCE_PWD psql -U $DATASOURCE_USERNAME -h $HOST -p $PORT

  # Application run
  java -DDATASOURCE_URL=$DATASOURCE_URL -DDATASOURCE_USERNAME=$DATASOURCE_USERNAME -DDATASOURCE_PWD=$DATASOURCE_PWD -DWEBCLIENT_URL=$WEBCLIENT_URL -DHASS_TOKEN=$HASS_TOKEN -Dspring.profiles.active=postgres -jar /app/app.jar &
fi