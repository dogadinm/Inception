#!/bin/bash

# create directory to use in nginx container later and also to setup the wordpress conf
mkdir /var/www/
mkdir /var/www/wordpress
cd /var/www/wordpress

if [ ! -f wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
	chmod +x wp-cli.phar 
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root

	chown -R www-data:www-data /var/www/wordpress

	wp config create --dbhost=${WP_DB_HOST} \
					--dbname=${WP_DB_NAME} \
					--dbuser=${WP_DB_USER} \
					--dbpass=${WP_DB_PASSWORD} \
					--allow-root

	wp core install --url=${WP_URL} \
					--title=${WP_TITLE} \
					--admin_user=${WP_ADMIN_USER} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_MAIL} \
					--skip-email --allow-root

	wp option get siteurl --allow-root
	wp option get home --allow-root



	wp user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
fi

 
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm8.2 -F