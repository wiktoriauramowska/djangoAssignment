docker network create geodjango_network

#django
docker stop django_app
docker rm django_app
docker image rm django_image

docker build -t django_image .
docker create --name django_app --network geodjango_network --network-alias django_net -t -p 8001:8001 django_image

docker start django_app

docker exec -it django_project python manage.py makemigrations
docker exec -it django_project python manage.py migrate

# # pgadmin
docker stop pgadmin4
docker rm pgadmin4
docker create --name pgadmin4 --network geodjango_network --network-alias pgadmin_net -t \
-v v_pgadmin:/var/lib/pgadmin \
-p 8082:80 \
-e 'PGADMIN_DEFAULT_EMAIL=wiktoria.uramowska@mytudublin.ie' \
-e 'PGADMIN_DEFAULT_PASSWORD=mypassword' dpage/pgadmin4

docker start pgadmin4

# #postgis
docker stop postgis
docker rm postgis
docker create --name postgis --network geodjango_network \
--network-alias postgis_net -t -p 25432:5432 \
-v assignment:/var/lib/postgresql kartoza/postgis
docker start postgis