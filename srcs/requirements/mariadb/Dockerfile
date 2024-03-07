FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /

RUN chmod +x /init.sh

EXPOSE 3306

RUN /init.sh

CMD ["mysqld"]