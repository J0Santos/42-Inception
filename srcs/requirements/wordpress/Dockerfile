FROM debian:10.12

RUN apt update && apt -y install curl

RUN apt install -y php7.3 \
                   php7.3-fpm \
                   php7.3-mysql \
                   php7.3-json \
                   php7.3-common \
                   php7.3-mbstring \
                   php7.3-curl \
                   php7.3-dom \
                   php7.3-exif \
                   php7.3-fileinfo \
                   php7.3-imagick \
		   php7.3-cli \
                   php7.3-xml \
                   php7.3-zip
					
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress/


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

#Copy tools to download wordpress
COPY ./conf/www.conf /tmp/
COPY ./conf/wp-config.php /tmp/
COPY ./tools/create_wp.sh /tmp/

CMD [ "bash", "/tmp/create_wp.sh" ]
