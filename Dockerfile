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
    # Install dependencies for laravel.
    # https://laravel.com/docs/6.x
    docker-php-ext-install \
        bcmath \
        pdo_mysql \
        mbstring \
        intl \
        zip \
        opcache \
        gd

RUN pecl install redis-5.1.1 && \
    pecl install xdebug-2.8.1 && \
    docker-php-ext-enable redis xdebug
