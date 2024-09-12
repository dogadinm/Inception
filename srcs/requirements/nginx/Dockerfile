FROM debian:12

RUN apt-get update && apt-get install nginx openssl -y && \
        rm -rf /var/lib/apt/lists/*

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default

RUN  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt -subj "/CN=mdogadin"

CMD ["nginx", "-g", "daemon off;"]