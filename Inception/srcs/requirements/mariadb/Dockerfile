FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/auto_run.sh /var/auto_run.sh
RUN chmod +x /var/auto_run.sh

#EXPOSE 3306
ENTRYPOINT ["sh", "/var/auto_run.sh"]
