FROM debian:jessie
ARG MAX_EXECUTION_TIME
ARG SERVER_NAME

RUN apt-get update && apt-get install -y nginx

# Configure Nginx
ADD nginx.conf /etc/nginx/
RUN sed "/fastcgi_read_timeout 60s;/c\  fastcgi_read_timeout ${MAX_EXECUTION_TIME}s;" -i /etc/nginx/nginx.conf
ADD nginxer.conf /etc/nginx/sites-available/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf
RUN usermod -u 1000 www-data

# Configure the virtual host
RUN ln -s /etc/nginx/sites-available/nginxer.conf /etc/nginx/sites-enabled/nginxer
RUN rm /etc/nginx/sites-enabled/default

# Run Nginx
CMD ["nginx"]

# Expose ports
EXPOSE 80
EXPOSE 443
