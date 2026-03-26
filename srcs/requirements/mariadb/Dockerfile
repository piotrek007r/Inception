FROM alpine:3.18

RUN apk add --no-cache mariadb mariadb-client

COPY conf/my.cnf /etc/my.cnf
COPY tools/init-db.sh /usr/local/bin/init-db.sh

RUN chmod +x /usr/local/bin/init-db.sh

ENTRYPOINT ["/usr/local/bin/init-db.sh"]
# CMD ["mysqld", "--user=mysql"]
# if u want to use CMD put exec "$@" in script
