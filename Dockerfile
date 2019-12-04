FROM php:7.3.12-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -ex && \
  apk add --update-cache --no-cache --virtual=.build-dependencies tzdata && \
  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  echo "Asia/Tokyo" > /etc/timezone && \
  apk del .build-dependencies && \
  apk add --no-cache libxml2 libxml2-dev curl curl-dev autoconf $PHPIZE_DEPS && \
  docker-php-ext-install mysqli pdo pdo_mysql xml mbstring curl session tokenizer json && \
  pecl install xdebug && \
  docker-php-ext-enable xdebug && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  composer config -g repos.packagist composer https://packagist.jp && \
  composer global require hirak/prestissimo

COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
