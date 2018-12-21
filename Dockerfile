FROM php:7.2.3-fpm
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN mkdir /app
WORKDIR /app

RUN apt-get update && apt-get install -y git libmcrypt-dev zlib1g-dev libpq-dev zip unzip && \
    apt-get clean

RUN curl -sS https://getcomposer.org/installer | php && \
    mv ./composer.phar /usr/local/bin/composer

RUN composer global config repositories.packagist composer https://packagist.jp && \
    composer global require hirak/prestissimo

EXPOSE 9000
