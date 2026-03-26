FROM alpine:3.18

RUN apk add --no-cache \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-session \
    php82-xml \
    php82-curl \
    php82-mbstring \
    php82-iconv \
    php82-phar \
    mariadb-client \
    wget \
    tar

# symlink due to wp requirment of php not php82
RUN ln -s /usr/bin/php82 /usr/bin/php

# Replace adress to listen to from defoult to 0.0.0.0
RUN sed -i 's|127.0.0.1:9000|0.0.0.0:9000|g' /etc/php82/php-fpm.d/www.conf

# Install wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Create working directory
WORKDIR /var/www/html

COPY tools/init-wp.sh /init-wp.sh
RUN chmod +x /init-wp.sh

# Increase of memory limit for init-wp script
RUN echo "memory_limit = 512M" >> /etc/php82/php.ini

ENTRYPOINT ["/init-wp.sh"]
