#!/bin/bash

if [ -f ./wp-config.php]
then
	echo "wordpress already downloaded"
else
	#Download wp
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

	#update config file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ./conf/www.conf /etc/php/7.3/fpm/pool.d/

	#Import env vars into config file
	cd /var/www/html/wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

service php7.3-fpm start;

service php7.3-fpm stop;

php-fpm7.3 -F -R;