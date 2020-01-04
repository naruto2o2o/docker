docker run -d  \
--name php-jin \
-e TZ=Asia/Shanghai \
-v  /Users/jinzhiwen/Desktop/work:/work \
-v /Users/jinzhiwen/Desktop/mine/docker/php/:/usr/local/etc/  \
-v /Users/jinzhiwen/Desktop/mine/docker/log/:/log  \
php-fpm:v1 "-R"

docker run --name nginx-jin  -d \
-e TZ=Asia/Shanghai \
-v /Users/jinzhiwen/Desktop/work:/work \
-v /Users/jinzhiwen/Desktop/mine/docker/nginx/conf/:/etc/nginx/ \
-v /Users/jinzhiwen/Desktop/mine/docker/log/:/log  \
-p 0.0.0.0:80:80 -p 0.0.0.0:443:443 \
--link php-jin:php  nginx

