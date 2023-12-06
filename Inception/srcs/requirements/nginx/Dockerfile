FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install nginx -y && mkdir -p /etc/nginx/ssl && apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=aperrein.42.fr/UID=aperrein"

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
