#!/bin/bash

mysql_install_db

/etc/init.d/mysql start

#Create data_base if none exists
if [ -f "/var/lib/mysql/${DB_NAME}" ]; then
	echo "Database already exists"
else
	# creating database
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
	# creating user MYSQL_USER %
	mariadb -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	# creating user MYSQL_USER local
	mariadb -u root -e "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
	mariadb -u root -e "FLUSH PRIVILEGES;"
	echo "${DB_NAME} created database"
fi



# #Add a root user on 127.0.0.1 for remote connection
# 	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVELEGES;" | mysql -uroot

# #Create database and user for wp
# 	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# #Import db
# mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
# fi

/etc/init.d/mysql stop

mysqld;
