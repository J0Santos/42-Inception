FROM debian:10.12

RUN apt update && apt -y install wget \
					php \
					php-cgi \
					php-mysql \
					php-fpm \
					php-pdo \
					php-gd \
					php-cli \
					php-mbstring

WORKDIR /var/www/html/
#Copy tools to download wordpress
COPY ./conf/www.conf /tmp/

#Create folder to enable php start
RUN mkdir /run/php

#Script
COPY ./tools/create_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wp.sh
ENTRYPOINT [ "/usr/local/bin/create_wp.sh" ]


EXPOSE 9000

CMD [ "/usr/sbin/php-fmp7.3", "-F" ]