#Base OS image
FROM debian:10.12

#Update OS
RUN apt update \
		&& apt install nginx -y \
		&& apt install openssl -y
		
#Generate self certificate
RUN openssl req -x509 \
				-nodes \
				-days 365 \
				-newkey rsa:4096 \
				-keyout /etc/ssl/josantos.42.fr.key \
				-out /etc/ssl/josantos.42.fr.pem \
				-subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=Inception/CN=josantos.42.fr"

#Create server root dir
RUN mkdir -p /var/www/wordpress

#Adding wordpress server config file in sites-available

#Adding config to nginx
COPY ./conf/wordpress /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
