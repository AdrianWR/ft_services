FROM alpine:latest
RUN ["mkdir", "-p", "/run/mysqld"]
RUN ["mkdir", "-p", "/tmp"]
RUN apk add --update --no-cache mysql mysql-client
RUN apk add --update --no-cache telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY ["srcs/mysql.cnf", "/etc/my.cnf.d/mariadb-server.cnf"]
COPY ["srcs/mysql.sql", "/tmp/mysql.sql"]
COPY ["srcs/setup.sh", "/tmp/setup.sh"]
RUN ["chmod", "755", "/tmp/setup.sh"]
EXPOSE 3306 33060
ENTRYPOINT ["/tmp/setup.sh"]
