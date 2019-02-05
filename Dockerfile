FROM php:7

# Install APT packages.
RUN apt-get update && apt-get upgrade --assume-yes && apt-get install --assume-yes \
    git \
    iproute2 \
    less \
    openssl \
    unzip \
    vim \
    wget \
    zip && \
    rm --force --recursive /var/lib/apt/lists/*

# Install Composer.
ADD scripts/install-composer.sh /usr/local/bin/install-composer
RUN install-composer && mv composer.phar /usr/local/bin/composer

# RUN docker-php-ext-install pdo mbstring
# WORKDIR /app
# COPY . /app
# RUN composer install

# CMD php artisan serve --host=0.0.0.0 --port=8181
# EXPOSE 8181

# https://buddy.works/guides/laravel-in-docker
# https://kyleferg.com/laravel-development-with-docker/
