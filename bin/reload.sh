#!/bin/sh

docker exec -it container_nginx_nginxer cp /var/www/nginxer/docker/nginx/nginxer.conf /etc/nginx/sites-available/
docker exec -it container_nginx_nginxer service nginx reload
