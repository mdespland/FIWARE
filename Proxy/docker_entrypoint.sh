#!/bin/bash

envsubst '$$NGINX_PORT $$NGINX_HOST $$TARGET $$FIWARE_SERVICE_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
rm -f /etc/nginx/conf.d/default.conf.template

exec nginx -g 'daemon off;'