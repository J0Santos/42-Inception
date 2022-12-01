#!/bin/bash

sleep 10;

	#update config file
	cp -f /tmp/wp-config.php /var/www/wordpress/

	chmod 644 /var/www/wordpress/wp-config.php;
	
	wp core install --url="josantos.42.fr" --title="inception" --admin_name="josantos" --admin_password="1234abc" --admin_email="josantos@42lisboa.com" --allow-root
	#Import env vars into config file
	#cd /var/www/html/wordpress
	#sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	#sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	#sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	#sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	#mv wp-config-sample.php wp-config.php
	wp user create "jose" "jose@student.42lisboa.com" --user_pass="1234" --allow-root

service php7.3-fpm start;

service php7.3-fpm stop;

php-fpm7.3 -F -R;
