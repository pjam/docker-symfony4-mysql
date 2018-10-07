#
# PHP Dependencies
#
FROM shippingdocker/php-composer:latest as vendor
WORKDIR /app

COPY htdocs/composer.json composer.json
COPY htdocs/composer.lock composer.lock

RUN composer global require hirak/prestissimo

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

#
# Application
#
FROM php:7.2-apache-stretch

RUN apt-get update && apt-get install -y \
      libicu-dev \
      libpq-dev \
      zlib1g-dev \
      vim curl debconf subversion git apt-transport-https apt-utils iproute2 \
      build-essential locales acl mailutils wget zip unzip iputils-ping \
      gnupg gnupg1 gnupg2 \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-install \
      intl \
      mbstring \
      pcntl \
      pdo_mysql \
      pdo_pgsql \
      pgsql \
      zip \
      opcache

RUN pecl install xdebug

ENTRYPOINT ["entrypoint"]

RUN echo "ServerName $(/sbin/ip route|awk '/default/ { print $3 }')" >> /etc/apache2/apache2.conf
RUN echo 'alias ll="ls -la"' >> /root/.bashrc

COPY docker/application/disable-xdebug.sh /disable-xdebug.sh
COPY docker/application/enable-xdebug.sh /enable-xdebug.sh
COPY docker/application/entrypoint /usr/local/bin/entrypoint
RUN chmod +x /disable-xdebug.sh /enable-xdebug.sh /usr/local/bin/entrypoint

COPY docker/application/symfony.conf /etc/apache2/sites-available/symfony.conf
RUN a2dissite 000-default.conf && a2ensite symfony.conf && a2enmod rewrite

COPY --from=vendor /usr/bin/composer /usr/bin/composer
COPY --from=vendor /app/vendor /var/www/vendor
CMD ["apache2-foreground"]

