FROM php:7.4.3-fpm-alpine
MAINTAINER 708-U

# Install packages and extensions includes only using development.
RUN apk --update-cache --no-cache add curl libzip-dev libpng-dev autoconf gcc g++ make bash \
    && rm -rf /var/cache/apk/* \
    && docker-php-ext-install zip \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gd \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable xdebug
