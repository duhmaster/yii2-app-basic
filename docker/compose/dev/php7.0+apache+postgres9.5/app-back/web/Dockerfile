FROM chudoyoudo/php7.0-apache:0.1.3

RUN apt-get install -y curl git \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo 'xdebug.remote_enable=on' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo 'xdebug.remote_connect_back=on' >> /usr/local/etc/php/conf.d/xdebug.ini \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && service apache2 restart