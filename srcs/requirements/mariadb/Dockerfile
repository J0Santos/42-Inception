FROM debian:10.12

RUN apt update && apt install -y mariadb-server mariadb-client \
				#re-create /var/lib/mysql with appropriate ownership
				&& mkdir -p /var/run/mysqld \
				&& chown -R mysql:mysql /var/run/mysqld \ 
				#make sure /var/run/mysql is writable with whatever UID our mysqld instance has at runtime
				&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/create_db.sh /tmp/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/ 
RUN chmod +x /tmp/create_db.sh

CMD [ "bash", "/tmp/create_db.sh" ]
