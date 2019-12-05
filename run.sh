docker run -d  \
--name php-jin \
-v  /Users/jinzhiwen/Desktop/work:/work \
-v /Users/jinzhiwen/Desktop/docker/php/:/usr/local/etc/  \
php-fpm:jin "-R"

docker run --name nginx-jin  -d \
-v /Users/jinzhiwen/Desktop/work:/work \
-v /Users/jinzhiwen/Desktop/docker/nginx/conf/:/etc/nginx/ \
-p 0.0.0.0:80:80 -p 0.0.0.0:443:443 \
#--link php-jin:php  nginx
