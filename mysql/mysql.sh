 sudo docker run -d  -p  3306:3306 --name mysql \
   -v ~/Desktop/docker/mysql/volum/mysql/logs:/var/log/mysql \
   -v ~/Desktop/docker/mysql/volum/data:/var/lib/mysql-files \
   -e MYSQL_ROOT_PASSWORD=123456 \
   --user root  mysql
