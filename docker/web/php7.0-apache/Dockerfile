FROM php:7.0-apache

COPY configs/apache2/app.conf /etc/apache2/sites-available/app.conf
RUN apt-get update \
    && apt-get install -y libpq-dev p7zip-full \
    && docker-php-ext-install pgsql pdo_pgsql mbstring \
    && pecl install dbase-7.0.0beta1 \
    && docker-php-ext-enable dbase \
    && mkdir /var/www/app \
    && mkdir /var/www/app/www \
    && mkdir /var/www/app/logs \
    && a2enmod rewrite \
    && a2ensite app \
    && service apache2 restart

WORKDIR /var/www/app