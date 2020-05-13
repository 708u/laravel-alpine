FROM php:7.4.4-fpm-alpine
LABEL maintainer=708-U

# Install packages and extensions depended on Laravel.
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
        oniguruma-dev \
    && rm -rf /var/cache/apk/* \
    && git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis \
    # Install dependencies for laravel.
    # https://laravel.com/docs/6.x
    && docker-php-ext-install \
        bcmath \
        pdo_mysql \
        intl \
        zip \
        opcache \
        redis \
        gd \
    && docker-php-source delete \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && composer global require hirak/prestissimo
