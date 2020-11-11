# Dockerfile to generate a Docker image for nginx - to be
# used in a GeoDjango project
# Start from the official Nginx image
FROM nginx

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.old
COPY .cache/temp_nginx_config.conf /etc/nginx/conf.d
COPY /static/ /usr/share/nginx/html/static

EXPOSE 8001