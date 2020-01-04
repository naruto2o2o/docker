FROM php:7.2-fpm
COPY "php/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN apt-get update \
    && apt-get -y install bzip2 \
    && apt-get -y install libbz2-dev libjpeg-dev \ 
    && apt-get -y install libpng-dev 
RUN docker-php-ext-install bcmath 
RUN docker-php-ext-install bz2 
RUN docker-php-ext-install calendar 
RUN docker-php-ext-install      gd  
RUN docker-php-ext-install   mysqli    
RUN docker-php-ext-install     pdo_mysql  

RUN pecl install protobuf && pecl install grpc











    



























