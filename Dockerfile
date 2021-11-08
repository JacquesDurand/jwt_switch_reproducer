ARG PHP_VERSION=7.4

FROM php:${PHP_VERSION}-fpm-alpine

RUN set -eux \
    && apk update --no-cache \
    && apk upgrade --no-cache \
    && apk add --no-cache \
        autoconf \
        g++ \
        make \
        postgresql-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install \
        pdo \
        pdo_pgsql

COPY . /var/www/repro
WORKDIR /var/www/repro

CMD ["php-fpm"]