FROM php:7.4-fpm-alpine

RUN apk --update add wget curl git icu-dev

RUN rm /var/cache/apk/* && mkdir -p /var/www
RUN pecl install redis-5.1.1

RUN docker-php-ext-configure intl
RUN docker-php-ext-install mysqli pdo_mysql intl json
RUN docker-php-ext-enable intl redis
