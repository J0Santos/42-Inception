#Base OS image
FROM debian:10.12

#Update OS
RUN apt update && apt -y upgrade \
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

#Adding config to nginx
COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]