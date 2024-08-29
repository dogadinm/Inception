FROM debian:12


RUN apt update -y && apt install php8.2 php-fpm php-mysql curl -y

COPY ./requirements/wordpress/conf/script.sh /
# COPY ./requirements/wordpress/conf/wp-config.php /


CMD [ "/script.sh" ]
