#!/bin/sh
set -e

# Wait for MariaDB to be ready
echo "Waiting for MariaDB..."
until mysqladmin ping -h "mariadb" --silent; do
    echo -n "."
    sleep 1
done
echo "MariaDB is ready!"

# Configure WordPress if wp-config.php does not exist
if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root --debug
    wp config create --debug \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$(cat /run/secrets/db_password)" \
        --dbhost="mariadb" \
        --allow-root
fi

# Install WordPress if not installed
if ! wp core is-installed --allow-root; then
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="Inception Site" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
fi

# Create second user if missing
if ! wp user get "$WP_USER" --allow-root >/dev/null 2>&1; then
    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --role=author \
        --user_pass="$WP_USER_PASSWORD" \
        --allow-root
fi

# Start PHP-FPM in foreground
exec php-fpm82 -F