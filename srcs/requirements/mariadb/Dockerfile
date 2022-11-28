FROM debian:10.12

RUN apt update && apt install -y mariadb-server mariadb-client \
				#re-create /var/lib/mysql with appropriate ownership
				&& mkdir -p /var/run/mysqld \
				&& chown -R mysql:mysql /var/run/mysqld \ 
				#make sure /var/run/mysql is writable with whatever UID our mysqld instance has at runtime
				&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/create_db.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/create_db.sh
ENTRYPOINT [ "/usr/local/bin/create_db.sh" ]

CMD [ "mysqld", "--bind-address=0.0.0.0" ]