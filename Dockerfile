FROM php:8.0-fpm-alpine

RUN apk --update add gcc make autoconf libc-dev wget curl git icu-dev

RUN rm /var/cache/apk/* && mkdir -p /var/www
RUN pecl install redis

RUN docker-php-ext-configure intl
RUN docker-php-ext-install mysqli pdo_mysql intl
RUN docker-php-ext-enable redis
