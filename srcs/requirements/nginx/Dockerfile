FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y

# COPY ./requirements/wordpress/conf/script.sh /
COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default

RUN  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt -subj "/CN=mdogadin.42.cz"

CMD ["nginx", "-g", "daemon off;"]