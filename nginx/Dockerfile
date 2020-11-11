# Dockerfile to generate a Docker image for nginx - to be
# used in a GeoDjango project
# Start from the official Nginx image
FROM nginx

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.old
COPY headers.conf /etc/nginx/conf.d
COPY server.conf /etc/nginx/conf.d

EXPOSE 8080