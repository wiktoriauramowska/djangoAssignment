# !/bin/bash

#docker network create geodjango_network

# nginx
#docker stop django_nginx
#docker rm django_nginx
#docker rmi nginx_image
#docker build -t nginx_image ./nginx
#docker create --name django_nginx --network geodjango_network --network-alias nginx_net \
#-p 80:80 -p 443:443 -t \
#-v wmap_web_docker data:/usr/share/nginx/html \
#-v /etc/letsencrypt:/etc/letsencrypt \
#-v /var/www/certbot \
#-v html_data:/usr/share/nginx/html/static \
#nginx_image
#docker start django_nginx

#django
docker stop django_app
docker rm django_app
docker image rm django_image

docker build -t django_image .
docker create --name django_app --network geodjango_network --network-alias django_net -t -p 8001:8001 django_image

docker start django_app

docker exec -it django_app python manage.py makemigrations
docker exec -it django_app python manage.py migrate

## # pgadmin
#docker stop pgadmin4
#docker rm pgadmin4
#docker create --name pgadmin4 --network geodjango_network --network-alias pgadmin_net -t \
#-v v_pgadmin:/var/lib/pgadmin \
#-p 8082:80 \
#-e 'PGADMIN_DEFAULT_EMAIL=wiktoria.uramowska@mytudublin.ie' \
#-e 'PGADMIN_DEFAULT_PASSWORD=mypassword' dpage/pgadmin4

#docker start pgadmin4

# #postgis
#docker stop postgis
#docker rm postgis
#docker create --name postgis --network geodjango_network \
#--network-alias postgis_net -t -p 25432:5432 \
#-v assignment:/var/lib/postgresql kartoza/postgis
#docker start postgis
