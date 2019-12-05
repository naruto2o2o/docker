FROM php:7.2-fpm
COPY "php/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN docker-php-ext-install pdo pdo_mysql  mysqli \
    && pecl install protobuf && pecl install grpc
