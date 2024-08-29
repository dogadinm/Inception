FROM debian:12


ARG MYSQL_DATABASE \
    MYSQL_USER \
    MYSQL_PASSWORD

EXPOSE 3306

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./requirements/mariadb/tools/create_user.sh /
RUN bash ./create_user.sh

RUN rm -rf create_user.sh

CMD ["mysqld_safe"]