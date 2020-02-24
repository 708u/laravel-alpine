FROM php:7.4.3-fpm-alpine
LABEL maintainer=708-U

# Install packages and extensions includes only using development.
RUN apk --update-cache --no-cache add \
        curl \
        libzip-dev \
        libpng-dev \
        autoconf \
        gcc \
        g++ \
        make \
        git \
        bash \
        icu-dev \
        oniguruma-dev && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis && \
    docker-php-ext-install \
        intl \
        pdo_mysql \
        mbstring \
        zip \
        opcache \
        bcmath \
        redis \
        gd && \
    pecl install xdebug-2.8.1 && \
    docker-php-ext-enable xdebug
