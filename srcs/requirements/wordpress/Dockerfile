FROM debian:12


RUN apt update -y && apt install php8.2 php-fpm php-mysql curl -y && \
        rm -rf /var/lib/apt/lists/*

COPY ./requirements/wordpress/conf/script.sh /

CMD [ "./script.sh" ]
